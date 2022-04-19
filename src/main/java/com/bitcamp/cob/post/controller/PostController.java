package com.bitcamp.cob.post.controller;

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

import com.bitcamp.cob.common.utils.PagingVO;
import com.bitcamp.cob.post.domain.CheckRequest;
import com.bitcamp.cob.post.domain.Post;
import com.bitcamp.cob.post.domain.PostRegRequest;
import com.bitcamp.cob.post.domain.SearchType;
import com.bitcamp.cob.post.service.AddService;
import com.bitcamp.cob.post.service.CountService;
import com.bitcamp.cob.post.service.PostDeleteService;
import com.bitcamp.cob.post.service.PostDetailService;
import com.bitcamp.cob.post.service.PostEditService;
import com.bitcamp.cob.post.service.PostListService;
import com.bitcamp.cob.post.service.PostRegService;
import com.bitcamp.cob.post.service.SelectService;

@Controller
public class PostController {

	@Autowired
	private PostListService listService;

	@Autowired
	private PostRegService regService;
	
	@Autowired
	private PostDetailService detailService;
	
	@Autowired
	private PostDeleteService deleteService;
	
	@Autowired
	private PostEditService editService;
	
	@Autowired
	private AddService addService;
	
	@Autowired
	private CountService countService;
	
	@Autowired
	private SelectService selectService;
	
	// naver api
	@RequestMapping(value="/post/api",method=RequestMethod.GET)
	public String goapi() {
		return "post/api";
	}
	
	// 게시글 등록
	@RequestMapping(value = "/post/write", method = RequestMethod.GET)
	public String regPostForm() {

		return "post/postWrite";
	}

	@RequestMapping(value = "/post/write", method = RequestMethod.POST)
	public String regPostView(
			@ModelAttribute("regRequest") PostRegRequest postRegRequest, 
			HttpServletRequest request,
			Model model) {
		
		int resultCnt = 0;

		resultCnt = regService.regPost(postRegRequest, request);
		model.addAttribute("resultReg", resultCnt);

		String view = "redirect:postList";

		return view;
	}

	// 상세 게시글 조회
	@RequestMapping("/post/postDetail{postIdx}") 
	public String openPostDetail(
			@RequestParam("postIdx") int postIdx, 
			Model model) {
	
		List<Post> list = null;
		
		list = detailService.selectpostDetail(postIdx);
		int count = countService.countcomment(postIdx);
		model.addAttribute("postDetail", list);
		model.addAttribute("countComment", count);// kakao용
		if(list != null) {
			return "post/postDetail";
		}
		
		return "post/postDetail";
	}
	
	// 게시글 삭제
	@RequestMapping("/post/postDelete{postIdx}") 
	public String postDelete(
			@RequestParam("postIdx") int postIdx,
			Model model) {
		System.out.println(postIdx);
		int resultCnt = 0;
		
		resultCnt = deleteService.deletePost(postIdx);

		model.addAttribute("deleteResult", resultCnt);
		
		if(resultCnt != 0) {
			return "redirect:postList";
		}

		return "post/postDetail";
	}
		
	// 게시글 수정
	@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.GET) 
	public String postEditForm(
			@RequestParam("postIdx") int postIdx,
			Model model) {

		Post post = null;
		
		post = editService.selectByIdx(postIdx);
		
		model.addAttribute("postEdit", post);

		if(post != null) {
			return "post/postEditForm";
		}

		return "post/postDetail";
	}
	
	@RequestMapping(value = "/post/postEdit{postIdx}", method = RequestMethod.POST) 
	public String postEditView(
			@RequestParam("postIdx") int postIdx,
			Post post, Model model) {

		int resultCnt = 0;

		resultCnt = editService.editPost(post);

		model.addAttribute("editResult", resultCnt);

		if(resultCnt != 0) {
			return "redirect:postDetail?postIdx="+postIdx;
		}

		return "post/postDetail";
	}
	
	// 추천 비추천 신고하기 체크 + 증가
	@RequestMapping(value = "/check/addLike", method = RequestMethod.POST)
	@ResponseBody
	public int addLike(
		@ModelAttribute("regRequest") CheckRequest checkRequest, 
		HttpServletRequest request, Model model) {
		
		int selectResult = 0;
		selectResult = selectService.selectLikeCheck(checkRequest);
		
		// 이미 버튼을 누른 상태
		if(selectResult==1) {
			return 1;
		}else {		// 버튼을 누르지 않은 상태
			// 누른 버튼 등록
			int insertResult = 0;
			insertResult = regService.regCheck(checkRequest, request);
			
			int resultCnt=0;
			resultCnt = addService.addbutton(checkRequest);
			model.addAttribute("check",checkRequest);
			return 0;
		}
	}
	
	// 조회수 증가
	@RequestMapping(value = "/views/addViews", method = RequestMethod.GET) 
	@ResponseBody
	public void addViews(@ModelAttribute("postIdx") int postIdx) {
		addService.addViews(postIdx);
	}
	
	// 초기 리스트 출력
	@RequestMapping(value = "/post/postList", method = RequestMethod.GET)
	public String postList(PagingVO vo, Model model,
			@RequestParam(value="postSort", required = false)String postSort,
			@RequestParam(value="nowPage", required = false)String nowPage,
			@RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		System.out.println("postSort : " + postSort + " nowPage : " + nowPage + " cntPerPage : " + cntPerPage);
		
		// 전체 리스트 출력
		List<Post> list = null;
		
		// 게시글 페이징하고 리스트 출력
		int total = countService.countPost(postSort);
		System.out.println(total);

		nowPage = "1";
		cntPerPage = "20";
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		list = listService.getPostList(vo);
		
		model.addAttribute("postList", list);
		model.addAttribute("postSort", postSort);
		
		return "post/postList";
	}
	
	// 작성자 리스트 출력
	@RequestMapping(value = "/post/searchList1", method = RequestMethod.GET)
	public String searchList(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required = false)String nowPage,
			@RequestParam(value="cntPerPage", required = false)String cntPerPage,
			@RequestParam(value="memIdx")int memIdx) {
		
		// 전체 리스트 출력
		List<Post> list = null;
		
		// 게시글 페이징하고 리스트 출력
		int total = countService.countPost1(memIdx);
		model.addAttribute("memIdx", memIdx);
		System.out.println(total);
		
		if(nowPage==null && cntPerPage==null) {
			nowPage = "1";
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		System.out.println(vo);
		
		list = listService.searchPostList(vo,memIdx);
		
		model.addAttribute("postList", list);
		
		return "post/postList";
	}
	
	// 게시글 리스트 출력
	@RequestMapping(value = "/post/searchList", method = RequestMethod.GET)
	public String postList1(PagingVO vo, Model model,
			@RequestParam(value="postSort", required = false)String postSort,
			@RequestParam(value="nowPage", required = false)String nowPage,
			@RequestParam(value="cntPerPage", required = false)String cntPerPage,
			SearchType searchType) {

		System.out.println("postSort : " + postSort + " nowPage : " + nowPage + " cntPerPage : " + cntPerPage);
		System.out.println(searchType);
		// 전체 리스트 출력
		List<Post> list = null;

		// 게시글 페이징하고 리스트 출력
		int total = countService.countPost(postSort);
		System.out.println(postSort);
		System.out.println(total);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "20";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo);
		model.addAttribute("paging", vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item1", searchType);
		map.put("item2", vo);
		map.put("postSort", postSort);
		
		// 카테고리별로 리스트 출력
		if(postSort != null && !postSort.equals("")) {	// 카테고리 o
			
			list = listService.getPostList(map);	// 성공
		
		}else if(postSort == null || postSort.equals("")) {	// 카테고리 X
			
			System.out.println("카테고리 x 검색 x");	// 성공
			System.out.println(vo);
			list = listService.getPostList(vo);
			
			if(!searchType.getKeyword().equals("")) {
				
				System.out.println("카테고리 x 검색 o");	// 절반 성공
				total = countService.countPagingPost(map);
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				System.out.println(vo);
				model.addAttribute("paging", vo);
				map.put("item2", vo);
				list = listService.getPostListSearchType(map);
			
			}
		}
		
		model.addAttribute("postList", list);
		model.addAttribute("postSort", postSort);
		model.addAttribute("searchType", searchType);

		return "post/postList";
	}

}