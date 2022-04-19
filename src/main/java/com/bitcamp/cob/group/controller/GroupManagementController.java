package com.bitcamp.cob.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.ManageGroupService;


@Controller
public class GroupManagementController {

	@Autowired
	ManageGroupService service;
	
	
	
	@RequestMapping(value="/group/groupManagement", method=RequestMethod.GET)
	public String getGroupManagement(Model model,int memIdx) {
		
		//내 그룹 정보 가져오기
		ArrayList<Group> result= service.selectMyGameGroup(memIdx);
		//model에 집어넣기
		model.addAttribute("readMyGameGroup", result);
		
		// 밑에 주석처리 하면 정상 작동 됨 -> 왜??
		
		//내가 참가한 모임 list
		ArrayList<Group> result2 = service.selectEditGroup(memIdx);
		//모델 집어넣기
		model.addAttribute("readParticipatedGroup", result2);
		
		return "group/groupManagement";
//		return "group/groupManagement?memIdx="+memIdx;
	}
	
}
