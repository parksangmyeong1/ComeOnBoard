package com.bitcamp.cob.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.member.service.IdCheckService;

@Controller
public class IdCheckController {
	
	@Autowired
	private IdCheckService checkService;
	
	@RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(
			@RequestParam("mid") String uid
			) {
		String chk = "Y";
		chk = checkService.idCheck(uid);
		
		return chk;
	}
	
	@RequestMapping(value="/member/nickNameCheck")
	@ResponseBody
	public String nickNameCheck(
			@RequestParam("nickName") String nickName,
			Model model
			) {
		
		String chk = checkService.nicknameCheck(nickName);
		return chk;
	}
	
}
