package paypal.controller.analyze;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import paypal.dto.analyze.AnalyzeCondition;
import paypal.service.analyze.AnalyzeService;

@Controller
public class AnalyzeController {
	@Autowired
	@Qualifier("analyzeService")
	private AnalyzeService service;
	
	@RequestMapping(value = "analyze/analyzeData.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String analyzeData(AnalyzeCondition con) {
		String analyzedJson = service.analyzeData(con);
		System.out.println("analyzedJson : " + analyzedJson);
		return analyzedJson;
	}
	
	@CrossOrigin
	@RequestMapping(value = "analyze/analyze.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String showBarChart(String request) {
		// 데이터 조회를 위해 Dynamic Query를 적절하게 조작하기 위해 넣어 주는 데이터
		System.out.println("request :" + request);
		Gson gson = new Gson();
		AnalyzeConditionForMall conditionFromMall = gson.fromJson(request, AnalyzeConditionForMall.class);
		AnalyzeCondition con = new AnalyzeCondition();
		con.setGroup("G");
		con.setAgeCompare("Compare");
		con.setAgeAllClicked("Not-Checked");
		con.setAreaAllClicked("Not-Checked");
		con.setTreeNodeDepth("1");
		con.setPeriod("All");
		con.setxAxisLabel("product");
		con.setAge(new String[] {conditionFromMall.getAge()});
		con.setArea(new String[] {conditionFromMall.getArea()});
		con.setGender(conditionFromMall.getGender());
		
		System.out.println("======\n" + gson.toJson(con));
		String analyzedJson = service.analyzeData(con);
		
		System.out.println("-------\n" + analyzedJson);
		return analyzedJson;
	}
}
