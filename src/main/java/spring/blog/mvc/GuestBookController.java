package spring.blog.mvc;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.blog.mvc.bean.GuestBookDTO;
import spring.blog.mvc.bean.MemberDTO;
import spring.blog.mvc.service.GuestBookService;
import spring.blog.mvc.service.MemberService;

@Controller
@RequestMapping("/guestbook/*")
public class GuestBookController {
	
	@Autowired
	private GuestBookService service;
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping("writeForm")
	public String write(Model model, HttpSession session) {
		String id = (String) session.getAttribute("memId");
		MemberDTO dto = memberservice.member(id);
		model.addAttribute("dto", dto);
		
		List<GuestBookDTO> list = service.bookList();
		model.addAttribute("list", list);
		
		return "guestbook/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(GuestBookDTO dto) {
		service.write(dto);
		return "redirect:/guestbook/writeForm";
	}
	
	@RequestMapping("bookList")
	public String bookList(Model model) {
		List<GuestBookDTO> list = service.bookList();
		model.addAttribute("list", list);
		return "guestbook/bookList";
	}

}
