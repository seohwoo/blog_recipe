package spring.blog.mvc.repository;

import java.util.List;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;

public interface GuestBookMapper {
	public void guestBookInsert(BoardDTO dto);
	
	public List<BoardDTO> guestBookList();
}
