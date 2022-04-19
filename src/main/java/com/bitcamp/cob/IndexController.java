package com.bitcamp.cob;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public void index() {
	}
	
	@RequestMapping("/")
	public String index2() {
		return "index";
	}
	
}
