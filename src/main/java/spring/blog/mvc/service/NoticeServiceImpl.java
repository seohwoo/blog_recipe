package spring.blog.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.repository.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public void writeNotice(BoardDTO dto) {
		
		mapper.writeNotice(dto);
	}
	
}
