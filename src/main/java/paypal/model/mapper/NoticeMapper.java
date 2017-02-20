package paypal.model.mapper;

import java.util.List;

import paypal.dto.notice.Notice;

public interface NoticeMapper {
	
//	//회원 가입 정보 DB에 등록
//	void insertMember(Member member);
//	//Email로 회원 정보 조회
	List<Notice> selectNoticeList();
//	//회원 정보 수정
//	void updateMemberByEmail(Member member);
//	//회원 정보 삭제(탈퇴)
//	void deleteMemberByEmail(String email);
//	//로그인 정보 조회
//	Member selectMemberLoginData(HashMap<String, Object> param);
}
