package paypal.dao.member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import paypal.dto.member.Member;
import paypal.model.mapper.MemberMapper;

@Repository(value = "memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	//가입시 기본 정보 등록을 위한 DB Insert
	@Override
	public void insertMember(Member member) {
		memberMapper.insertMember(member);
	}
	
	//회원정보 조회
	@Override
	public Member getMemberByEmail(String email) {
		Member member = memberMapper.selectMemberByEmail(email);
		return member;
	}
	
	//회원 정보 수정
	@Override
	public void modifyMember(Member member) {
		memberMapper.updateMemberByEmail(member);
	}
	//회원 탈퇴
	@Override
	public void dropOutAccount(String email) {
		memberMapper.deleteMemberByEmail(email);
	}

	
	
	//로그인 정보 불러오기
	@Override
	public Member getMemberLoginData(String email, String passwd) {

		HashMap<String, Object> param = new HashMap<>();
		param.put("email", email);
		param.put("passwd", passwd);
		
		Member member = memberMapper.selectMemberLoginData(param);
		
		return member;
	}

	
}









