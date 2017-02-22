package paypal.dao.main;

import paypal.dto.main.MainTransportProDto;
import paypal.dto.main.MainTransportTotDto;

public interface MainDao {

//	void insertMember(MainTransportTotDto mainTransportTotDto);
	void insertPayInfo(MainTransportTotDto mainTransportTotDto);
	void insertProductInfo(MainTransportProDto mainTransportProDto);


}

