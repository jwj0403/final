package paypal.controller.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import paypal.dto.member.Member;
import paypal.dto.notice.Notice;
import paypal.service.notice.NoticeService;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {

	@Autowired
	@Qualifier(value = "noticeService")
	private NoticeService noticeService;
	

	//공지 작성 폼 불러 오기.
	@RequestMapping(value = "writeform.action", method = RequestMethod.GET)
	public String writeForm(HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginuser");
		if(member == null){
			return "redirect:/";
		} else if (member.getEmail().split("@")[1].equals("tarjane.com")) {
			return "notice/writeform";
		} else {
			return "redirect:list.action";
		}
		
	}
	//작성한 공지 내용 DB에 Insert.
	@RequestMapping(value="write.action", method=RequestMethod.POST) 
	public String writeNotice (Notice notice) {
		noticeService.writeNoticeTx(notice);
		return "redirect:list.action";
	}
	
	//공지 목록 보여 주기.
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String noticeList(Model model) {
		List<Notice> notice = noticeService.getNoticeList();
		model.addAttribute("notice", notice);
		return "notice/list";
	}

	//공지 세부사항 보여 주기.
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public String noticeByNo(Model model, int noticeNo) {
		
		//조회수 증가
		noticeService.increaseReadCount(noticeNo);
		//공지 내용 가져 오기
		Notice notice = noticeService.getNoticeByNo(noticeNo);
		//줄바꿈 처리
		notice.setContent(notice.getContent().replace("\r\n", "<br>"));
		//가져 온 공지 내용 jsp에서 읽을 수 있도록 설정.
		model.addAttribute("notice", notice);

		return "notice/detail";
	}

	//공지 수정 폼 불러 오기.
	@RequestMapping(value = "modifyform.action", method = RequestMethod.GET)
	public String modifyForm(HttpSession session, int noticeNo, Model model) {
		
		Member member = (Member) session.getAttribute("loginuser");
		if(member == null){
			return "redirect:/";
		} else if (member.getEmail().split("@")[1].equals("tarjane.com")) {
			Notice notice = noticeService.getNoticeByNo(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/modifyform";
		} else {
			return "redirect:list.action";
		}
	}
	//수정한 공지 내용 DB에 Insert.
	@RequestMapping(value="modify.action", method=RequestMethod.POST) 
	public String modifyNotice (Notice notice) {
		noticeService.modifyNoticeTx(notice);
		return "redirect:list.action";
	}

	//공지 삭제하기(deleted falg를 'D'로 업데이트)
	@RequestMapping(value="delete.action", method=RequestMethod.POST)
	public String deleteNotice (int noticeNo) {
		noticeService.deleteNoticeTx(noticeNo);
		return "redirect:list.action";
	}
	
	
}


