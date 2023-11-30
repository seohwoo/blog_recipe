package spring.blog.mvc;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.blog.mvc.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("form")
	private String noticeForm(Model model, @RequestParam("boardnum") int boardnum) {
		
		
		return "notice/noticeForm";
	}
	
	@RequestMapping("formPro")
	private String noticeFormPro(Model model, HttpServletRequest request) {
		
		
		return "notice/noticePro";
	}
}
