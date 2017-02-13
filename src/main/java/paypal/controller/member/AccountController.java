package paypal.controller.member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import paypal.common.util.Util;
import paypal.dao.member.MemberDao;
import paypal.dto.member.Member;
//import paypal.listener.notify.SessionBindingListener;
import paypal.service.member.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class AccountController {
	
//	@Autowired
//	@Qualifier(value = "memberService")
//	private MemberService service;	
//	
//	@Autowired
//	@Qualifier("memberDao")
//	private MemberDao dao;
//	
//	public void setMemberDao(MemberDao memberDao) {
//		this.dao = memberDao;
//	}
//	
//	@RequestMapping(value = "login.action", method = RequestMethod.GET)
//	public String loginForm() {
//		return "member/loginform";
//		// /WEB-INF/views/ + account/loginform + .jsp
//	}
//	@RequestMapping(value = "login.action", method = RequestMethod.POST)
//	public String login(String deleted, String memberId, String passwd, HttpSession session) {
//		passwd = Util.getHashedString(passwd, "SHA-256");		
//		
//		Member member = dao.getMemberByIdAndPasswdAndDeleted(memberId, passwd, deleted);
//		
//		if (member != null) {			
//			//세션에 로그인 정보 저장
//			session.setAttribute("loginuser", member);			
//			// Binding Session Listener
//			//session.setAttribute("listener", SessionBindingListener.getInstance());
////			session.setAttribute("listener", new SessionBindingListener());
//			
//			return "redirect:/"; 
//		} else {
//			return "member/loginform";
//		}		
//
//	}
//	
//	@RequestMapping(value = "logout.action", method = RequestMethod.GET)
//	public String logout(HttpSession session) {
//		session.removeAttribute("listener");
//		session.removeAttribute("loginuser");//로그아웃
//		session.invalidate();
//		return "redirect:/";
//	}
//		
//	
//	@RequestMapping(value = "drop.action", method = RequestMethod.GET)
//	public String drop(String memberId, HttpSession session) {
//		
//		memberId = ((Member)session.getAttribute("loginuser")).getMemberId();
//		
//		service.dropAccount(memberId);
//					
//		session.removeAttribute("loginuser");
//		
//		return "redirect:/"; 
//	}
//	
//	@RequestMapping(value = "edit.action", method = RequestMethod.POST)
//	@ResponseBody
//	public String edit(@Valid Member member, BindingResult result, Model model, HttpSession session, 
//			String memberId, String phone, String email, String passwd, String postNo, String address) {	
//		
//        passwd = Util.getHashedString(passwd, "SHA-256");
//		memberId = ((Member)session.getAttribute("loginuser")).getMemberId();
//		
//		dao.getMemberByIdAndEdit(memberId, passwd, phone, email, postNo, address);		
//
//		if (result.hasErrors()) {
//		}		
//			
//		if (member != null) {	
//			//세션에 로그인 정보 저장
//			session.setAttribute("loginuser", member);
//		} else {
//			return "member/editform";
//		}			
//		return "success";		
//	}
//	
//	
//	@RequestMapping(value = "editform.action", method = RequestMethod.GET)
//	public String view(@RequestParam("memberid") String memberId, Model model) {
//			
//			if (memberId == null || memberId.length() == 0) {
//				return "redirect:/main/index.action";
//			}
//			
//			Member member = dao.getMemberById(memberId);
//			model.addAttribute("member", member);				
//		
//		return "member/editform";
//	}
	
}


