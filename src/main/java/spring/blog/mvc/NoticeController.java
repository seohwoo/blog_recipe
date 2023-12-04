package spring.blog.mvc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;
import spring.blog.mvc.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("form")
	public String noticeForm(Model model, @RequestParam(value="num", defaultValue="0" )int num) {
		
		model.addAttribute("num", num);
		return "notice/noticeForm";
	}
	
	@RequestMapping("formPro")
	public String noticeFormPro(BoardDTO dto, HttpServletRequest request, List<MultipartFile> filelist) {
		int uploadFile=0;
		int result=0;
		for(MultipartFile f : filelist) {
			if(!f.getOriginalFilename().equals("")) {
				uploadFile++;
			}
		}
		dto.setFiles(uploadFile);
		service.writeNotice(dto);
		
		if(uploadFile>0) {
			String filePath= request.getServletContext().getRealPath("/resources/file/board/");
			result = service.fileUpload(filelist, filePath);
		}
		return "redirect:/notice/list";
	}
	
	@RequestMapping("list")
	public String noticeList(Model model, @RequestParam(value="pageNum",required = true , defaultValue="1" )int pageNum) {
		service.noticeList(pageNum, model);
		
		
		return "notice/noticeList";
	}
	
	@RequestMapping("content")
	public String noticeContent(Model model, int num, int pageNum) {
		BoardDTO dto = service.readContent(num);
		int boardnum=num;
		int count = service.replyCount(num);
		List<BoardDTO> reply = service.replyList(boardnum);
		List<FilesDTO> filelist = null;
		if(dto.getFiles()>0) {
			filelist = service.readFiles(boardnum);
		}
		model.addAttribute("count", count);
		model.addAttribute("filelist", filelist);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);
		model.addAttribute("reply", reply);
		return "notice/noticeContent";
	}
	
	@RequestMapping("delete")
	public String noticeDelete(Model model, int num, int pageNum, HttpServletRequest request) {
		String filePath= request.getServletContext().getRealPath("/resources/file/board/");
		service.deleteContent(num, filePath);
		
		model.addAttribute("pageNum", pageNum);
		return "notice/noticeDelete";
	}
	
	@RequestMapping("update")
	public String noticeUpdate() {
		
		return "notice/noticeUpdate";
	}
	@RequestMapping("updatePro")
	public String noticeUpdatePro() {
		
		return "redirect:/notice/list";
	}
}
