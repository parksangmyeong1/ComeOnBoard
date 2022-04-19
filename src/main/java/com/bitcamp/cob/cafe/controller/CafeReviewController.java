package com.bitcamp.cob.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.CafeReview;
import com.bitcamp.cob.cafe.domain.CafeReviewPaging;
import com.bitcamp.cob.cafe.service.CafeReviewService;

@Controller
public class CafeReviewController {

	@Autowired
	private CafeReviewService cafeReviewService;

	// 리뷰 리스트 반환
	@RequestMapping(value= "/cafe/cafe_review", method = RequestMethod.GET)
	@ResponseBody
	public CafeReviewPaging getCafeReview(CafeReviewPaging cafeReviewPaging) {

		// 선택한 카페의 전체 리뷰 갯수
		int reviewCnt = cafeReviewService.getTotalCafeReviewCnt(cafeReviewPaging.getCafeIdx());
		cafeReviewPaging.setTotalReviewCnt(reviewCnt);
		
		// 시작 인덱스
		int startIdx = (cafeReviewPaging.getCurrentPage()-1)*5;
		cafeReviewPaging.setStartNum(startIdx);
		
		// 가져올 갯수
		cafeReviewPaging.setEndNum(5);

		// 페이지 총 갯수
		if(cafeReviewPaging.getTotalReviewCnt() == 0) { // 리뷰가 없다면 0
			cafeReviewPaging.setTotalPage(0);
		} else {
			cafeReviewPaging.setTotalPage(reviewCnt / 5); // 전체 리뷰 게시물 / 화면에 출력할 갯수
			if(reviewCnt % 5 > 0) { // 나머지가 있다면 +1
				cafeReviewPaging.setTotalPage(cafeReviewPaging.getTotalPage()+1);
			}
		}
		
		//System.out.println("전달값" + cafeReviewPaging);	
		List<CafeReview> list = cafeReviewService.getCafeReview(cafeReviewPaging);
		cafeReviewPaging.setCafeReview(list);
		//System.out.println("결과값" + cafeReviewPaging);
		return cafeReviewPaging;
	}
	
	// 리뷰 작성
	@RequestMapping(value= "/cafe/cafe_page/{id}", method = RequestMethod.POST)
	public String writeCafeReview(CafeReview cafeReview, @PathVariable("id") int idx) {
	
		cafeReview.setCafeIdx(idx);
		//System.out.println(cafeReview);
		
		int result = cafeReviewService.writeCafeReview(cafeReview);

		//System.out.println(result);
		return "redirect:"+idx;
	}
	
	// 리뷰 수정
	@RequestMapping(value= "/cafe/cafe_page/{id}", method = RequestMethod.PUT)
	public String updateCafeReview(CafeReview cafeReview, @PathVariable("id") int idx) {
	
		//System.out.println("수정 메소드 실행 : "+cafeReview);
		
		int result = cafeReviewService.updateCafeReview(cafeReview);
		//System.out.println("수정 결과 : " + result);
		return "redirect:"+idx;
	}
	
	// 리뷰 삭제
	@RequestMapping(value="/cafe/cafe_page/{id}", method = RequestMethod.DELETE)
	public String deleteCafeReview(CafeReview cafeReview, @PathVariable("id") int idx) {
		
		//System.out.println("삭제 메소드 실헹 : " + cafeReview);
		
		int result = cafeReviewService.deleteCafeRevie(cafeReview.getRevIdx());
		//System.out.println("삭제 결과 : " + result);
		return "redirect:"+idx;
	}
}
	
	
	
	
	

	
