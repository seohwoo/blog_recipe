package spring.blog.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.MemberDTO;
import spring.blog.mvc.service.GuestBookService;
import spring.blog.mvc.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private GuestBookService GuestBookService;
	
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
	public String Main(HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		model.addAttribute("id", id);
		return "member/main";
	}
	
	 
	@RequestMapping("myPage")
	public String myPage(Model model, String id, HttpSession session) {
		MemberDTO dto = service.member(id);
		model.addAttribute("dto", dto);
		
		List<BoardDTO> boardList = GuestBookService.myBoardList(id);
		model.addAttribute("boardList", boardList);
		
		
		return "member/myPage";
	}
	
	// TEST
	@RequestMapping("uploadPro")
	public String uploadPro(Model model, HttpSession session, HttpServletRequest request, MultipartFile image) {
		String id = (String) session.getAttribute("memId");
		String path = request.getServletContext().getRealPath("/resources/file/user/");
		boolean result = service.imageChange(id, path, image);
		model.addAttribute("result", result);
		return "member/uploadPro";
	}
	
	
	
}
