package spring.blog.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import spring.blog.mvc.bean.BoardDTO;
import spring.blog.mvc.bean.FilesDTO;

public interface QnAMapper {
	public void writeInsert(BoardDTO dto); //�۾��� 
	
	public void updateCountUp(int num); //��ȸ�� �����ϱ� 
	public BoardDTO readNum(int num); //�� ��ȣ �������� (�� �б� ���)
	public int count(); // �� ���� 
	
	public int fileInsert(@Param("boardnum")int boardnum, //���� �μ�Ʈ 
			 @Param("filename")String filename);
	public List<FilesDTO> fileList(int boardnum); //���� ���� ����Ʈ 
	public int maxBoardNum(); //����� files ���̺� boardnum���� �ѱ�  
	
	public List<BoardDTO> list (HashMap map); //����¡ ���
	
	public int deleteNum(int num); //�� ����
	public int deleteFile(int freeboardnum); //���� ���� 
	
	public int selectGrade(String id);	//��� ��������
}
