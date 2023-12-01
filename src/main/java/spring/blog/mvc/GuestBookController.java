package spring.blog.mvc;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;
import spring.blog.mvc.bean.MemberDTO;
import spring.blog.mvc.service.GuestBookService;
import spring.blog.mvc.service.MemberService;

@Controller
@RequestMapping("/guestbook/*")
public class GuestBookController {
	
	@Autowired
	private GuestBookService GuestBookService;
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping("guestBookForm")
	public String guestBookInsert(Model model, HttpSession session) {
		List<BoardDTO> list = GuestBookService.guestBookList();
		model.addAttribute("list", list);

		String id = (String) session.getAttribute("memId");
		MemberDTO member = memberservice.member(id);
		model.addAttribute("member", member);
		return "guestbook/guestBookForm";
	}
	
	@RequestMapping("guestBookPro")
	public String guestBookInsertPro(BoardDTO dto, HttpSession session, Model model) {
		GuestBookService.guestBookInsert(dto);
		return "redirect:/guestbook/guestBookForm";
	}
}
