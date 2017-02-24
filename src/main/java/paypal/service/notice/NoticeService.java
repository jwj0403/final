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

	//작성 한 공지 글 DB에 쓰기.
	public void writeNoticeTx(Notice notice) {
		noticeDao.writeNotice(notice);
	}
	//공지 목록 가져 오기.
	public List<Notice> getNoticeList() {
		List<Notice> notice = noticeDao.getNoticeList();
		return notice;
	}
	//공지 번호로 공지글 가져 오기.
	public Notice getNoticeByNo(int noticeNo) {
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		return notice;
	}
	//공지 글 수정 하기.
	public void modifyNoticeTx(Notice notice) {
		noticeDao.modifyNotice(notice);
	}
	//공지 삭제하기.
	public void deleteNoticeTx(int noticeNo) {
		noticeDao.deleteNotice(noticeNo);
	}
	//조회수 증가
	public void increaseReadCount(int noticeNo) {
		noticeDao.increaseReadCount(noticeNo);
	}


}
