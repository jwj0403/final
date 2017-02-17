package paypal.dao.analyze;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import paypal.dto.analyze.AnalyzeCondition;
import paypal.dto.analyze.AnalyzeData;
import paypal.dto.analyze.ProductNode;
import paypal.model.mapper.AnalyzeMapper;

@Repository(value = "analyzeDao")
public class AnalyzeDaoImpl implements AnalyzeDao {
	@Autowired
	@Qualifier("analyzeMapper")
	private AnalyzeMapper mapper;

	/**
	 * 데이터 분석
	 */
	@Override
	public List<AnalyzeData> selectAnalyzedData(AnalyzeCondition con) {
		return mapper.selectAnalyzedData(con);
	}

	/**
	 * 상품 트리 조회
	 */
	@Override
	public ProductNode selectProductNodes() {
		ProductNode node = new ProductNode(); // 0 depth Temp Node
		node.setId("node-전체-0");
		node.setNodeDepth(0);
		node.setNodeName("전체");
		
		List<ProductNode> children = mapper.selectProductNodes();
		if (children != null && children.size() > 0) {
			node.setChildren(children);
		}
		return node;
	}
}
