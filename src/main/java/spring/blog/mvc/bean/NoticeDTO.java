package spring.blog.mvc.bean;

import lombok.Data;

@Data
public class NoticeDTO {
	private int num;
	private String writer;
	private String title;
	private String content;
	private String reg_date;
	private int readcount;
	private int boardnum;
	private int files;
	private int tablenum;
}
