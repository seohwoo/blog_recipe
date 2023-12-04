package spring.blog.mvc.service;

import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.MemberDTO;

public interface MemberService {
	public void MemberInsert(MemberDTO dto);
	
	public MemberDTO confirmId(String id);
	
	public int MemberLogin(MemberDTO dto);
	
	public MemberDTO member(String id);
	
	public int idCheck(String id);
	
	// TEST
	public boolean imageChange(String id, String path, MultipartFile image);
}
