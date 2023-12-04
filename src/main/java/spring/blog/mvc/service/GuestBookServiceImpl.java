package spring.blog.mvc.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;
import spring.blog.mvc.repository.GuestBookMapper;

@Service
public class GuestBookServiceImpl implements GuestBookService {

	@Autowired
	private GuestBookMapper mapper;
	
	@Autowired
	private HashMap<String, Integer> boardMap;

	@Override
	public void guestBookInsert(BoardDTO dto) {
		mapper.guestBookInsert(dto);
	}
	/*
	@Override
	public List<BoardDTO> guestBookList() {
		return mapper.guestBookList();
	}
	*/
	
	@Override
	public void guestBookList(int pageNum, Model model) {
		int pageSize = 10;
		int start = (pageNum -1) * pageSize +1;
		int end = pageNum * pageSize;
		int cnt = mapper.BoardCount();
		List<BoardDTO> list = Collections.EMPTY_LIST;	
						
		if(cnt > 0) {
			boardMap.put("end", end);
			boardMap.put("start", start);
			list = mapper.guestBookList(boardMap);
		}
		
		model.addAttribute("userList", list);
		model.addAttribute("userCnt", cnt);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageNum", pageNum);
		
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
	public int BoardCount() {
		return mapper.BoardCount();
	}
	
	
	@Override
	public List<BoardDTO> myBoardList(String id) {
		return mapper.myBoardList(id);
	}
	

	
}
