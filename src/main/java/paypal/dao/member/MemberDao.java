package paypal.dao.member;

import paypal.dto.member.Member;

public interface MemberDao {

	//회원 가입 정보 등록
	void insertMember(paypal.dto.member.Member member);
	//Email로 회원 정보 조회
	Member getMemberByEmail(String email);
	//회원정보 수정
	void modifyMember(Member member);
	//회원 탈퇴
	void dropOutAccount(String email);
	//Email과 Password로 회원 정보 조회(로그인 시 사용)
	Member getMemberLoginData(String email, String passwd);

}