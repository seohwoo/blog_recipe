package spring.blog.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;

public interface ImgService {

	public int write(List<MultipartFile> files, BoardDTO dto, String path);
	public int fileUpload(List<MultipartFile> files, String path);
}
