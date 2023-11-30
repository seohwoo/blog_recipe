package spring.blog.mvc.repository;

import spring.blog.mvc.bean.BoardDTO;

public interface NoticeMapper {
	
	public void writeNotice(BoardDTO dto);
}
