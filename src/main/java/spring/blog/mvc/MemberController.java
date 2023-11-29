package spring.blog.mvc;

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
	
	@RequestMapping("inputForm")
	public String MemberInsert(Model model, MemberDTO dto) {
		service.MemberInsert(dto);
		model.addAttribute("dto", dto);
		return "member/inputForm";
	}
}
