package spring.blog.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.GuestBookDTO;
import spring.blog.mvc.repository.GuestBookMapper;

@Service
public class GuestBookServiceImpl implements GuestBookService {

	@Autowired
	private GuestBookMapper mapper;

	@Override
	public void guestBookInsert(BoardDTO dto) {
		mapper.guestBookInsert(dto);
	}
	@Override
	public List<BoardDTO> guestBookList() {
		return mapper.guestBookList();
	}
}
