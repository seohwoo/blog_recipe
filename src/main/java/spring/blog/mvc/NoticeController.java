package spring.blog.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("form")
	private String noticeForm(Model model, @RequestParam(value="boardnum", defaultValue = "0") int boardnum, @RequestParam(value="num", defaultValue = "0") int num) {
		
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("num", num);
		return "notice/noticeForm";
	}
	
	@RequestMapping("formPro")
	private String noticeFormPro(BoardDTO dto, HttpServletRequest request, ArrayList<MultipartFile> files) {
		int uploadFile=0;
		int result=0;
		for(MultipartFile f : files) {
			if(!f.getOriginalFilename().equals("")) {
				uploadFile++;
			}
		}
		dto.setFiles(uploadFile);
		
		service.writeNotice(dto);
		
		if(uploadFile>0) {
			String filePath= request.getServletContext().getRealPath("/resources/file/board/");
			result = service.fileUpload(files, filePath);
		}
		return "redirect:/notice/list";
	}
	
	@RequestMapping("list")
	private String noticeList(Model model, @RequestParam(value="pageNum",required = true , defaultValue="1" )int pageNum) {
		service.noticeList(pageNum, model);
		
		return "notice/noticeList";
	}
}
