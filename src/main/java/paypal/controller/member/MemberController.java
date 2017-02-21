package paypal.controller.member;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import paypal.common.util.Util;
import paypal.dto.member.Member;
import paypal.service.member.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	@Qualifier(value = "memberService")
	private MemberService memberService;	

	//가입 양식 불러오기.
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(@ModelAttribute Member member) {		
		return "member/registerform";
	}
			
	//가입 정보 등록을 위한 DB Insert 실행 메서드.
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(Member member, BindingResult result) {	
		
		member.setPasswd(Util.getHashedString(member.getPasswd(), "SHA-256"));
		
		//정보 분석을 위한 지역 정보 입력 (시/도 까지만 입력)
		member.setAddress1(member.getAddress2().split(" ")[0]);		
		memberService.insertMemberTx(member);	
		
		return "redirect:/";
	}
	

	//내 정보 페이지 보여주기.
	@RequestMapping(value = "mypage.action", method = RequestMethod.GET)
	//public String mypage(@RequestParam("memberid") String memberId, Model model) {
	public String mypage(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginuser");
		
		if (member.getEmail() == null || member.getEmail().length() == 0) {
			return "redirect:/";
		}
		
		member = memberService.getMemberByEmail(member.getEmail());

//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String regdate = transFormat.format(member.getRegdate());
						
		model.addAttribute("member", member);
//		model.addAttribute("regdate", regdate);

		return "member/mypage";
	}
		
	//아이디 중복 체크
	@RequestMapping(value="emailcheck.action", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	@ResponseBody()
	public String emailCheck(String email, Model model) {
		
		Member member = memberService.getMemberByEmail(email);
		
		String message = "";
		
		if(member != null) {
			message = String.format("%s은(는) 이미 가입 된 이메일 주소입니다.", member.getEmail());
		} else if (((email.indexOf('@')) <=0) || (email.indexOf('.')<=0)) {
			message = "이메일 주소를 바르게 입력해 주세요.";
		} else {
			message = "가입 되어 있지 않은 이메일 주소입니다.";
		}
			
		return message;
	}	

	//내 정보 수정 양식 불러오기.
	@RequestMapping(value = "editform.action", method = RequestMethod.GET)
//	public String view(@RequestParam("memberid") String memberId, Model model) {
	public String editForm(String email, Model model) {
			
		if (email == null || email.length() == 0) {
			return "redirect:/";
		}
		
		Member member = memberService.getMemberByEmail(email);
		//정보 분석을 위한 지역 정보 입력 (시/도 + 시/군/구 까지 입력)
		String[] add = member.getAddress2().split(" "); 
		member.setAddress1(add[0] + " " + add[1]);
		
		model.addAttribute("member", member);				
		
		return "member/editform";
	}
	
	//내 정보 수정 하기.
	@RequestMapping(value = "modifymember.action", method = RequestMethod.POST)
	public String modifyMember(Member member, BindingResult result) {	
		member.setPasswd(Util.getHashedString(member.getPasswd(), "SHA-256"));
		memberService.modifyMemberTx(member);	
		
		return "redirect:/";
		
	}
	
	//회원 탈퇴. 
	@RequestMapping(value = "dropout.action", method = RequestMethod.POST)
	public String dropOut(Member member, HttpSession session) {
		
		memberService.dropOutAccount(member.getEmail());
		session.removeAttribute("loginuser");
		
		return "member/dropout";
	}
	
	
	//--------------------로그인 관리------------------
	@RequestMapping(value = "login.action", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginform";
	}
	@RequestMapping(value = "login.action", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	//@ResponseBody
	public String login(String email, String passwd, HttpSession session) {
		
		passwd = Util.getHashedString(passwd, "SHA-256");		
		
		Member member = memberService.getMemberLoginData(email, passwd);
		
		//Member member = memberService.getMemberByEmail(email);
		//String message = "";
		
//		if(member == null) {
//			message = "가입 정보가 없습니다. 가입 후 시도해 주세요.";
		//}  if (member.getDeleted().equals("D")) {
			//message = "탈퇴 한 회원입니다.";
//		}  if (passwd.equals(member.getPasswd())) {
//			message = "로그인 되었습니다.";
//		} else {
//			message = "비밀번호를 확인 해주세요.";
//		}
		
		if (member != null) {			
			//세션에 로그인 정보 저장
			session.setAttribute("loginuser", member);
			// Binding Session Listener
			//session.setAttribute("listener", SessionBindingListener.getInstance());
			//session.setAttribute("listener", new SessionBindingListener());
			return "redirect:/"; 
		} else {
			return "member/loginform";
		}		
//		return message;
	}
	
	//로그아웃
	@RequestMapping(value = "logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");
		return "redirect:/";
	}
	
	
}

