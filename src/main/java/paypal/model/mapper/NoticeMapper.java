package paypal.model.mapper;

import java.util.List;

import paypal.dto.notice.Notice;

public interface NoticeMapper {
	
	//작성 한 공지 글 DB에 등록
	void insertNotice(Notice notice);
	//공지 목록 조회
	List<Notice> selectNoticeList();
	//공지 번호로 공지 조회
	Notice selectNoticeByNo(String noticeNo);
	//공지 수정.
	void updateNotice(Notice notice);
	//공지 삭제.
	void deleteNotice(String noticeNo);
		
}
