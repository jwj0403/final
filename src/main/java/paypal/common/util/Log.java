package paypal.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Log {
	private String path = "C:\\bigdata\\lab\\spring\\andromeda\\andromeda\\src\\main\\resources\\andromeda\\model\\mapper\\";
	private String fileName;
	private String id;
	private File file;
	private NodeList nodeList;
	private static boolean printable = true;
	private boolean b = false;
	
	public Log() {
		
	}
	
	public Log(String fileName) {
		this.fileName = fileName;
		this.makeXmlFile();
	}
	
	public Log(String fileName, String id) {
		this.fileName = fileName;
		this.id = id;
		this.makeXmlFile();
		this.makeDocumentNodeList();
	}
	
	public Log(String path, String fileName, String id) {
		this.path = path;
		this.fileName = fileName;
		this.id = id;
		this.makeXmlFile();
		this.makeDocumentNodeList();
	}
	
	public void setPath(String path) {
		this.path = path;
		if (this.fileName != null && !"".equals(fileName)) {
			this.makeXmlFile();
		}
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
		if (this.path != null && !"".equals(path)) {
			this.makeXmlFile();
		}
	}
	
	public void setPf(String path, String fileName) { // path and filename
		this.path = path;
		this.fileName = fileName;
		this.makeXmlFile();
	}
	
	public void setPfi(String path, String fileName, String id) {//path and filename and id
		this.path = path;
		this.fileName = fileName;
		this.id = id;
		this.makeXmlFile();
		this.makeDocumentNodeList();
	}
	
	public void setId(String id) {
		this.id = id;
		this.makeDocumentNodeList();
	}
	
	private void makeXmlFile() {
		this.file = new File(this.path, this.fileName);
	}
	
	private void makeDocumentNodeList() {
		FileInputStream fis = null;
	    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder builder;
	    Document doc = null;
	    
		try {
			fis = new FileInputStream(this.file);
			builder = factory.newDocumentBuilder();
			doc = builder.parse(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
		doc.getDocumentElement().normalize();
		
	    Element root = doc.getDocumentElement();
	    NodeList childList = root.getChildNodes();
	    this.nodeList = childList;
	}
	
	public void prq(Object ... obj) {
		if (Log.printable) {
			this.b = true;
			this.prqF(obj);
		}
	}
	
	public void prqF(Object ... obj) {
		if (this.b) {
			Node queryNode = this.getQueryNode();
			List<String> idList = this.getIncludedRefIds(queryNode);
			String queryString = "";
			for (int i = 0; i < idList.size(); i++) {
				queryString += this.getQueryString(idList.get(i));
			}
			queryString += this.getMainQuery(queryNode);
			
			this.printQuery(queryString, obj);
		}
		this.b = false;
	}
	
	private Node getQueryNode() {
	    Node node = null;
	    if (nodeList != null) {
		    for (int i = 0; i < nodeList.getLength(); i++) {
		    	node = (Node) nodeList.item(i);
		    	NamedNodeMap map = node.getAttributes();
		    	if (map != null) {
			    	for (int j = 0; j < map.getLength(); j++) {
			    		Node n = map.item(j);
			    		if (n.getNodeName().equals("id") && n.getTextContent().equals(id)) {
			    			return node;
			    		}
			    	}
		    	}
		    }
	    }
	    return null;
	}
	
	private String getQueryString(String id) {
	    Node node = null;
	    if (nodeList != null) {
		    for (int i = 0; i < nodeList.getLength(); i++) {
		    	node = (Node) nodeList.item(i);
		    	NamedNodeMap map = node.getAttributes();
		    	if (map != null) {
			    	for (int j = 0; j < map.getLength(); j++) {
			    		Node n = map.item(j);
			    		if (n.getNodeName().equals("id") && n.getTextContent().equals(id)) {
			    			return node.getTextContent();
			    		}
			    	}
		    	}
		    }
	    }
	    return "";
	}
	
	/**
	 * include �깭洹몄씠硫� id �냽�꽦�쓣 List�뿉 ���옣�븳�떎.
	 * @param node
	 */
	private List<String> getIncludedRefIds(Node node) {
		List<String> idList = new ArrayList<>();
		if (node != null) {
			NodeList includeList = node.getChildNodes();
			for (int i = 0; i < includeList.getLength(); i++) {
				Node n = (Node) includeList.item(i);
				if ("include".equalsIgnoreCase(n.getNodeName())) {
					NamedNodeMap map = n.getAttributes();
					for (int j = 0; j < map.getLength(); j++) {
						Node attrNode = map.item(j);
						if (attrNode.getNodeName().equals("refid")) {
							idList.add(attrNode.getNodeValue());
						}
					}
				}				
			}
		}
		return idList;
	}
	
	private String getMainQuery(Node node) {
		NodeList list = node.getChildNodes();
		String query = "";
		for (int i = 0; i < list.getLength(); i++) {
			Node n = (Node) list.item(i);
			if (n.getNodeName().equals("#text")) {
				query = n.getNodeValue();
			}
		}
		return query;
	}
	
	private void printQuery(String query, Object ... obj) {
		for (int i = 0; i < obj.length; i++) {
			int first = query.indexOf("#{", 1);
			int last = query.indexOf("}", 1);
			String query1 = query.substring(0, first);
			String query2 = query.substring(last + 1);
			if (obj[i] instanceof Date) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String d = sdf.format(obj[i]);
				String date = "TO_DATE('" + d + "')";
				query = query1 + date + query2;
			} else {
				query = query1 + "'" + obj[i] + "'" + query2;
			}
		}
		System.out.println(query);
	}
	
	public static void pr(CharSequence cs) {
		if (Log.printable) {
			Log.pr(true, cs);
		}
	}
	
	public static void pr(boolean flag, CharSequence cs) {
		if (flag) {
			System.out.println(cs);
		}
	}
	
	public static void pr(Date date) {
		if (Log.printable) {
			Log.pr(true, date);
		}
	}
	
	public static void pr(boolean flag, Date date) {
		if (flag) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			System.out.println(sdf.format(date));
		}
	}
	
	public static void pr(boolean b) {
		if (Log.printable) {
			Log.pr(true, b);
		}
	}
	
	public static void pr(boolean flag, boolean b) {
		if (flag) {
			System.out.println(b);
		}
	}
	
	public static void pr(int i) {
		if (Log.printable) {
			Log.pr(true, i);
		}
	}
	
	public static void pr(boolean flag, int i) {
		if (flag) {
			System.out.println(i);
		}
	}
	
	public static void pr(long l) {
		if (Log.printable) {
			Log.pr(true, l);
		}
	}
	
	public static void pr(boolean flag, long l) {
		if (flag) {
			System.out.println(l);
		}
	}
	
	public static void pr(double d) {
		if (Log.printable) {
			Log.pr(true, d);
		}
	}
	
	public static void pr(boolean flag, double d) {
		if (flag) {
			System.out.println(d);
		}
	}
	
	public static void pr(Object obj) {
		if (Log.printable) {
			Log.pr(true, obj);
		}
	}
	
	public static void pr(boolean flag, Object obj) {
		if (flag) {
			System.out.println(obj);
		}
	}
}
