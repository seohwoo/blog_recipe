package spring.blog.mvc.repository;

import spring.blog.mvc.bean.NoticeDTO;

public interface NoticeMapper {
	
	public void writeNotice(NoticeDTO dto);
}
