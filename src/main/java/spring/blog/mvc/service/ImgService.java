package spring.blog.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;

public interface ImgService {

	public int write(List<MultipartFile> files, BoardDTO dto, String path);
	public int fileUpload(List<MultipartFile> files, String path);
	public void showimgList(int pageNum, Model model);
	public void readcountUp(int num);
	public void read(int num, Model model);
	public void readReply(int num, Model model);
	public int delete(int num, String path);
	public int update(BoardDTO dto);
	public int likesUp(int num);
	public void search(String search, Model model);
	public int maxNum();
	public int imgWirte(BoardDTO dto);
	public int imgFileInsert(int boardnum, String filename);
	public void updateImgWrite(BoardDTO dto);
	public List<BoardDTO> lastImgNum();
}
