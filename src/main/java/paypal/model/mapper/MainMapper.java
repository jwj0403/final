package paypal.model.mapper;

import paypal.dto.main.MainTransportProDto;
import paypal.dto.main.MainTransportTotDto;

public interface MainMapper {

//	void insertMemberMainTransportTotDto(MainTransportTotDto mainTransportTotDto);

	void insertPayInfoMainTransportTotDto(MainTransportTotDto mainTransportTotDto);

	void insertProductInfoMainTransportProDto(MainTransportProDto mainTransportProDto);

	 

	
}
