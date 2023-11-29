package spring.blog.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import spring.blog.mvc.QnAController;
import spring.blog.mvc.service.QnAService;


@Controller
@RequestMapping("/qna/*")
public class QnAController {
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private QnAService service;
	
	//Å¥¾Ø¿¡ÀÌ Æû, Å¥¾Ø¿¡ÀÌ ÇÁ·Î, Å¥¾Ø¿¡ÀÌ ºä
	
	
	
	
	
}
