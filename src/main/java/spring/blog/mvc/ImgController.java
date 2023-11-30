package spring.blog.mvc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.service.ImgService;

@Controller
@RequestMapping("/img/*")
public class ImgController {
	
	@Autowired
	private ImgService service;
	
	@RequestMapping("list")
	public String list() {
		return "img/imgList";
	}
	
	@RequestMapping("write")
	public String writeForm(HttpServletRequest request, Model model) {
		int boardnum = 0;
		if(request.getParameter("num") != null) {
			boardnum = Integer.parseInt(request.getParameter("num"));
		}
		model.addAttribute("boardnum", boardnum);
		return "img/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(List<MultipartFile> filelist, BoardDTO dto, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/resources/file/board/");
		int check = service.write(filelist, dto, path);
		int result = service.fileUpload(filelist, path);
		model.addAttribute("check", check);
		model.addAttribute("result", result);
		return "img/writePro";
	}
	
	
	
}
