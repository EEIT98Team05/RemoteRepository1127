package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import model.dao.PostArticleDAO;

@Controller
public class TestController {
	
	@Autowired
	private PostArticleDAO dao = new PostArticleDAO();
	
	@RequestMapping("/test.controller")
	public void test(String topic, MultipartFile file) {
		
		System.out.println("done");
	}

}
