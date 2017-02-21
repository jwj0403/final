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
	
	
	@RequestMapping(value="write.action", method=RequestMethod.GET) 
	public String writeNotice (Notice notice) {
		//writeNoticeTx
		return "notice/list";
	}
	
	//공지 목록 보여 주기.
	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public String noticeList(Model model) {
		
		List<Notice> notice = noticeService.getNoticeList();

//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String regdate = transFormat.format(notice.get(i).getRegdate());
						
		model.addAttribute("notice", notice);
		//model.addAttribute("regdate", regdate);

		return "notice/list";
	}

	//공지 세부사항 보여 주기.
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public String noticeByNo(Model model, String noticeNo) {
		
		Notice notice = noticeService.getNoticeByNo(noticeNo);

//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String regdate = transFormat.format(notice.get(i).getRegdate());
						
		model.addAttribute("notice", notice);
		//model.addAttribute("regdate", regdate);

		return "notice/detail";
	}
	
}


