package paypal.dao.member;

import paypal.dto.member.Member;

public interface MemberDao {

	void insertMember(paypal.dto.member.Member member);
	
//	void dropAccount(String memberId);

//	List<Member> getList();

	//가입시 기본 정보 등록을 위한 DB Insert
	Member getMemberByEmail(String email);
	//회원정보 수정
	void modifyMember(Member member);
	//회원 탈퇴
	void dropOutAccount(String email);

//	Member getMemberByIdAndPasswd(String id, String passwd);
	
//	Member getMemberByIdAndPasswdAndDeleted(String id, String passwd, String deleted);

//	Member getMemberByIdAndEdit(String id, String passwd, String phone, String email, String postNo, String address);
	

}