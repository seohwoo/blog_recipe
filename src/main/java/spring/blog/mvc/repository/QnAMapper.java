package spring.blog.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface QnAMapper {
	public void writeInsert(BoardDTO dto); //글쓰기 
	
	public void updateCountUp(int num); //조회수 증가하기 
	public BoardDTO readNum(int num); //글 번호 가져오기 (글 읽기 사용)
	public int count(); // 글 갯수 
	
	public int fileInsert(@Param("boardnum")int boardnum, //사진 인서트 
			 @Param("filename")String filename);
	public List<FilesDTO> fileList(int boardnum); //사진 파일 리스트 
	public int maxBoardNum(); //결과값 files 테이블 boardnum으로 넘김  
	
	public List<BoardDTO> list (HashMap map); //페이징 사용
	
	public int deleteNum(int num); //글 삭제
	public int deleteFile(int freeboardnum); //파일 삭제 
	
	public int selectGrade(String id);	//등급 가져오기
}
