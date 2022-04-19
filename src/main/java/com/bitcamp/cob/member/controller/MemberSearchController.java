package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.domain.MemberInfo;
import com.bitcamp.cob.member.service.FriendRestService;

@RestController
public class MemberSearchController {
	
	@Autowired
	FriendRestService service;
	
	@GetMapping("/member/search")
	public List<MemberInfo> searchMember(String keyword){
		List<MemberInfo> list = service.getSearchMembder(keyword);
		return list;
	}
	
}
