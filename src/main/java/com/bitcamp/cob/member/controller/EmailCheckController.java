package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.service.EmailService;

@RestController
public class EmailCheckController {
	
	@Autowired
	EmailService service;
	
	@PostMapping("/members/email")
	public int sendEmail(
			@RequestParam("memEmail") String memEmail,
			HttpSession session
			) {
		int result = service.sendEmail(memEmail, session);
		
		return result;
	}
	
	@PostMapping("/members/chkemail")
	public boolean chkEmail(
			@RequestParam("inputCertNum") int inputCertNum,
			HttpSession session
			) {
		
		boolean chk = service.chkEmail(inputCertNum, session);	
		
		return chk;
	}
	
}
