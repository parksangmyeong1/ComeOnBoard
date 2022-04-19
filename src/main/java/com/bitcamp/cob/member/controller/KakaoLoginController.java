package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cob.member.domain.LoginInfo;
import com.bitcamp.cob.member.service.KakaoLoginService;

@Controller
public class KakaoLoginController {

	@Autowired
	KakaoLoginService service;
	
	@RequestMapping(value="/member/kakaoLogin", method = RequestMethod.POST)
	public String kakaoLogin(String memId,
							String memEmail,
							String memGender,
							@RequestParam(required = false)String reUri,
							Model model,
							HttpServletRequest request,
							HttpSession session) {
		String view = "/";
		LoginInfo loginInfo = service.chkMember(memId); 
		session.setAttribute("loginInfo", loginInfo);
		
		if(loginInfo == null) {
			model.addAttribute("memId",memId);
			model.addAttribute("memEmail",memEmail);
			model.addAttribute("memGender",memGender);
			view = "member/kakaoRegForm";
		} else {
			if(reUri.length()>0) {
				reUri.substring(request.getContextPath().length());
				view = "redirect:" + reUri;	
			}
		}
		
		return view;
	}
}
