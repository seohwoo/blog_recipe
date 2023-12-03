package spring.blog.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface ImgMapper {
	
	public List<Integer> selectNum(int boardnum);
	public int imgWirte(BoardDTO dto);
	public int maxNum();
	public int imgFileInsert(	@Param("boardnum") int boardnum,
								@Param("filename") String filename);
	public int listCount();
	public List<BoardDTO> showList(HashMap<String, Integer> map);
	public void readcountUp(@Param("num") int num);
	public BoardDTO readBoard(@Param("num") int num);
	public List<FilesDTO> readfiles(@Param("num") int num);
	public int deleteBoard(int num);
	public int deletefiles(int boardnum);
	public int updateBoard(BoardDTO dto);
	public List<BoardDTO> readReplyBoard(@Param("num") int num);
}
