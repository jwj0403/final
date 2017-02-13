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
	
	@Override
	public void insertMember(Member member) {

		memberMapper.insertMember(member);
	}

//	@Override
//	public List<Member> getList() {
//		
//		List<Member> members = memberMapper.selectMembers();
//		
//		return members;
//	}
//	
//	@Override
//	public Member getMemberById(String id) {
//
//		Member member = memberMapper.selectMemberById(id);
//		
//		return member;
//	}
//	
//	@Override
//	public Member getMemberByIdAndPasswdAndDeleted(String id, String passwd, String deleted) {
//
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("memberId", id);
//		params.put("passwd", passwd);
//		params.put("deleted", deleted);
//		
//		Member member = memberMapper.selectMemberByIdAndPasswdAndDeleted(params);
//		
//		return member;
//	}
//	
//	
//	@Override
//	public Member getMemberByIdAndPasswd(String id, String passwd) {
//
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("memberId", id);
//		params.put("passwd", passwd);
//		
//		Member member = memberMapper.selectMemberByIdAndPasswd(params);
//		
//		return member;
//	}
//
//	
//	@Override
//	public Member getMemberByIdAndEdit(String id, String passwd, String phone, String email, String postNo, String address) {
//
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("memberId", id);
//		params.put("passwd", passwd);
//		params.put("phone", phone);
//		params.put("email", email);
//		params.put("postNo", postNo);
//		params.put("address", address);
//		
//		Member member = memberMapper.selectMemberByIdAndEdit(params);
//		
//		return member;
//	}
//	
//	
//	
//	@Override
//	public void dropAccount(String memberId) {
//		memberMapper.dropAccount(memberId);
//	}

	
}









