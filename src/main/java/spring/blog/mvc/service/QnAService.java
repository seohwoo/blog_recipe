package spring.blog.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface QnAService {
	
	public void write(BoardDTO dto); //글쓰기
	public BoardDTO readContent(int num); // 글 번호 가져와 글 읽기
	
	public void list(int pageNum , Model model); // 글 목록
	public int count(); // 글 갯수
	
	public List<FilesDTO> fileList(int boardnum); //게시글 넘버 가져와 사진 리스트 
	public int fileInsert(List<MultipartFile> file,String path); //파일 인서트하기 
	
	public int deleteNum (int num, String path); // 글 삭제하기 
}
