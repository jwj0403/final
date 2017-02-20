package paypal.dto.main;

import java.util.Date;
import java.util.List;

import org.json.JSONArray;

public class MainTransportTotDto {
	
	//key value(보낼 주소 : /mall/product/requestorderinfo.action)
	private String memberId; //전달할 멤버아이디
	private int orderListNo; //전달할 주문번호
	private String category1; //분석후 보낼 카테고리1
	private String category2; //분석후 보낼 카테고리2
	private String clientNo;
	
	//멤버에 대한 정보
	private String name;
	private String gender;
	private Date birth;
	private String phone;
	private String email;
	
	//주소
	private String zipCode;
	private String address1;
	private String address2;
	private String address3;	

	private List<MainTransportProDto> orderListInfo;
	
	private int pay_no;
	

	
	
	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getClientNo() {
		return clientNo;
	}

	public void setClientNo(String clientNo) {
		this.clientNo = clientNo;
	}

	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getOrderListNo() {
		return orderListNo;
	}


	public void setOrderListNo(int orderListNo) {
		this.orderListNo = orderListNo;
	}


	public String getCategory1() {
		return category1;
	}


	public void setCategory1(String category1) {
		this.category1 = category1;
	}


	public String getCategory2() {
		return category2;
	}


	public void setCategory2(String category2) {
		this.category2 = category2;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getAddress3() {
		return address3;
	}


	public void setAddress3(String address3) {
		this.address3 = address3;
	}


	public List<MainTransportProDto> getOrderListInfo() {
		return orderListInfo;
	}


	public void setOrderListInfo(List<MainTransportProDto> orderListInfo) {
		this.orderListInfo = orderListInfo;
	}


}
