package spring.blog.mvc.repository;

import java.util.List;

import spring.blog.mvc.bean.GuestBookDTO;

public interface GuestBookMapper {
	public void write(GuestBookDTO dto);
	
	public List<GuestBookDTO> bookList();
}
