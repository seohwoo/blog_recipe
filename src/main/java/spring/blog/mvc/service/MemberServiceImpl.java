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
		mapper.MemberInsert(dto);
	}

	@Override
	public MemberDTO confirmId(String id) {
		return mapper.confirmId(id);
	}
	
	@Override
	public int MemberLogin(MemberDTO dto) {
		return mapper.MemberLogin(dto);
	}

	@Override
	public MemberDTO member(String id) {
		return mapper.member(id);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	

}
