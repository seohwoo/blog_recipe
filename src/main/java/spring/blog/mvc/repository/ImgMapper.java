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
	public int ReplyBoardCnt(@Param("num") int num);
	public int fileCnt(@Param("num") int num);
	public List<String> readfiles(@Param("num") int num);
	public int deleteBoard(int num);
	public int deleteSubBoard(int num);
	public int deletefiles(int boardnum);
	public int updateBoard(BoardDTO dto);
	public List<BoardDTO> readReplyBoard(@Param("num") int num);
	public int starsUp(@Param("stars") int stars, @Param("boardnum") int boardnum);
	public int likesUp(@Param("num") int num);
	public int searchListCnt(String searchValue);
	public List<BoardDTO> searchList(String searchValue);
}
