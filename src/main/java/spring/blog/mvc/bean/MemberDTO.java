package spring.blog.mvc.bean;

import java.sql.Date;
import lombok.Data;

@Data
public class MemberDTO {
	private int num;
	private String id;
	private String pw;
	private String nic;
	private String name;
	private int birth;
	private String gender;
	private int phone;
	private String address;
	private String email;
	private int grade;
	private String image;
	private Date reg_date;	
}
