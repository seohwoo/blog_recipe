package spring.blog.mvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;

public interface NoticeService {
	public int noticeListCount (int tablenum);
	public void writeNotice(BoardDTO dto);
	public int fileUpload(ArrayList<MultipartFile> files, String path);
	public void noticeList(int pageNum, Model model);
}
