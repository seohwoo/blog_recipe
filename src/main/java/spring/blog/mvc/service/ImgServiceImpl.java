package spring.blog.mvc.service;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
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
	private HashMap<Integer, String> imgMap;
	@Autowired
	private HashMap<Integer, Double> starMap;
	@Autowired
	private HashMap<Integer, Integer> cntMap;
	
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
		if(dto.getBoardnum() > 0) {
			int result = mapper.starsUp(dto.getStars(), dto.getBoardnum());
		}
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
		int pageSize = 6;
		int replyCnt = 0;
		int[] arStars = {1,2,3,4,5};
 		double avgStars = 0;
		String formatavgStars = "";
		int start = (pageNum -1) * pageSize +1;
		int end = pageNum * pageSize;
		int cnt = mapper.listCount();
		List<BoardDTO> userList = Collections.EMPTY_LIST;
		if(cnt > 0) {
			boardMap.put("start", start);
			boardMap.put("end", end);
			userList = mapper.showList(boardMap);
			for (BoardDTO boardDTO : userList) {
				replyCnt = mapper.ReplyBoardCnt(boardDTO.getNum());
				if(replyCnt >0) {
					avgStars = Math.round(((double) boardDTO.getStars() / replyCnt) * 10.0) / 10.0;
					starMap.put(boardDTO.getNum(), avgStars);
				}else {
					starMap.put(boardDTO.getNum(), (double) 0);
				}
				cntMap.put(boardDTO.getNum(), replyCnt);
				if(mapper.fileCnt(boardDTO.getNum())>0) {
					imgMap.put(boardDTO.getNum(),mapper.readfiles(boardDTO.getNum()).get(0));
				}else {
					imgMap.put(boardDTO.getNum(), "1111.jpg");
				}
			}
		}
		model.addAttribute("userList", userList);
		model.addAttribute("imgMap", imgMap);
		model.addAttribute("starMap", starMap);
		model.addAttribute("cntMap", cntMap);
		model.addAttribute("arStars", arStars);
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
		List<String> fileList = mapper.readfiles(num);
		int[] arFile = new int [fileList.size()];
		int[] arStars = {1,2,3,4,5};
		int replyCnt = 0;
		double avgStars = 0;
		replyCnt = mapper.ReplyBoardCnt(dto.getNum());
		if(replyCnt > 0) {
			avgStars = Math.round(((double) dto.getStars() / replyCnt) * 10.0) / 10.0;
		}
		for (int i = 0; i < arFile.length; i++) {
			arFile[i] = i;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("arStars", arStars);
		model.addAttribute("arFile", arFile);
		model.addAttribute("avgStars", avgStars);
		model.addAttribute("replyCnt", replyCnt);
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
			List<String> fileList = mapper.readfiles(num);
			for (String filename : fileList) {
				File file = new File(path+filename);
				if(file.isFile()) {
					file.delete();
				}
			}
			mapper.deletefiles(num);
			mapper.deleteSubBoard(num);
		}
		return check;
	}

	@Override
	public int update(BoardDTO dto) {
		int check = mapper.updateBoard(dto);
		return check;
	}

	@Override
	public int likesUp(int num) {
		int check = 0;
		check = mapper.likesUp(num);
		return check;
	}

	@Override
	public void search(String search, Model model) {
		String searchValue = "%" + search + "%";
		int result = mapper.searchListCnt(searchValue);
		int replyCnt = 0;
		double avgStars = 0;
		int[] arStars = {1,2,3,4,5};
		List<BoardDTO> list = Collections.EMPTY_LIST;
		if(result>0) {
			list = mapper.searchList(searchValue);
			for (BoardDTO boardDTO : list) {
				replyCnt = mapper.ReplyBoardCnt(boardDTO.getNum());
				if(replyCnt >0) {
					avgStars = Math.round(((double) boardDTO.getStars() / replyCnt) * 10.0) / 10.0;
					starMap.put(boardDTO.getNum(), avgStars);
				}else {
					starMap.put(boardDTO.getNum(), (double) 0);
				}
				cntMap.put(boardDTO.getNum(), replyCnt);
				if(mapper.fileCnt(boardDTO.getNum())>0) {
					imgMap.put(boardDTO.getNum(),mapper.readfiles(boardDTO.getNum()).get(0));
				}else {
					imgMap.put(boardDTO.getNum(), "1111.jpg");
				}
			}
		}
		model.addAttribute("search", search);
		model.addAttribute("result", result);
		model.addAttribute("searchList", list);
		model.addAttribute("imgMap", imgMap);
		model.addAttribute("starMap", starMap);
		model.addAttribute("cntMap", cntMap);
		model.addAttribute("arStars", arStars);
		model.addAttribute("avgStars", avgStars);
		model.addAttribute("replyCnt", replyCnt);
	}

}
