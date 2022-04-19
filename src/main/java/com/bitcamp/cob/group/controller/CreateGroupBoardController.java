package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.CreateGroupBoardService;
import com.bitcamp.cob.group.service.UpdateGroupBoardService;

//컨트롤러의 역할: 1.front-controller, 2.초기화 설정
@Controller
@RequestMapping("/group/createGroup")
public class CreateGroupBoardController {
	
	@Autowired
	private CreateGroupBoardService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String returnGroupPage() {
		return "group/createGroup";
	}

	
	@RequestMapping(method = RequestMethod.POST)
	public String getCreateGroup(Group group, Model model) {  
		
		
		
		//모임 게시글 등록시 DB에 저장(service의 영역)
		int result = service.groupBoardReg(group);
		
		//모임 게시글 등록시 model에 저장 -> view 역할을 하는 jsp(?)로 돌려줌
		model.addAttribute("result", result);
		
		return "redirect:/group/readGroup?grpIdx="+group.getGrpIdx();
	
		
	}
		
	
}
