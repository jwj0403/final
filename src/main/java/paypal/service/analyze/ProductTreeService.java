package paypal.service.analyze;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import paypal.dao.analyze.AnalyzeDao;

@Service("productTreeService")
public class ProductTreeService {
	
	@Autowired
	@Qualifier("analyzeDao")
	private AnalyzeDao dao;

	/**
	 * 상품 트리 노드를 조회, 리턴한다.
	 * @return
	 */
	public String getProductNodes() {
		Gson gson = new Gson();
		String json = gson.toJson(dao.selectProductNodes());
		System.out.println("xxxx----\n" + json);
		return json;
	}

}
