package spring.blog.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.blog.mvc.repository.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	public QnAMapper mapper;
}

