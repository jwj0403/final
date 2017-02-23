package paypal.controller.notice;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String writeForm() {
		return "notice/writeform";
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
		return "notice/list2";
	}

	//공지 세부사항 보여 주기.
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public String noticeByNo(Model model, String noticeNo) {
		
		Notice notice = noticeService.getNoticeByNo(noticeNo);
		model.addAttribute("notice", notice);

		return "notice/detail";
	}

	//공지 수정 폼 불러 오기.
	@RequestMapping(value = "modifyform.action", method = RequestMethod.GET)
	public String modifyForm(String noticeNo, Model model) {
		Notice notice = noticeService.getNoticeByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/modifyform";
	}
	//수정한 공지 내용 DB에 Insert.
	@RequestMapping(value="modify.action", method=RequestMethod.POST) 
	public String modifyNotice (Notice notice) {
		noticeService.modifyNoticeTx(notice);
		return "redirect:list.action";
	}

	//공지 삭제하기(deleted falg를 'D'로 업데이트)
	@RequestMapping(value="delete.action", method=RequestMethod.POST)
	public String deleteNotice (String noticeNo) {
		noticeService.deleteNoticeTx(noticeNo);
		return "redirect:/";
	}
	
	
}


