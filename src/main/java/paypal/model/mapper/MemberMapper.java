package paypal.model.mapper;

import java.util.HashMap;
import java.util.List;

import paypal.dto.member.Member;

//com.mvcdemoweb.model.mapper.MemberMapper 파일에 대응하는 인터페이스
public interface MemberMapper {
	
	//회원 가입 정보 DB에 등록
	void insertMember(Member member);
	//Email로 회원 정보 조회
	Member selectMemberByEmail(String email);
	//회원 정보 수정
	void updateMemberByEmail(Member member);
	//회원 정보 삭제(탈퇴)
	void deleteMemberByEmail(String email);
	//로그인 정보 조회
	Member selectMemberLoginData(HashMap<String, Object> param);
}
