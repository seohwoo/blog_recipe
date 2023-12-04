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
import spring.blog.mvc.repository.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private HashMap noticeMap;
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
		public int noticeListCount() {
		
		return mapper.noticeListCount();
		}
	@Override
	public void writeNotice(BoardDTO dto) {
		
		mapper.writeNotice(dto);
	}

	@Override
	public int fileUpload(List<MultipartFile> filelist, String path) {
		
		int boardNum = mapper.contentNum();
		int result=0;
		for(int i=0 ; i < filelist.size() ; i++) {
			MultipartFile f = filelist.get(i);
			String fileName = f.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				fileName = "file_"+boardNum+"_"+i+ext;
				File copy = new File(path+fileName);
				result += mapper.fileUpload(boardNum, fileName);
				try {
					f.transferTo(copy);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	@Override
	public void noticeList(int pageNum, Model model) {
		int pageSize = 5;
		int startRow = (pageNum - 1)*pageSize+1;
		//int endRow = pageNum*pageSize;
		int listNum = 0;
		int count = mapper.contentNum();
		List<BoardDTO> list=Collections.EMPTY_LIST;
		if(count > 0 ) {
			noticeMap.put("start", startRow);
			noticeMap.put("end", count);
			list = mapper.noticeList(noticeMap);
			listNum = mapper.noticeListCount(noticeMap);
		}
		
		model.addAttribute("listNum", listNum);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageSize", pageSize);
		
		int pageCount = list.size() / pageSize + ( list.size() % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=5;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pageBlock", pageBlock);	
        
	}
	@Override
	public BoardDTO readContent(int num) {
		mapper.readCountUp(num);
		return mapper.readContent(num);
	}
	@Override
	public List<FilesDTO> readFiles(int boardnum) {
		return mapper.readFiles(boardnum);
	}
	@Override
	public void writeReply(BoardDTO dto) {
		if(dto.getNum() != 0) {
			dto.setBoardnum(dto.getNum());
		}
		mapper.writeReply(dto);
	}
	@Override
	public List<BoardDTO> replyList(int boardnum) {
		return mapper.replyList(boardnum);
	}
	@Override
	public int replyCount(int boardnum) {
		return mapper.replyCount(boardnum);
	}
	@Override
	public int deleteContent(int num, String path) {
		int result=0;
		
		List<FilesDTO> filelist = mapper.readFiles(num);
			if(filelist!=null) {
				for(FilesDTO filesDTO : filelist) {
					File f = new File(path+filesDTO.getFilename());
					if(f.isFile()) {
						f.delete();
				}
			}
			mapper.deleteFiles(num);
			mapper.deleteReply(num);
			result = mapper.deleteContent(num);
		}
		return result;
	}
	@Override
	public int updateNotice(BoardDTO dto) {
		return mapper.updateNotice(dto);
	}
	@Override
	public int adminCheck(String id) {
		return mapper.adminCheck(id);
	}

	
	
}
