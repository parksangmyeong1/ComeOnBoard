package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.cob.member.domain.LoginInfo;
import com.bitcamp.cob.member.domain.Member;
import com.bitcamp.cob.member.domain.MemberUpdateRequest;
import com.bitcamp.cob.member.service.MemberUpdateService;

@Controller
public class MemberInfoUpdateController {

	@Autowired
	private MemberUpdateService service;
	
	@ResponseBody
	@RequestMapping(value="/member/updateMember", method = RequestMethod.POST)
	public Member updateMember(
			@RequestBody MemberUpdateRequest updateParam,
			HttpSession session,
			Model model
			) {
		Member member = service.memberUpdate(updateParam, session);

		return member;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/updateMemPhoto", method = RequestMethod.POST)
	public String updateMemPhoto(
			@RequestParam("newMemPhoto") MultipartFile newMemPhoto,
			HttpServletRequest request) {
			
		HttpSession session = request.getSession();
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");

		String newPhotoName = service.memberPhotoUpdate(loginInfo, newMemPhoto, request, session);
		
		return newPhotoName;

	}
	
	@RequestMapping("/member/deleteMemPhoto")
	@ResponseBody
	public int deleteMemPhoto(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		
		int result = 0;
		result = service.memberPhotoDelete(loginInfo, request, session);
		
		return result;
	}
	
}
