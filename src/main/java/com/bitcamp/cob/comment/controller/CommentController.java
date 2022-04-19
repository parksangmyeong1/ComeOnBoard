package com.bitcamp.cob.comment.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.comment.domain.Comment;
import com.bitcamp.cob.comment.domain.CommentRegRequest;
import com.bitcamp.cob.comment.domain.CommentPagingRequest;
import com.bitcamp.cob.comment.service.CommentCountService;
import com.bitcamp.cob.comment.service.CommentDeleteService;
import com.bitcamp.cob.comment.service.CommentEditService;
import com.bitcamp.cob.comment.service.CommentListService;
import com.bitcamp.cob.comment.service.CommentRegService;

@Controller
public class CommentController {

	@Autowired
	private CommentRegService regService;
	
	@Autowired
	private CommentListService listService;

	@Autowired
	private CommentDeleteService deleteService;
	
	@Autowired
	private CommentEditService editService;
	
	@Autowired
	private CommentCountService countService;
	
	// 댓글 작성
	@RequestMapping(value = "/comment/regComment", method = RequestMethod.POST)
	@ResponseBody
	public void regCommView( 
			@ModelAttribute("regRequest") CommentRegRequest commRegRequest, 
			HttpServletRequest request,
			Model model) {
		int resultCnt = 0;
		System.out.println("컨트롤 : " + commRegRequest);
		resultCnt = regService.regComment(commRegRequest, request);
	}
	
	// 댓글 조회
	@RequestMapping(value = "/comment/commentList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectCommList(CommentPagingRequest request, Model model,
			@RequestParam(value="page", defaultValue = "1", required = false)int page) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int listcount = listService.getListCount(request);	// 댓글 총 갯수
		System.out.println("listcount : " + listcount);
		
		// 총 페이지수
		int maxpage = (listcount + request.getCommPerPage() - 1) / request.getCommPerPage(); // (13 + 9) / 10
		System.out.println("maxpage : " + maxpage);
		
		// 시작 페이지수
		int startpage = ((page - 1) / 10) * 10 + 1;
		System.out.println("startpage : " + startpage);
		
		// 마지막 페이지수
		int endpage = startpage + 10 - 1;
		System.out.println("endpage : " + endpage);
		if (endpage > maxpage) {
			endpage = maxpage;
		}

		request.setCurrentPage(page);
		request.setStartNum((page-1)*request.getCommPerPage());
		request.setEndNum(endpage);

		List<Comment> commList = listService.getCommentList(request);

		result.put("List",  commList);
		result.put("page",  page);
		result.put("startpage",  startpage);
		result.put("endpage",  endpage);
		
		model.addAttribute("pageNum", request.getCurrentPage());
		return result;
	}

	// 댓글 삭제
	@RequestMapping(value="/comment/deleteComment", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> deleteComment(
			@ModelAttribute("commIdx") int commIdx) throws Exception {
		
		int resultCnt = 0;
		Map<String, Object> result = new HashMap<>();
		try {
			
			resultCnt = deleteService.deleteComment(commIdx);
			result.put("status", "OK");

		} catch (Exception e) {
		e.printStackTrace();
		result.put("status", "False");
		}
		return result;
	}

		
	// 게시글 수정
	@RequestMapping(value = "/comment/editComment", method = RequestMethod.POST) 
	@ResponseBody
	public Map<String, Object> postEditView(
			@ModelAttribute("commIdx") int commIdx,
			@ModelAttribute("commContent") String commContent) {

		int resultCnt = 0;
		Map<String, Object> result = new HashMap<>();
		
		try {
			
			resultCnt = editService.editComment(commIdx, commContent);
			result.put("status", "OK");

		} catch (Exception e) {
		e.printStackTrace();
		result.put("status", "False");
		}
		return result;
	}
	
	// 댓글 수 조회
	@RequestMapping(value = "/comment/countComment", method = RequestMethod.POST) 
	@ResponseBody
	public int addViews(Model model,
			@ModelAttribute("postIdx") int postIdx) {
		int result = 0;
		result = countService.countComment(postIdx);
		model.addAttribute("commCount", result);
		System.out.println(result);
		return result;
	}

	// 베스트 댓글 리스트 가져오기
	@RequestMapping(value = "/comment/bestComment", method = RequestMethod.POST)
	@ResponseBody
	public Comment selectBestComment(
			@RequestParam("postIdx") int postIdx) {

		Comment comm = null;
		
		comm = listService.getBestComment(postIdx);
		System.out.println(comm);
		
		return comm;
	}
}