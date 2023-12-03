package spring.blog.mvc.service;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;
import spring.blog.mvc.repository.ImgMapper;

@Service
public class ImgServiceImpl implements ImgService{

	private static final Logger logger = LoggerFactory.getLogger(ImgServiceImpl.class);
	
	@Autowired
	private ImgMapper mapper;
	@Autowired
	private HashMap<String, Integer> boardMap;
	@Autowired
	private HashMap<Integer, FilesDTO> imgMap;
	
	@Override
	public int write(List<MultipartFile> filelist, BoardDTO dto, String path) {
		int check = 0;
		int files = 0;
		for (MultipartFile file : filelist) {
			if(!file.getOriginalFilename().equals("")) {
				files++;
			}
		}
		dto.setFiles(files);
		check = mapper.imgWirte(dto);
		return check;
	}

	@Override
	public int fileUpload(List<MultipartFile> filelist, String path) {
		int result = 0;
		int boardnum = mapper.maxNum();
		for (int i = 1; i <= filelist.size(); i++) {
			MultipartFile file = filelist.get(i-1);
			String filename = file.getOriginalFilename();
			if(!filename.equals("")) {
				String ext = filename.substring(filename.lastIndexOf("."));
				filename = "file_"+boardnum+"_"+i+ext;
				File copy = new File(path+filename);
				result = mapper.imgFileInsert(boardnum, filename);
				try {
					file.transferTo(copy);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	@Override
	public void showimgList(int pageNum, Model model) {
		int pageSize = 10;
		int start = (pageNum -1) * pageSize +1;
		int end = pageNum * pageSize;
		int cnt = mapper.listCount();
		List<BoardDTO> userList = Collections.EMPTY_LIST;
		if(cnt > 0) {
			boardMap.put("start", start);
			boardMap.put("end", end);
			userList = mapper.showList(boardMap);
			for (BoardDTO boardDTO : userList) {
				imgMap.put(boardDTO.getNum(),mapper.readfiles(boardDTO.getNum()).get(0));
			}
		}
		model.addAttribute("userList", userList);
		model.addAttribute("imgMap", imgMap);
		model.addAttribute("userCnt", cnt);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageNum", pageNum);
		
		//page
		int pageCnt = cnt / pageSize + (cnt % pageSize == 0 ? 0 : 1);
		int pageBlock = 10;
		int startPage = (int)(pageNum/10)*10+1;
		int endPage = startPage + pageBlock -1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
	}

	@Override
	public void readcountUp(int num) {
		mapper.readcountUp(num);
	}
	
	@Override
	public void read(int num, Model model) {
		BoardDTO dto = mapper.readBoard(num);
		List<FilesDTO> fileList = mapper.readfiles(num);
		model.addAttribute("dto", dto);
		model.addAttribute("fileList", fileList);
	}
	
	@Override
	public void readReply(int num, Model model) {
		List<BoardDTO> list = mapper.readReplyBoard(num);
		int check = 0;
		if(list != null) {
			check = list.size();
		}
		model.addAttribute("replyList", list);
		model.addAttribute("check", check);
	}
	
	@Override
	public int delete(int num, String path) {
		int check = mapper.deleteBoard(num);
		if(check==1) {
			List<FilesDTO> fileList = mapper.readfiles(num);
			for (FilesDTO dto : fileList) {
				File file = new File(path+dto.getFilename());
				if(file.isFile()) {
					file.delete();
				}
			}
			mapper.deletefiles(num);
		}
		return check;
	}

	@Override
	public int update(BoardDTO dto) {
		int check = mapper.updateBoard(dto);
		return check;
	}



}
