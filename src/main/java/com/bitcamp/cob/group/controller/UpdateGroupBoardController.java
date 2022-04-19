package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.domain.TitleAndContent;
import com.bitcamp.cob.group.service.UpdateGroupBoardService;

@Controller
public class UpdateGroupBoardController {

	
	@Autowired
	private UpdateGroupBoardService updateService;
	
	
	@RequestMapping(value="/group/updateGroup", method=RequestMethod.GET)
	public String updateBoard(Group group, Model model) {
	
		Group result = updateService.reviewContent(group);
		
		model.addAttribute("updateBoard", result);
	
		return "group/updateGroup";

	}
	
	
	//모임 수정
	//오류 확인하기
	@RequestMapping(value="/group/updateGroup", method=RequestMethod.POST)
	public String editGroupBoard(Group group, Model model) {

		updateService.groupBoardEdit(group);
		
		String viewReturn = "";
		
		viewReturn = "redirect:/group/readGroup?grpIdx="+group.getGrpIdx();
		
		
		return viewReturn;

	}
	
	
	@RequestMapping(value="/group/updateGroupOnlyTitleAndContent", method=RequestMethod.POST)
	public String editGroupBoardOnlyTitleAndContent(TitleAndContent tac) {
		
		updateService.updateOnlyTitleAndContent(tac);
	
		return "redirect:/group/groupList";
	}
	
	
	
}






