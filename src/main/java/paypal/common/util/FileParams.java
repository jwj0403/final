package paypal.common.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * 파일 업로드를 간편하게 하기 위해 작성하였다.<br>
 * WriteForm의 Enctype이 multipart/form-data일 때에만 쓴다.
 * @author Toran
 * @since 2017-02-13 *
 */
public class FileParams {
	private HttpServletRequest req;
	private String filePath;
	private String tempPath;
	private ServletContext app;
	private String realFilePath;
	private String realTempPath;
	private final String SUCCESS = "Success";
	private final String FAILURE = "Failure";
	private final String NONE = "None";
	private List<FileItem> items;
	private int min;
	private int max;
	private String resultString;
	private boolean isMultipart;
	private HashMap<String, String> map = new HashMap<>();
	
	/**
	 * 파일을 업로드하기 위해 필요한 정보를 매개변수로 하여 객체를 생성한다.
	 * @param req HttpServletRequest
	 * @param filePath 파일을 저장할 경로
	 * @param tempFilePath 대용량 파일의 임시경로
	 */
	public FileParams(HttpServletRequest req, String filePath, String tempFilePath, int capacityForMemory, int maxCapacity) {
		this.req = req;
		this.filePath = filePath;
		this.tempPath = tempFilePath;
		this.app = req.getSession().getServletContext();
		this.realFilePath = app.getRealPath(filePath);
		
		File realFilePathDir  = new File(realFilePath);
		if (!realFilePathDir.exists()) {
			realFilePathDir.mkdir();
		} else {
			
		}
		
		this.realTempPath = app.getRealPath(tempFilePath);
		this.min = capacityForMemory;
		this.max = maxCapacity;
		this.isMultipart = ServletFileUpload.isMultipartContent(req);
		this.parse();
	}
	
	private void parse() {
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * this.min);
		factory.setRepository(new File(tempPath));
		
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024 * this.max);
		
		if (isMultipart) {
			try {
				this.items = sfu.parseRequest(req);
				for (FileItem item : items) {
					if (!item.isFormField()) {
						String fieldName = item.getFieldName();
						String fileName = item.getName();
						String physicalName = Util.getUniqueFileName(fileName);
						this.makeMultipartMap(fieldName, fileName);
						this.makeMultipartMap(fieldName + "-physical", physicalName);
					} else {
						try {
							this.makeMultipartMap(item.getFieldName(), item.getString("utf-8"));
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 파일을 업로드한다.
	 * @param capacityForMemory 용량이 작아서 메모리에서 처리할 경우에 지정한다. 단위는 MB이다.
	 * @param maxCapacity 한계용량이다. 단위는 MB이다.
	 * @return 결과에 관한 문자열이다.
	 */
	public String upload() {
		if (!isMultipart) {
			return this.FAILURE;
		}
		
		try {
			for (FileItem item : items) {
				if (!item.isFormField()) {
					if (item.getSize() > 0) {
						String fileName = item.getName();
						if (fileName.contains("\\")) {
							fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
						}
						
						item.write(new File(realFilePath, this.map.get(item.getFieldName() + "-physical")));
						item.delete();
						resultString = this.SUCCESS;
					} else {
						resultString = this.FAILURE;
					}
				}
			}
			if (!this.isFileAttached()) {
				resultString = this.NONE;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultString;
	}
	
	private boolean isFileAttached() {
		Set<String> keySet = map.keySet();
		Iterator<String> iter = keySet.iterator();
		boolean isAttached = false;
		
		String key = "";
		while (iter.hasNext()) {
			key = iter.next();
			if (key.contains("file")) {
				isAttached = true;
			}
		}
		return isAttached;
	}
	
	/**
	 * 파라미터를 name, value의 쌍으로 <code>HashMap</code>에 매핑하여 리턴한다.
	 * @author Toran
	 * @return 파라미터명, 파라미터값의 맵 객체
	 * @since 2016-11-13
	 */
	public HashMap<String, String> getParamMap() {
		return this.map;
	}
	
	private void makeMultipartMap(String key, String value) {
		this.map.put(key, value);
	}
	
	/**
	 * 파라미터 밸류를 간단히 얻을 수 있도록 작성하였다.
	 * @author Toran
	 * @param paramName 파라미터 이름
	 * @return 파라미터 밸류
	 * @since 2016-11-13
	 */
	public String getValue(String paramName) {
		return this.map.get(paramName);
	}
	
	public HashMap<String, String> getMap() {
		return this.map;
	}

	public String getSucess() {
		return SUCCESS;
	}

	public String getFailure() {
		return FAILURE;
	}

	public String getNone() {
		return NONE;
	}
}
