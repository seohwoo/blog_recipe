package spring.blog.mvc.service;

import java.util.List;

import org.springframework.ui.Model;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;

public interface GuestBookService {
	public void guestBookInsert(BoardDTO dto);
	
	//public List<BoardDTO> guestBookList();
	
	public void guestBookList(int pageNum, Model model);
	
	public int BoardCount();
	
	public List<BoardDTO> myBoardList(String id);
}
