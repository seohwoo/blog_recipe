package spring.blog.mvc.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.repository.ImgMapper;

@Service
public class ImgServiceImpl implements ImgService{

	@Autowired
	private ImgMapper mapper;
	
	@Override
	public int write(List<MultipartFile> filelist, BoardDTO dto, String path) {
		int check = 0;
		int files = 0;
		for (MultipartFile file : filelist) {
			if(!file.getOriginalFilename().equals("")) {
				files++;
			}
		}
		dto.setFiles(files);
		check = mapper.imgWirte(dto);
		return check;
	}

	@Override
	public int fileUpload(List<MultipartFile> filelist, String path) {
		int result = 0;
		int boardnum = mapper.maxNum();
		for (int i = 1; i <= filelist.size(); i++) {
			MultipartFile file = filelist.get(i-1);
			String filename = file.getOriginalFilename();
			if(!filename.equals("")) {
				String ext = filename.substring(filename.lastIndexOf("."));
				filename = "file_"+boardnum+"_"+i+ext;
				File copy = new File(path+filename);
				result = mapper.imgFileInsert(boardnum, filename);
				try {
					file.transferTo(copy);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

}
