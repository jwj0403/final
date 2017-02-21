package paypal.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import paypal.dao.notice.NoticeDao;
import paypal.dto.notice.Notice;



@Service(value="noticeService")
public class NoticeService {
	@Autowired
	@Qualifier(value = "noticeDao")
	private NoticeDao noticeDao;

//	public void insertMemberTx(Member member) {
//		memberDao.insertMember(member);
//	}

	public List<Notice> getNoticeList() {
		
		List<Notice> notice = noticeDao.getNoticeList();
		return notice;
	}

	public Notice getNoticeByNo(String noticeNo) {
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		return notice;
	}

//	public void modifyMemberTx(Member member) {
//		memberDao.modifyMember(member);
//	}
//
//	public void dropOutAccount(String email) {
//		memberDao.dropOutAccount(email);
//	}
//
//	public Member getMemberLoginData(String email, String passwd) {
//
//		Member member = memberDao.getMemberLoginData(email, passwd);
//		
//		return member;
//	}

}
