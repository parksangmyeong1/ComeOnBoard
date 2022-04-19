package com.bitcamp.cob.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	
	@RequestMapping("/member/mypage")
	public String myPage(Model model) {
		return "member/mypage";
	}
	
}
