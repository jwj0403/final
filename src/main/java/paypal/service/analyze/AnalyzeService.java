package paypal.service.analyze;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import paypal.dao.analyze.AnalyzeDao;
import paypal.dto.analyze.AnalyzeCondition;


@Service(value="analyzeService")
public class AnalyzeService {
	@Autowired
	@Qualifier("analyzeDao")
	private AnalyzeDao dao;

	public String analyzeData(AnalyzeCondition con) {
		Gson gson = new Gson();
		return gson.toJson(dao.selectAnalyzedData(con));
	}

}
