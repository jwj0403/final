package paypal.controller.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import paypal.dao.main.MainDao;
import paypal.dto.main.MainTransportTotDto;
import paypal.service.main.MainService;

@Controller
public class MainController {


	private Gson gson = new Gson();
	
	@Autowired
	@Qualifier(value = "mainService")
	private MainService service;	
	
	@Autowired
	@Qualifier("mainDao")
	private MainDao dao;
	public void setMain(MainDao mainDao) {
		this.dao = mainDao;
	}
	
	@RequestMapping(value = "/")
	public String showIndexPage() {
		
		return "home";
	}
	
	@CrossOrigin
	@RequestMapping(value="/returnorderinfo.action", method={RequestMethod.GET,RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String postConnectedFromAnyMall(String key) {		
		 System.out.println("키값 들어옴 : " + key);		 
		 return key;
	}
	
	@CrossOrigin
	@RequestMapping(value="/getorderinfo.action", method={RequestMethod.GET,RequestMethod.POST})
	public void orderInfoFromAnyMall(@RequestParam("result") String result){
		
	    System.out.println("데이터 들어옴 : " + result);
   
	    
	    if(!result.equals("error")){
	    	//에러가 아닐때 데이터처리 함
		    MainTransportTotDto mainTransportTotDto = gson.fromJson(result, MainTransportTotDto.class);	    
	    	
		    
		    System.out.println(mainTransportTotDto.getEmail());
		    System.out.println(mainTransportTotDto.getGender());
		    System.out.println(mainTransportTotDto.getPhone());
		    System.out.println(mainTransportTotDto.getAddress3());
		    
	    	service.insertMainTx(mainTransportTotDto);
			
	    }
	    	    
	}
	
	
}


















