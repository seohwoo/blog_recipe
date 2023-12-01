package spring.blog.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface NoticeMapper {
	public int noticeListCount ();
	public int contentNum();
	public void writeNotice(BoardDTO dto);
	public int fileUpload(@Param("boardnum")int boardnum, @Param("filename")String filename);
	public List<BoardDTO> noticeList(HashMap map);
	public void readCountUp(int num);
	public BoardDTO readContent(int num);
	public List<FilesDTO> readfiles(int boardnum);
	public void writeReply(BoardDTO dto);
	public List<BoardDTO> replyList(int boardnum);
}
