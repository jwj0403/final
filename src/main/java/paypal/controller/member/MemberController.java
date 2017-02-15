package paypal.controller.member;

import java.text.SimpleDateFormat;

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
	
//	@Autowired
//	@Qualifier("memberDao")
//	private MemberDao memberDao;
	
	//가입 양식 불러오기.
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(
		//스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자 
		@ModelAttribute Member member) {		
		return "member/registerform0";
	}
			
	//가입시 기본 정보 등록을 위한 DB Insert 실행 메서드.
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(@Valid Member member, BindingResult result) {	
		
		if (result.hasErrors()) {
		}
		
		member.setPasswd(Util.getHashedString(member.getPasswd(), "SHA-256"));
		
		memberService.insertMemberTx(member);	
		
		return "redirect:/";
//		return "success";
		
	}
	
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

	//내 정보 페이지 보여주기.
	@RequestMapping(value = "mypage.action", method = RequestMethod.GET)
	//public String mypage(@RequestParam("memberid") String memberId, Model model) {
	public String mypage(String email, Model model) {
		
		email = "email@email.com";
		if (email == null || email.length() == 0) {
			return "redirect:/";
		}
		
		Member member = memberService.getMemberByEmail(email);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String regdate = transFormat.format(member.getRegdate());
						
		model.addAttribute("member", member);
		model.addAttribute("regdate", regdate);

		return "member/mypage";
	}
		
	//아이디 중복 체크
	@RequestMapping(value="idcheck.action", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody()
	public String idCheck(String email, Model model) {
		
		Member member = memberService.getMemberByEmail(email);
		
		String message = "";
		
		if(member != null) {
			message = String.format("%s은(는) 이미 가입 된 이메일 주소입니다.", member.getEmail());
		} else if (((email.indexOf('@')) <=0) || (email.indexOf('.')<=0)) {
			message = "이메일 주소의 형식을 확인 해주세요.\r(example@naver.com)";
		} else {
			message = "사용 가능한 이메일 주소입니다.";
		}
		
		return message;
	}	

	//내 정보 수정 양식 불러오기.
	@RequestMapping(value = "editform.action", method = RequestMethod.GET)
//	public String view(@RequestParam("memberid") String memberId, Model model) {
	public String editForm(String email, Model model) {
			
		email = "email@email.com";
		if (email == null || email.length() == 0) {
			return "redirect:/";
		}
			
		Member member = memberService.getMemberByEmail(email);
		model.addAttribute("member", member);				
		
		return "member/editform";
	}
	
	//내 정보 수정 하기.
	@RequestMapping(value = "modifymember.action", method = RequestMethod.POST)
	public String editMember(Member member, BindingResult result) {	
		
		if (result.hasErrors()) {
		}
		
		member.setPasswd(Util.getHashedString(member.getPasswd(), "SHA-256"));
		memberService.modifyMemberTx(member);	
		
		return "redirect:/";
//		return "success";
		
	}
	
	//회원 탈퇴. 
	@RequestMapping(value = "dropout.action", method = RequestMethod.GET)
	public String dropOut(String email) {
		//세션 파괴 및 포스트로 방식 변경
		memberService.dropOutAccount(email);
		
		return "member/dropout";
	}
	
	
}

