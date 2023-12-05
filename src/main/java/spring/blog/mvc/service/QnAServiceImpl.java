package spring.blog.mvc.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;
import spring.blog.mvc.repository.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	public QnAMapper mapper;

	@Autowired
	private HashMap qnaMap;
	
	//�� ����
	@Override
	public void write(BoardDTO dto) {
		mapper.writeInsert(dto);	
	}
	
	//�� �б� 
	@Override
	public BoardDTO readContent(int num) {
		mapper.updateCountUp(num);
		return mapper.readNum(num);
	}
	
	//�� ���� 
	@Override
	public int count() {
		return mapper.count();
	}
	
	//����¡
	@Override
	public void list(int pageNum, Model model) {
		int pageSize = 10;
	    int startRow = (pageNum - 1) * pageSize + 1;
	    int endRow = pageNum * pageSize;
	    int count = mapper.count();
	    List<BoardDTO> list = Collections.EMPTY_LIST;
	    if(count > 0) {
	    	qnaMap.put("start", startRow);
		    qnaMap.put("end", endRow);	
		    list = mapper.list(qnaMap); 
	    }    
	    model.addAttribute("list",list);
	    model.addAttribute("count",count);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("pageSize",pageSize);

	    int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) {
			endPage = pageCount;
        }				
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("startPage",startPage);
        model.addAttribute("pageBlock",pageBlock);
        model.addAttribute("endPage",endPage);
		
	}
	
	//���� ��� �Խ��� �ѹ��� �޾ƿ��� 
	@Override
	public List<FilesDTO> fileList(int boardnum) {
		
		return mapper.fileList(boardnum);	
	}
	
	//���� �μ�Ʈ 
	@Override
	public int fileInsert(List<MultipartFile> file,String path) {
		int result = 0;
		int boardnum = mapper.maxBoardNum(); //�������̺� ����� �˻� ���� 
		for(int i = 0 ; i < file.size() ; i++) {
			MultipartFile f = file.get(i);
			String filename = f.getOriginalFilename();
			if(!filename.equals("")) {
				String ext = filename.substring(filename.lastIndexOf("."));
				filename="file_"+boardnum+"_"+i+ext;
				File copy = new File(path+filename);
				result += mapper.fileInsert(boardnum, filename);
				try {
					f.transferTo(copy);
				} catch (Exception e) {					
					e.printStackTrace();
				} 
			}
		} 
		return result;
	
	}
	//�۰� ���� ���� 
	@Override
	public int deleteNum(int num, String path) {
		int check = mapper.deleteNum(num);
		if(check > 0) {
			List<FilesDTO> fileList = mapper.fileList(num);
			for(FilesDTO filesDTO : fileList) {
				File f = new File(path+filesDTO.getFilename());
				if(f.isFile()) {
					f.delete();
				}
			mapper.deleteFile(num);
			mapper.deleteNum(num);
			}
		}
		return check;
		}
}
