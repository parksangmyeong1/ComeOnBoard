package com.bitcamp.cob.cafe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafeImgInfo;
import com.bitcamp.cob.cafe.service.CafeImgService;

@Controller
public class CafeImgController {

	@Autowired
	private CafeImgService cafeImgService;
	
	// 이미지 저장 폼 
	@RequestMapping(value = "/cafe/cafe_regImg", method= RequestMethod.GET)
	public String viewPage(CafeImgInfo cafeImgInfo) {
		return "cafe/cafe_regImg";
	}
	
	// 이미지 저장
	@RequestMapping(value = "/cafe/cafe_regImg", method = RequestMethod.POST)
	public String regImg(Cafe cafe, HttpServletRequest request, Model model) {
		System.out.println("regImg 메소드 - cafe 전달값 : "+cafe);
		int resultThumbnail = 0;
		int resultImg = 0;
		int success = 0;
		
		if(cafe.getCafeThumbnailFile() != null && !cafe.getCafeThumbnailFile().isEmpty() ) {
			resultThumbnail = cafeImgService.regCafeThumbnail(cafe, request);	
		}
		if(cafe.getCafeImgFile() != null && cafe.getCafeImgFile().size() > 0 ) {
			resultImg = cafeImgService.regCafeImg(cafe, request, model);
		}
		
		
		System.out.println("regImg 메소드 - 썸네일 : "+cafe.getCafeThumbnail());
		System.out.println("regImg 메소드 - 이미지 : "+cafe.getCafeImg());
		System.out.println("regImg 메소드 - 썸네일 결과값 : "+resultThumbnail);
		System.out.println("regImg 메소드 - 이미지 결과값 : "+resultImg);
		
		// 사용자가 등록한 이미지 갯수 == 등록된 갯수
		if(cafe.getCafeImgFile().size() == resultImg) {
			success = 1;
		}
		// 등록 여부
		model.addAttribute("success", success);
		// 실행된 행의 갯수 반환값
		model.addAttribute("resultThumbnail", resultThumbnail);
		model.addAttribute("resultImg", resultImg);
		// 페이지 이동을 위한 카페idx
		model.addAttribute("cafeIdx", cafe.getCafeIdx());
		return "cafe/cafe_regImgResult";
	}
	
	// 이미지 리스트 반환
	@RequestMapping(value="/cafe/fileDel", method= RequestMethod.POST)
	@ResponseBody
	public List<CafeImgInfo> viewFile(CafeImgInfo cafeImgInfo) {
		List<CafeImgInfo> cafeImg = null;
		//System.out.println("fileDelete get 메소드 전달값 : "+cafeImgInfo);
		cafeImg = cafeImgService.getImgList(cafeImgInfo);
		//System.out.println("fileDelete get 반환값 : "+cafeImg);
		return cafeImg;
	}
	
	// 이미지 수정
	@RequestMapping(value = "/cafe/cafe_regImg", method = RequestMethod.PUT)
	public String updateImg(Cafe cafe, HttpServletRequest request, @RequestParam("memIdx") int memIdx, Model model) {
		System.out.println("이미지 저장 메소드 실행" + cafe);
		
		if(cafe.getCafeThumbnailFile() != null && !cafe.getCafeThumbnailFile().isEmpty() ) {
			int result = cafeImgService.regCafeThumbnail(cafe, request);
			System.out.println("이미지 저장 결과 : "+result);
		}
		if(cafe.getCafeImgFile() != null && cafe.getCafeImgFile().size() > 0 ) {
			int result2 = cafeImgService.regCafeImg(cafe, request, model);
			System.out.println("이미지 저장 결과 : "+result2);
		}
		
		System.out.println("파일이름 : "+cafe.getCafeThumbnail());
		return null;
	}
	
	// 이미지 삭제
	@RequestMapping(value="/cafe/fileDel1", method= RequestMethod.POST)
	@ResponseBody
	public int deleteFile(CafeImgInfo cafeImgInfo, HttpServletRequest request) {
		System.out.println("deleteFile 메소드 전달값 : " + cafeImgInfo);
		//System.out.println("deleteFile 메소드 전달값 : " + path);
		
		int result = 0;
		result = cafeImgService.delImg(cafeImgInfo, request);
		return result;
	}
}
