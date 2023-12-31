package spring.blog.mvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface NoticeService {
	
	public void writeNotice(BoardDTO dto);
	public int fileUpload(List<MultipartFile> filelist, String path);
	public void noticeList(int pageNum, Model model);
	public BoardDTO readContent(int num);
	public List<FilesDTO> readFiles(int boardnum);
	public void writeReply(BoardDTO dto);
	public List<BoardDTO> replyList(int boardnum);
	public int replyCount (int boardnum);
	public int deleteContent(int num, String path);
	public int updateNotice(BoardDTO dto);
	public int adminCheck(String id);
}
