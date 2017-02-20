package paypal.service.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import paypal.dao.main.MainDao;
import paypal.dao.member.MemberDao;
import paypal.dto.main.MainTransportProDto;
import paypal.dto.main.MainTransportTotDto;
import paypal.dto.member.Member;


@Service(value="mainService")
public class MainService {

	@Autowired
	@Qualifier(value = "mainDao")
	private MainDao mainDao;
	
	public void insertMainTx(MainTransportTotDto mainTransportTotDto) {

//	    mainDao.insertMember(mainTransportTotDto);
		mainDao.insertPayInfo(mainTransportTotDto);
		
		System.out.println("vvvvv" + mainTransportTotDto.getPay_no());
		
		
	    for (MainTransportProDto mainTransportProDto : mainTransportTotDto.getOrderListInfo()) {

	    	System.out.println(mainTransportProDto.getProductName());

	    	mainTransportProDto.setPay_no(mainTransportTotDto.getPay_no());
			mainDao.insertProductInfo(mainTransportProDto);

	    }

	}	
	
}








