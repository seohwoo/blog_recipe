package spring.blog.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class SampleController {

	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("realcontent")
	public String content() {
		return "main/realContent";
	}
	
	@RequestMapping("form")
	public String form() {
		return "main/form";
	}
	
	
}
