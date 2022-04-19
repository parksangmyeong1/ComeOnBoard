package com.bitcamp.cob.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.domain.NicknameMemidxGrpidx;
import com.bitcamp.cob.group.domain.NicknameList;
import com.bitcamp.cob.group.domain.RegGroup;
import com.bitcamp.cob.group.service.EditorAttendService;
import com.bitcamp.cob.group.service.EditorDeleteService;
import com.bitcamp.cob.group.service.ManageGroupService;
import com.bitcamp.cob.group.service.ReadGroupBoardService;

@Controller
public class GroupEditorController {

	@Autowired
	private ManageGroupService service;

	@Autowired
	private ReadGroupBoardService readContentService;

	@Autowired
	private EditorAttendService attendService;
	
	@Autowired
	private EditorDeleteService deleteService;

	// 1. readGroup.jsp에서 모임 참가 신청을 할 때 정보 받음 a href
	// 2. groupManagement.jsp에서 a href
	// 각각의 requestmapping 주소를 다르게 해주고 return은 동일하게 처리 하자

	@RequestMapping(value = "/group/groupEditor", method = RequestMethod.GET)
	public String getGroupEditor(int memIdx, int grpIdx, Model model) {

		service.insertEditGroup(memIdx, grpIdx); // 모임 참가 DB 정보 저장

//		RegGroup result = service.selectEditGroup(); // 내가 참가한 모임(groupreg)
//		model.addAttribute("groupEditorReadResult", result);

		return "redirect:/group/groupList";
//		return "redirect:/group/readGroup";	//오류
	}

	// groupManagement.jsp 에서 '게시물관리' 클릭시 저장된 게시글 정보를 select에서 화면에 보여주기
	@RequestMapping(value = "/group/groupEditorMyGroup", method = RequestMethod.GET)
//	@ResponseBody	// 이거 있으면 페이지 안나오던데 이유가 뭐지?? 매개변수에 선언 해주어야 하나?
	public String getGroupEditorFromGroupManagementJsp(int grpIdx, Model model) {

		// 해당 게시글의 정보 가져오기
		Group result = readContentService.groupBoard(grpIdx);
		// 모델에 저장하기
		model.addAttribute("groupEditorReadMyGroupResult", result);

//		ArrayList<NicknameMemidxGrpidx> result2 = service.selectRegGroupNickname(grpIdx); // 모임에 참가한 사람의 닉네임 가져오기
//		model.addAttribute("editorNicknameMemidxGrpIdx", result2);

		// 1. grpConfirm = 0 인 groupreg1 리스트
		ArrayList<NicknameMemidxGrpidx> result0 = service.selectGrpConfirm0(grpIdx);
		model.addAttribute("ajaxConfirmZeroList", result0);

		// 2. grpConfirm = 1 인 groupreg1 리스트
		ArrayList<NicknameMemidxGrpidx> result1 = service.selectGrpConfirm1(grpIdx);
		model.addAttribute("ajaxConfirmOneList", result1);
		
		// 참가인원, 최대정원 count(grpRegIdx)
		int result2 = service.countRegMem(grpIdx);
		int result3 = service.countMaxMem(grpIdx);
		model.addAttribute("countMem", result2+1);
		model.addAttribute("countMaxMem", result3);
		
		return "/group/groupEditor";
	}

	@ResponseBody
	@RequestMapping(value = "/group/groupEditorAjax", method = RequestMethod.GET)
	public String getAjaxData(int memIdx, int grpIdx) {

		// grpConfirm -> 1로 바꿔주는 메소드(참여 인정)
		attendService.updateAttendants(memIdx, grpIdx);

		return "/group/groupEditor";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/group/groupEditorAjaxDelete", method=RequestMethod.GET)
	public String getAjaxDataToDelete(int memIdx, int grpIdx) {
		
		// 참가 거절
		deleteService.deleteAttendant(memIdx, grpIdx);
		
		return "/group/groupEditor";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/group/groupEditorAjaxDelete2", method=RequestMethod.GET)
	public String getAjaxDataToDelete2(int memIdx, int grpIdx) {
		
		// 참여자 추방
		deleteService.deleteAttenddant2(memIdx, grpIdx);
		
		return "/group/groupEditor";
	}
	

}












