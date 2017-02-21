package paypal.controller.analyze;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import paypal.service.analyze.ProductTreeService;

@Controller
public class ProductTreeController {
	@Autowired
	@Qualifier("productTreeService")
	private ProductTreeService service;
	
	@RequestMapping("/analyze/chart.action")
	public String showChart() {
		return "analyze/tree";
	}
	
	@ResponseBody()
	@RequestMapping(value = "/analyze/productTreeChart.action", produces = "application/json;charset=UTF-8")
	public String showProductTreeChart(HttpSession session) {
		this.writeProductNodesJson(session);
		return "{}";
	}
	
	private void writeProductNodesJson(HttpSession session) {
		ServletContext app = session.getServletContext();
		String productNodesJson = service.getProductNodes();
		String path = "C:\\Users\\stu\\git\\final3\\src\\main\\webapp\\resources\\data\\"; // 서버에 올린 뒤에 서버경로로 바꿔 줄 것.
		//String path = "D:\\final\\final\\src\\main\\webapp\\resources\\data\\";
		String fileName = "p.json";
		File file = new File(path, fileName);
		
		System.out.println("file : " + file);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		
		try {
			fos = new FileOutputStream(file);
			osw = new OutputStreamWriter(fos);
			bw = new BufferedWriter(osw);
			bw.write(productNodesJson, 0, productNodesJson.length());
			bw.flush();
		} catch (IOException ie) {
			ie.printStackTrace();
		} finally {
			try {
				if (bw != null) {
					bw.close();
				}
				if (osw != null) {
					osw.close();
				}
				if (fos != null) {
					fos.close();
				}
			} catch (IOException ie) {
				ie.printStackTrace();
			}
		}
	}
}
