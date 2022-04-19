package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bitcamp.cob.member.service.MemberDeleteService;

@Controller
@SessionAttributes("resultCnt")
public class MemberDeleteController {
	
	@Autowired
	MemberDeleteService service;
	
	@RequestMapping("/member/delete")
	public String deleteMember(
			@RequestParam("memIdx") int memIdx,
			HttpSession session,
			HttpServletResponse response
			) {
		
		int resultCnt = service.delete(memIdx, session, response);
		
		session.setAttribute("resultCnt", resultCnt);
		
		return "member/delete";
	}
}
