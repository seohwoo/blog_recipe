package spring.blog.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.BoardDTO;

public interface ImgMapper {
	
	public List<Integer> selectNum(int boardnum);
	public int imgWirte(BoardDTO dto);
	public int maxNum();
	public int imgFileInsert(	@Param("boardnum") int boardnum,
								@Param("filename") String filename);
}
