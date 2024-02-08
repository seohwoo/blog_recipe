package spring.blog.mvc;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;
import spring.blog.mvc.service.ImgService;

@Controller
@RequestMapping("/img/*")
public class ImgController {
	
	@Autowired
	private ImgService service;
	
	
	@Autowired
	private ArrayList<String> srcValues;
	@Autowired
	private ArrayList<String> realFiles;
	
	
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
	
	@RequestMapping("create")
	public String create(Model model) {
		return "img/createBlog";
	}	
	
	
	@RequestMapping("editorPro")
	public String editorPro(String title, String writer, String content,String[] fileNames, HttpServletRequest request, Model model, String pageNum) {
		String fileRoot = request.getServletContext().getRealPath("/resources/summernoteImage/");
		String realRoot = request.getServletContext().getRealPath("/resources/realImage/");
		int cnt = 1;
		int check = 0;
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setContent(content.replace("src=\"/resources/summernoteImage/", "src=\"/resources/realImage/"));
		boardDTO.setBoardnum(0);
		boardDTO.setStars(0);
		boardDTO.setTitle(title);
		boardDTO.setWriter(writer);
		boardDTO.setFiles(cnt-1);
		check = service.imgWirte(boardDTO);
		int maxnum = service.lastImgNum().get(0).getNum();
	    if(fileNames != null) {
	    	isFile(fileNames, boardDTO.getContent());
			for (String filename : realFiles) {
				try {
					File sourceFile = new File(fileRoot+filename);
					File targetDirectory = new File(realRoot);
					String ext = filename.substring(filename.lastIndexOf("."));
					String realname = "file_" + maxnum + "_"+cnt+ext;
					service.imgFileInsert(maxnum, realname);
					Files.copy(sourceFile.toPath(), targetDirectory.toPath().resolve(realname), StandardCopyOption.REPLACE_EXISTING);
					cnt++;
					boardDTO.setContent(boardDTO.getContent().replace(filename, realname));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			for (String filename : fileNames) {
				File sourceFile = new File(fileRoot+filename);
				sourceFile.delete();
			}
			boardDTO.setFiles(cnt-1);
			boardDTO.setNum(maxnum);
			service.updateImgWrite(boardDTO);
	    }
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("check", check);
		return "/img/writePro";
	}
	 
	 public void isFile(String[] filenames, String content) {
		 srcValues.clear();
		 realFiles.clear();
		 Pattern pattern = Pattern.compile("src\\s*=\\s*\"([^\"]+)\"");
	     Matcher matcher = pattern.matcher(content);
	     while (matcher.find()) {
	         srcValues.add(matcher.group(1));
	     }
		 for (int i = 0; i < srcValues.size(); i++) {
			int lastSlashIndex = srcValues.get(i).lastIndexOf('/');
			if (lastSlashIndex != -1 && lastSlashIndex < srcValues.get(i).length() - 1) {
				srcValues.set(i, srcValues.get(i).substring(lastSlashIndex + 1));
			}
		 }
		 if(filenames.length != srcValues.size()) {
			 for (int i = 0; i < srcValues.size(); i++) {
				for (String filename : filenames) {
					if(filename.equals(srcValues.get(i))) {
						realFiles.add(srcValues.get(i));
					}
				}
			}
		 }else {
			 realFiles = srcValues;
		 }
	 }
	
	@RequestMapping(value = "uploadSummernoteImageFile", produces = "application/json", consumes = "multipart/form-data")
	public ResponseEntity<JsonNode> uploadSummernoteImageFile(@RequestPart("file") MultipartFile multipartFile,
	      HttpServletRequest request) {
	   ObjectMapper objectMapper = new ObjectMapper();
	   JsonNode responseJson;
	   String fileRoot = request.getServletContext().getRealPath("/resources/summernoteImage/");
		
	   try {
	      String originalFileName = multipartFile.getOriginalFilename();
	      String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	      String savedFileName = UUID.randomUUID() + extension;
	      Path targetPath = Path.of(fileRoot, savedFileName);
	      Files.copy(multipartFile.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);
		
	      String imageUrl = request.getContextPath() + "/resources/summernoteImage/" + savedFileName;
	      responseJson = objectMapper.createObjectNode()
	            .put("url", imageUrl)
	            .put("responseCode", "success")
	            .put("fileName", savedFileName);
	      return ResponseEntity.ok(responseJson);
	   } catch (IOException e) {
	      responseJson = objectMapper.createObjectNode().put("responseCode", "error");
	      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseJson);
	   }
	}
	
	
	
}
