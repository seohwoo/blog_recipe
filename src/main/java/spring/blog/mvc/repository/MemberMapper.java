package spring.blog.mvc.repository;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.MemberDTO;

public interface MemberMapper {
	public void MemberInsert(MemberDTO dto);
	
	public MemberDTO confirmId(String id);
	
	public int MemberLogin(MemberDTO dto);
	
	public MemberDTO member(String id);
	
	public int idCheck(String id);
	
	// TEST
	public void imageChange(@Param("image") String image,
							@Param("id") String id);
	
	//public MemberDTO memberWriter();
}
