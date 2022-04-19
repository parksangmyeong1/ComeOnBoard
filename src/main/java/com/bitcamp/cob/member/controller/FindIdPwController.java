package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.member.domain.FindIdPwInfo;
import com.bitcamp.cob.member.service.FindIdPwService;

@Controller
public class FindIdPwController {
	
	@Autowired
	FindIdPwService service;
	
	@RequestMapping("/member/findId")
	public String findId() {
		
		return "member/findId";
	}

	@RequestMapping("/member/findPw")
	public String findPw(@ModelAttribute("findIdPwInfo")FindIdPwInfo info, 
						Model model) {
		return "member/findPw";
	}
	
	@PostMapping("/member/findId")
	@ResponseBody
	public List<String> findIdByEmail(
			FindIdPwInfo findIdPwInfo) {
		List<String> list = null;

		list = service.findIdByEmail(findIdPwInfo);

		return list;
	}
	
	@PostMapping("/member/findPw")
	@ResponseBody
	public int findPwByEmail(@ModelAttribute("findIdPwInfo")FindIdPwInfo findIdPwInfo) {
		
		int result = service.findPwByEmail(findIdPwInfo); 
		
		return result;
	}
	
	@PutMapping("/member/password")
	@ResponseBody
	public int updatePassword(
			@RequestParam("memId")String memId,
			@RequestParam("memPassword")String memPassword,
								Model model) {
		
		int result = service.updatePassword(memId, memPassword);
		
		return result;
	}
}
