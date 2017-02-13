package paypal.dao.member;

import java.util.List;

import paypal.dto.member.Member;

public interface MemberDao {

	void insertMember(paypal.dto.member.Member member);
	
//	void dropAccount(String memberId);
//
//	List<Member> getList();
//
//	Member getMemberById(String id);
//
//	Member getMemberByIdAndPasswd(String id, String passwd);
//	
//	Member getMemberByIdAndPasswdAndDeleted(String id, String passwd, String deleted);
//
//	Member getMemberByIdAndEdit(String id, String passwd, String phone, String email, String postNo, String address);
	

}