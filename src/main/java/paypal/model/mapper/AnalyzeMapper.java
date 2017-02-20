package paypal.model.mapper;

import java.util.List;

import paypal.dto.analyze.AnalyzeCondition;
import paypal.dto.analyze.AnalyzeData;
import paypal.dto.analyze.ProductNode;
import paypal.dto.analyze.XAxisLabel;

public interface AnalyzeMapper {
	List<AnalyzeData> selectAnalyzedData(AnalyzeCondition con);

	List<ProductNode> selectProductNodes();

	List<XAxisLabel> selectXAxisLabel(AnalyzeCondition con);
}
