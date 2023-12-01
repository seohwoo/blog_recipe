package spring.blog.mvc.service;

import java.util.List;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;

public interface GuestBookService {
	public void guestBookInsert(BoardDTO dto);
	
	public List<BoardDTO> guestBookList();
}
