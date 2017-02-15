package paypal.model.mapper;

import java.util.HashMap;
import java.util.List;

import paypal.dto.member.Member;

//com.mvcdemoweb.model.mapper.MemberMapper 파일에 대응하는 인터페이스
public interface MemberMapper {

	void insertMember(Member member);

	Member selectMemberByEmail(String email);

	void updateMemberByEmail(Member member);

	void deleteMemberByEmail(String email);

//	void dropAccount(String memberId);
//	
//	void editAccount(String memberId);
//
//	List<Member> selectMembers();

//	Member selectMemberByIdAndPasswdAndDeleted(HashMap<String, Object> params);
//
//	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);
//	
//	Member selectMemberByIdAndEdit(HashMap<String, Object> params);
	
}
