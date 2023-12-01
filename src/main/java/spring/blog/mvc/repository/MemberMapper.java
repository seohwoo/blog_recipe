package spring.blog.mvc.repository;

import spring.blog.mvc.bean.MemberDTO;

public interface MemberMapper {
	public void MemberInsert(MemberDTO dto);
	
	public MemberDTO confirmId(String id);
	
	public int MemberLogin(MemberDTO dto);
	
	public MemberDTO member(String id);
	
	public int idCheck(String id);
}
