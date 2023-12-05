package spring.blog.mvc;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String guestBookInsert(@RequestParam(value="pageNum", defaultValue="1") int pageNum, Model model, HttpSession session) {
		GuestBookService.guestBookList(pageNum, model);
		
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
	
	@RequestMapping("content")
	public String content(Model model, String id) {
		List<BoardDTO> boardList = GuestBookService.myBoardList(id);
		model.addAttribute("boardList", boardList);
		
		return "guestbook/content";
	}
	
	
}
