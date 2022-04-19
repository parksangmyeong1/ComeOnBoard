package com.bitcamp.cob.recomment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.recomment.domain.Recomment;
import com.bitcamp.cob.recomment.domain.RecommentRegRequest;
import com.bitcamp.cob.recomment.service.RecommentDeleteService;
import com.bitcamp.cob.recomment.service.RecommentEditService;
import com.bitcamp.cob.recomment.service.RecommentListService;
import com.bitcamp.cob.recomment.service.RecommentRegService;

@Controller
public class recommentController {

	@Autowired
	private RecommentRegService regService;
	
	@Autowired
	private RecommentListService listService;
	
	@Autowired
	private RecommentDeleteService deleteService;
	
	@Autowired
	private RecommentEditService editService;
	
	// 대댓글 등록
	@RequestMapping(value = "/recomment/regComment", method = RequestMethod.POST) 
	@ResponseBody
	public void insertRecomment(
			@ModelAttribute("regRequest") RecommentRegRequest recommRegRequest, 
			HttpServletRequest request,
			Model model) {

		int resultCnt = 0;
		
		resultCnt = regService.regComment(recommRegRequest, request);
		System.out.println(recommRegRequest);
		model.addAttribute("resultCommReg", resultCnt);
	}
	
	// 대댓글 조회
	@RequestMapping(value = "/recomment/recommList", method = RequestMethod.POST)
	@ResponseBody
	public List<Recomment> regRecommView( 
			@ModelAttribute("postIdx") int postIdx, 
			Model model) {

		List<Recomment> list = null;

		list = listService.getRecommentList(postIdx);
		System.out.println(list);
		return list;
	}
	
	// 대댓글 삭제
	@RequestMapping(value="/recomment/deleteRecomment", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> deleteRecomment(
			@ModelAttribute("recommIdx") int recommIdx) throws Exception {

		int resultCnt = 0;
		Map<String, Object> result = new HashMap<>();
		try {

			resultCnt = deleteService.deleteRecomment(recommIdx);
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	// 대댓글 수정
	@RequestMapping(value = "/recomment/editRecomment", method = RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> recommEditView(
			@ModelAttribute("recommIdx") int recommIdx,
			@ModelAttribute("recommContent") String recommContent) {

		int resultCnt = 0;
		Map<String, Object> result = new HashMap<>();

		try {
			resultCnt = editService.editRecomment(recommIdx, recommContent);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}

}