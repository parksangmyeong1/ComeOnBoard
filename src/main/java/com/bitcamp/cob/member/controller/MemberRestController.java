package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.service.MemberRestService;

@RestController
public class MemberRestController {

	@Autowired
	MemberRestService service;
	
	@PutMapping("/member/{idx}/auth")
	public int updateMemberAuth(@PathVariable("idx") int memIdx,
								String memAuth, HttpSession session){
		int result = service.updateMemberAuth(memIdx, memAuth, session);
		return result;
	}
}
