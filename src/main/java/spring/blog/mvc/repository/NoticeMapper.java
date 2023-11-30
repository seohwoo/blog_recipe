package spring.blog.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.BoardDTO;

public interface NoticeMapper {
	public int noticeListCount (int tablenum);
	public int contentNum(int tablenum);
	public void writeNotice(BoardDTO dto);
	public int fileUpload(@Param("boardnum")int boardnum, @Param("filename")String filename, @Param("tablenum")int tablenum);
	public List<BoardDTO> noticeList(HashMap map);
}
