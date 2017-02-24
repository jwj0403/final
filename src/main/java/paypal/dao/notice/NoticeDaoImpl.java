package paypal.dao.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import paypal.dto.notice.Notice;
import paypal.model.mapper.NoticeMapper;

@Repository(value = "noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	@Qualifier("noticeMapper")
	private NoticeMapper noticeMapper;
	
//	//가입시 기본 정보 등록을 위한 DB Insert
//	@Override
//	public void insertMember(Member member) {
//		memberMapper.insertMember(member);
//	}

	//작성한 공지 DB에 입력 하기
	@Override
	public void writeNotice(Notice notice) {
		noticeMapper.insertNotice(notice);
	}
	//공지 목록 조회
	@Override
	public List<Notice> getNoticeList() {
		List<Notice> notice = noticeMapper.selectNoticeList();
		return notice;
	}
	//공지 세부 내용 조회
	@Override
	public Notice getNoticeByNo(int noticeNo) {
		Notice notice = noticeMapper.selectNoticeByNo(noticeNo);
		return notice;
	}
	@Override
	public void modifyNotice(Notice notice) {
		noticeMapper.updateNotice(notice);
	}
	@Override
	public void deleteNotice(int noticeNo) {
		noticeMapper.deleteNotice(noticeNo);
	}
	@Override
	public void increaseReadCount(int noticeNo) {
		noticeMapper.increaseReadCount(noticeNo);
	}
		
}









