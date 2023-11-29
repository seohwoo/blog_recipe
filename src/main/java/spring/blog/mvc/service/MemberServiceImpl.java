package spring.blog.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.blog.mvc.bean.MemberDTO;
import spring.blog.mvc.repository.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void MemberInsert(MemberDTO dto) {
		// TODO Auto-generated method stub
		
	}

}
