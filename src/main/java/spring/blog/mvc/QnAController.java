package spring.blog.mvc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.QnAController;
import spring.blog.mvc.service.QnAService;
import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

@Controller
@RequestMapping("/blog/*")
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	@Autowired
	private QnAService service;
	
		//글쓰기 
		@RequestMapping("qnaForm")
		public String qnaForm(Model model,
				@RequestParam(value="num",defaultValue="0") int num) {
			model.addAttribute("num",num);
			return "qna/qnaForm";
		}
		
		@RequestMapping("qnaPro")
		public String qnaPro(BoardDTO dto, HttpServletRequest request, List<MultipartFile> fileList) {
			int filecount = 0, result=0; 
			for(MultipartFile f : fileList) {  //파일 갯수대로 증가
				if(!f.getOriginalFilename().equals("")) {
					filecount++;
				}
			}
			dto.setFiles(filecount);
			service.write(dto); // 글쓰기 넘김 
			if( filecount > 0) {
				String filePath = request.getServletContext().getRealPath("/resources/file/qna/");
				result = service.fileInsert(fileList, filePath);
			}
			return "redirect:/blog/qnaList";
		}
		
		//글 내용 보기 
		@RequestMapping("qnaView")
		public String qnaView(Model model, int num, int pageNum, HttpSession session) {
			BoardDTO article = service.readContent(num);
			int grade = 0;
			String id = "";
			if(session.getAttribute("memId") != null) {
				id = (String) session.getAttribute("memId");
				grade = service.selectGrade(id);
			}
			List<FilesDTO> fileList = null;
			if(article.getFiles()>0) {
				fileList = service.fileList(num);
			}
			model.addAttribute("grade",grade);
			model.addAttribute("id",id);
			model.addAttribute("article",article);
			model.addAttribute("fileList",fileList);
			model.addAttribute("pageNum",pageNum);
			return "qna/qnaView";
		}
		
		//글목록 
		@RequestMapping("qnaList")
		public String qnaList(Model model, @RequestParam(value="pageNum", defaultValue="1") int pageNum) {
			service.list(pageNum, model);
			return "qna/qnaList";
		}
		
		//글 삭제 
		@RequestMapping("qnaDeleteForm")
		public String qnaDeleteForm (Model model, int num, int pageNum) {
			
			model.addAttribute("num",num);
			model.addAttribute("pageNum",pageNum);
			
			return "qna/qnaDeleteForm";
		
		}
		@RequestMapping("qnaDeletePro")
		public String qnaDeletePro(HttpServletRequest request, Model model, int num,int pageNum) {
	
			String filePath = request.getServletContext().getRealPath("/resources/file/qna/");
			
			int check = service.deleteNum(num, filePath);
			
			model.addAttribute("check",check);
			model.addAttribute("pageNum",pageNum);
			
			return "redirect:/blog/qnaList";
		}
}
