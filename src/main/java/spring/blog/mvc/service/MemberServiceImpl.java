package spring.blog.mvc.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.MemberDTO;
import spring.blog.mvc.repository.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void MemberInsert(MemberDTO dto) {
		mapper.MemberInsert(dto);
	}

	@Override
	public MemberDTO confirmId(String id) {
		return mapper.confirmId(id);
	}
	
	@Override
	public int MemberLogin(MemberDTO dto) {
		return mapper.MemberLogin(dto);
	}

	@Override
	public MemberDTO member(String id) {
		return mapper.member(id);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	// TEST
	@Override
	public boolean imageChange(String id, String path, MultipartFile image) {
		String[] contentType = image.getContentType().split("/");
		boolean result = typeCheck("image", contentType[0]);
		if(result) {
			String fileName =  fileUpload(id, path, image, contentType[1]);
			mapper.imageChange(fileName, id);
		}
		return result;
	}
		
	public String fileUpload(String id, String path, MultipartFile image, String ext) {
		String fileName = id+"."+ext;
		File copy = new File(path+fileName);
		try {
			image.transferTo(copy);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	//file 타입 확인
	public boolean typeCheck(String checkType, String fileType) {
		boolean result = false;
		if(checkType.equals(fileType)) {
			result = true;
		}
		return result;
	}

	/*
	@Override
	public MemberDTO memberWriter() {
		mapper.memberWriter();
		
	}
	*/
}
