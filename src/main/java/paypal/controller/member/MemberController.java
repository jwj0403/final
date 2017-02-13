package paypal.controller.member;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import paypal.common.util.Util;
import paypal.dao.member.MemberDao;
import paypal.dto.member.Member;
import paypal.service.member.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	@Qualifier(value = "memberService")
	private MemberService memberService;	
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	public void setMemberDao(MemberDao memberDao) {
		this.dao = memberDao;
	}
//	
//	
//	@RequestMapping(value = "list.action", method = RequestMethod.GET)
//	public String list(Model model) {
//		
//		//1. 데이터 조회 (dao 사용)
//		List<Member> members = dao.getList();
//		
//		//2. 데이터 저장 (jsp에서 사용할 수 있도록)
//		model.addAttribute("members", members);
//		
//		//3. 뷰 반환
//		return "member/list";
//	}
//	
//	
	@RequestMapping(value = "mypage.action", method = RequestMethod.GET)
	//public String mypage(@RequestParam("memberid") String memberId, Model model) {
	public String mypage(String email, Model model) {
		
		email = "email@email.com";
		if (email == null || email.length() == 0) {
			return "redirect:/main/index.action";
		}
		
//		Member member = dao.getMemberById(memberId);
//		model.addAttribute("member", member);
		
		return "member/mypage";
	}
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(
		//스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자 
		@ModelAttribute Member member) {
		
		return "member/registerform";
	}
	
		
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	@ResponseBody
	public String register(@Valid Member member, BindingResult result) {	
		
		if (result.hasErrors()) {
		}
		
		member.setPasswd(Util.getHashedString(member.getPasswd(), "SHA-256"));
		
		memberService.insertMemberTx(member);
//		profService.insertProfileTx(profile);		
		
		return "/";
//		return "success";
		
	}	
//	
//	@RequestMapping(value="idCheck.action", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
//	@ResponseBody()
//	public String idCheck(String memberId, Model model) {
//		
//		Member member = dao.getMemberById(memberId);
//		
//		String message = "";
//		
//		if(member == null && memberId.length()>5) {
//			message = "사용가능한 아이디 입니다.";
//		} else if(memberId.length() < 6) {
//			message = "아이디가 너무 짧습니다.";
//		} else {
//			message = String.format("%s 는 존재하는 아이디 입니다.", member.getMemberId());
//		}
//		
//		
//		return message;
//	}	
	
	
}

