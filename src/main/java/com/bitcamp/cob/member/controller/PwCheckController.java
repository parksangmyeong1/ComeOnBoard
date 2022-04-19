package com.bitcamp.cob.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.member.service.PwCheckService;

@Controller
public class PwCheckController {
	
	@Autowired
	private PwCheckService checkService;
	
	@RequestMapping(value="/member/pwCheck", method=RequestMethod.POST)
	@ResponseBody
	public boolean pwCheck(
			String memId,
			String memPassword,
			Model model
			) {
		boolean pwCheck = false;
		int chk = checkService.pwCheck(memId, memPassword);
		
		if(chk>0) {
			pwCheck = true;
		}
		
		return pwCheck;
	}
	
	@RequestMapping(value="/member/updatePw", method=RequestMethod.POST)
	@ResponseBody
	public int pwUpdate(String memPassword, String memId) {
		int resultCnt = 0;
		System.out.println(memPassword);
		System.out.println(memId);
		
		resultCnt = checkService.pwUpdate(memId, memPassword);
		
		return resultCnt;
	}
	
}
