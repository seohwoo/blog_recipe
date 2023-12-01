package spring.blog.mvc;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.blog.mvc.bean.MemberDTO;
import spring.blog.mvc.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 회원가입 홈페이지
	@RequestMapping("inputForm")
	public String MemberInputForm() {
		return "member/inputForm";
	}
	
	// 회원가입 완료
	@RequestMapping("inputPro")
	public String MemberInsert(MemberDTO dto) {
		service.MemberInsert(dto);
		return "redirect:/member/loginForm";
	}
	
	//
	@RequestMapping("confirmId")
	public String confirmId(String id, Model model) {
		service.confirmId(id);
		int check = service.idCheck(id);
		model.addAttribute("id",id);
		model.addAttribute("check", check);
		return "member/confirmId";
	}
	
	// 로그인 홈페이지
	@RequestMapping("loginForm")
	public String MemberLoginForm() {
		return "member/loginForm";
	}
	
	// 로그인 완료
	@RequestMapping("loginPro")
	public String MemberLogin(MemberDTO dto, Model model) {
		int check = service.MemberLogin(dto);
		model.addAttribute("check", check);
		return "member/loginPro";
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/main";
	}
	
	
	@RequestMapping("main")
	public String Main() {
		return "member/main";
	}
	
	 
	@RequestMapping("myPage")
	public String myPage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		MemberDTO dto = service.member(id);
		model.addAttribute("dto", dto);
		return "member/myPage";
	}
	
	
	
	
	
}
