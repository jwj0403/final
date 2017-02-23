package paypal.service.analyze;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import paypal.controller.analyze.AnalyzeConditionForMall;
import paypal.dao.analyze.AnalyzeDao;
import paypal.dto.analyze.AnalyzeCondition;


@Service(value="analyzeService")
public class AnalyzeService {
	@Autowired
	@Qualifier("analyzeDao")
	private AnalyzeDao dao;

	public String analyzeData(AnalyzeCondition con) {
		Gson gson = new Gson();
		String result = "{";
		result += 			"\"condition\" : " + gson.toJson(con) + ",";
		result += 			"\"data\" : " + gson.toJson(dao.selectAnalyzedData(con)) + ",";
		result += 			"\"xAxisLabel\" : " + gson.toJson(dao.selectXAxisLabel(con));
		result += "}";
		return result;
	}
}
