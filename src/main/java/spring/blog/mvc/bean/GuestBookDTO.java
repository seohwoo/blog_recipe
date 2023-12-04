package spring.blog.mvc.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class GuestBookDTO {
	private int num;
	private String content;
	private Date reg_date;
}
