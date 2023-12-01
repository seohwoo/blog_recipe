package spring.blog.mvc.service;

import java.util.List;

import spring.blog.mvc.bean.GuestBookDTO;

public interface GuestBookService {
	public void write(GuestBookDTO dto);
	
	public List<GuestBookDTO> bookList();
}
