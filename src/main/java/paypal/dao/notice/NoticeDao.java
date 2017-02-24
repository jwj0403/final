package paypal.dao.notice;

import java.util.List;

import paypal.dto.notice.Notice;

public interface NoticeDao {

	//작성 한 공지 글 DB에 쓰기.
	void writeNotice(Notice notice);
	//공지 목록 불러 오기
	List<Notice> getNoticeList();
	//공지 번호로 공지 내용 불러 오기
	Notice getNoticeByNo(int noticeNo);
	//공지 수정 하기.
	void modifyNotice(Notice notice);
	//공지 삭제하기.
	void deleteNotice(int noticeNo);
	//조회수 증가
	void increaseReadCount(int noticeNo);
	
//	//회원정보 수정
//	void modifyMember(Member member);
//	//회원 탈퇴
//	void dropOutAccount(String email);
//	//Email과 Password로 회원 정보 조회(로그인 시 사용)
//	Member getMemberLoginData(String email, String passwd);
	

	

}