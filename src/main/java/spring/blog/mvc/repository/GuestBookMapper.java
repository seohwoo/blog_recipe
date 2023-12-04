package spring.blog.mvc.repository;

import java.util.HashMap;
import java.util.List;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;

public interface GuestBookMapper {
	public void guestBookInsert(BoardDTO dto);
	
	//public List<BoardDTO> guestBookList();
	
	public List<BoardDTO> guestBookList(HashMap<String, Integer> map);

	public int BoardCount();
	
	public List<BoardDTO> myBoardList(String id);
}
