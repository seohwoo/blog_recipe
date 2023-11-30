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
import spring.blog.mvc.repository.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private HashMap noticeMap;
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
		public int noticeListCount(int tablenum) {
		
		return mapper.noticeListCount(tablenum);
		}
	@Override
	public void writeNotice(BoardDTO dto) {
		if(dto.getNum() != 0) {
			dto.setBoardnum(dto.getBoardnum()+1);
		}
		mapper.writeNotice(dto);
	}

	@Override
	public int fileUpload(ArrayList<MultipartFile> files, String path) {
		int tablenum=1;
		int boardNum = mapper.contentNum(tablenum);
		int result=0;
		for(int i=0 ; i < files.size() ; i++) {
			MultipartFile f = files.get(i);
			String fileName = f.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				fileName = "file_"+boardNum+"_"+i+ext;
				File copy = new File(path+fileName);
				result += mapper.fileUpload(boardNum, fileName, tablenum);
				try {
					f.transferTo(copy);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	@Override
	public void noticeList(int pageNum, Model model) {
		int pageSize = 5;
		int tablenum = 1;
		int startRow = (pageNum - 1)*pageSize+1;
		int endRow = pageNum*pageSize;
		
		int count = mapper.contentNum(tablenum);
		List<BoardDTO> list=Collections.EMPTY_LIST;
		if(count > 0 ) {
			noticeMap.put("start", startRow);
			noticeMap.put("end", endRow);
			noticeMap.put("tablenum", tablenum);
			list = mapper.noticeList(noticeMap);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageSize", pageSize);
		
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pageBlock", pageBlock);	
	}

	
	
}
