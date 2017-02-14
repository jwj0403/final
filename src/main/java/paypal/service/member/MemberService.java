package paypal.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import paypal.dao.member.MemberDao;
import paypal.dto.member.Member;


@Service(value="memberService")
public class MemberService {
	@Autowired
	@Qualifier(value = "memberDao")
	private MemberDao memberDao;

	public void insertMemberTx(Member member) {
		memberDao.insertMember(member);
	}
//	public void dropAccount(String memberId) {
//		memberDao.dropAccount(memberId);
//	}

	public Member getMemberByEmail(String email) {
		
		Member member = memberDao.getMemberByEmail(email);
		
		return member;
	}

	public void dropOutAccount(String email) {
		memberDao.dropOutAccount(email);
	}

}
