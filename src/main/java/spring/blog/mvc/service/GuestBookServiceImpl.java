package spring.blog.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.blog.mvc.bean.GuestBookDTO;
import spring.blog.mvc.repository.GuestBookMapper;

@Service
public class GuestBookServiceImpl implements GuestBookService {

	@Autowired
	private GuestBookMapper mapper;

	@Override
	public void write(GuestBookDTO dto) {
		mapper.write(dto);
	}

	@Override
	public List<GuestBookDTO> bookList() {
		return mapper.bookList();
	}
}
