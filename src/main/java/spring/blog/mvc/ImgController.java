package spring.blog.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;
import spring.blog.mvc.service.ImgService;

@Controller
@RequestMapping("/img/*")
public class ImgController {
	
	@Autowired
	private ImgService service;
	
	@RequestMapping("list")
	public String list(@RequestParam(value="pageNum", defaultValue="1")int pageNum, Model model) {
		service.showimgList(pageNum, model);
		return "img/imgList";
	}
	
	@RequestMapping("write")
	public String writeForm(HttpServletRequest request, Model model, int pageNum, @RequestParam(value="boardnum", defaultValue="0")int boardnum) {
		model.addAttribute("boardnum", boardnum);
		model.addAttribute("pageNum", pageNum);
		return "img/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(List<MultipartFile> filelist, BoardDTO dto, HttpServletRequest request, Model model, int pageNum) {
		String path = request.getServletContext().getRealPath("/resources/file/board/");
		int check = service.write(filelist, dto, path);
		int result = service.fileUpload(filelist, path);
		model.addAttribute("check", check);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "img/writePro";
	}
	
	@RequestMapping("content")
	public String content(int num, @RequestParam(value="pageNum", defaultValue="1")int pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		service.readcountUp(num);
		service.read(num, model);
		service.readReply(num, model);
		return "img/content";
	}
	
	@RequestMapping("delete")
	public String delete(int num, int pageNum, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "img/deleteForm";
	}
	
	@RequestMapping("deletePro")
	public String deletePro(int num, int pageNum, Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/resources/file/board/");
		int check = service.delete(num, path);
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		return "img/deletePro";
	}
	
	@RequestMapping("update")
	public String update(int num, int pageNum, Model model) {
		service.read(num, model);
		model.addAttribute("pageNum", pageNum);
		return "img/updateForm";
	}
	
	@RequestMapping("updatePro")
	public String updatePro(BoardDTO dto, int pageNum, Model model) {
		int check = service.update(dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("check", check);
		return "img/updatePro";
	}
	
	@RequestMapping("likes")
	public String likes(int num, int pageNum, Model model, @RequestParam(value="boardnum", defaultValue="0") int boardnum) {
		int check = service.likesUp(num);
		model.addAttribute("check", check);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("boardnum", boardnum);
		return "img/likesPro";
	}
	
	@RequestMapping("search")
	public String search(String search, Model model) {
		service.search(search, model);
		return "img/search";
	}	
}
