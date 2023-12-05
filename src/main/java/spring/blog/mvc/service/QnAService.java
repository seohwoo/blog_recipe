package spring.blog.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface QnAService {
	
	public void write(BoardDTO dto); //�۾���
	public BoardDTO readContent(int num); // �� ��ȣ ������ �� �б�
	
	public void list(int pageNum , Model model); // �� ���
	public int count(); // �� ����
	
	public List<FilesDTO> fileList(int boardnum); //�Խñ� �ѹ� ������ ���� ����Ʈ 
	public int fileInsert(List<MultipartFile> file,String path); //���� �μ�Ʈ�ϱ� 
	
	public int deleteNum (int num, String path); // �� �����ϱ� 
}
