package paypal.dao.analyze;

import java.util.List;

import paypal.dto.analyze.AnalyzeCondition;
import paypal.dto.analyze.AnalyzeData;
import paypal.dto.analyze.ProductNode;

public interface AnalyzeDao {

	List<AnalyzeData> selectAnalyzedData(AnalyzeCondition con);

	ProductNode selectProductNodes();

}