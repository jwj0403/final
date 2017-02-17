package paypal.controller.analyze;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value = "analyze/analyze.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String analyzeData(AnalyzeCondition con) {
		String analyzedJson = service.analyzeData(con);
		System.out.println("analyzedJson : " + analyzedJson);
		return analyzedJson;
	}
	
	@RequestMapping("/analyze/barchart.action")
	public String showBarChart() {
		return "analyze/bar";
	}
}
