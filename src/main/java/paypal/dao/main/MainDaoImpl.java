package paypal.dao.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import paypal.dto.main.MainTransportProDto;
import paypal.dto.main.MainTransportTotDto;
import paypal.model.mapper.MainMapper;

@Repository(value = "mainDao")
public class MainDaoImpl implements MainDao {

	@Autowired
	@Qualifier("mainMapper")
	private MainMapper mainMapper;
	
	@Override
	public void insertMember(MainTransportTotDto mainTransportTotDto) {
		mainMapper.insertMemberMainTransportTotDto(mainTransportTotDto);		
	}	

	@Override
	public void insertPayInfo(MainTransportTotDto mainTransportTotDto) {
		mainMapper.insertPayInfoMainTransportTotDto(mainTransportTotDto);		
	}

	@Override
	public void insertProductInfo(MainTransportProDto mainTransportProDto) {
		mainMapper.insertProductInfoMainTransportProDto(mainTransportProDto);
		
	}


	
}



