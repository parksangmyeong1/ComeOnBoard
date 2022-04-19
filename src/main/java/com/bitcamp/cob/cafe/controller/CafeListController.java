package com.bitcamp.cob.cafe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.service.cafeListService;

@Controller
public class CafeListController {

	@Autowired
	private cafeListService cafeListService;
	
	// 기본 페이지 출력 - 최신 등록순 
	@RequestMapping(value = "/cafe/cafe_list", method = RequestMethod.GET)
	public String cafeList(Model model, CafePaging cafePaging) {
		
		//System.out.println("cafeList GET 메소드 실행");
		
		List<Cafe> list = null;
		
		cafePaging.setPage(1);
		//System.out.println("정렬타입 : "+cafePaging.getSortType());
		// 디폴트 페이지를 위한 분기		
		if(cafePaging.getSortType() == null) {
			cafePaging.setSortType("cafeIdx");
		}
		
		if(cafePaging.getKeyword() != null && cafePaging.getKeyword().trim().length() > 0) {
			list = cafeListService.cafeListByKeyword(cafePaging);
		} else {
			list = cafeListService.cafeListBySort(cafePaging);
		}
		model.addAttribute("cafePaging", cafePaging);
		model.addAttribute("list", list);
		
		return "cafe/cafe_list";
	}
		
	// 스크롤 페이징
	@RequestMapping(value = "/cafe/cafe_listPaging", method = RequestMethod.POST)
	@ResponseBody
	public CafePaging listPaging(@RequestBody CafePaging cafePaging, Model model){
		
		//System.out.println("cafeList POST 메소드 실행" + cafePaging);
		List<Cafe> list = null;
		
		if(cafePaging.getSortType() == null) {
			cafePaging.setSortType("cafeIdx");
		}
		
		if(cafePaging.getKeyword() != null && cafePaging.getKeyword().trim().length() > 0) {
			//System.out.println("키워드 설정시 실행");
			list = cafeListService.cafeListByKeyword(cafePaging);
		} else {
			//System.out.println("컨트롤러 정렬 설정시 실행");
			list = cafeListService.cafeListBySort(cafePaging);
		}
		cafePaging.setCafe(list);
		cafePaging.setTotalCnt(cafeListService.getCafeTotalCnt());
		
		model.addAttribute("cafePaging", cafePaging);
		return cafePaging;
	}
	
}
