package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.group.service.DeleteGroupBoardService;
import com.bitcamp.cob.member.domain.LoginInfo;

@Controller
public class DeleteGroupBoardController {
	
	@Autowired
	private DeleteGroupBoardService service;
	
	// 게시글 읽기에서 삭제하기
	@RequestMapping(value="/group/deleteGroupBoard", method = RequestMethod.GET)
	public String deleteGroupBoardPage(int grpIdx) { 
		
		service.deleteBoard(grpIdx);
		
		return "redirect:/group/groupList";
		
	}
	
	//groupManagement.jsp 에서 '내가 만든 모임' 삭제
	@ResponseBody
	@RequestMapping(value="/group/deleteGroupThroughManagementJSP", method = RequestMethod.GET)
	public String deleteMyGroup(int grpIdx) {
		
		service.deleteBoard(grpIdx);
		
//		return "redirect:/group/groupManagement";
		return "";	// jsp에서 location.href로 처리
	}
	
	//groupManagement.jsp에서 '참가한 모임' 삭제
	@ResponseBody
	@RequestMapping(value="/group/deleteGroupThroughManagementJSP2", method = RequestMethod.GET)
	public String deleteJoinedGroup(int grpIdx, int memIdx) {
		
		service.deleteJoinedRegGroup(grpIdx, memIdx);
		
		return "";
		
	}
	
	
	
	
	
}




