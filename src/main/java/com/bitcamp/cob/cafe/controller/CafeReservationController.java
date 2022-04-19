package com.bitcamp.cob.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.CafeReservation;
import com.bitcamp.cob.cafe.service.CafeReservationService;

@Controller
public class CafeReservationController {

	@Autowired
	private CafeReservationService cafeReservationService;
	
	// 예약 버튼
	@RequestMapping(value = "/cafe/cafe_reserv", method = RequestMethod.GET)
	@ResponseBody
	public List<CafeReservation> getReservButton(CafeReservation cafeReservation) {
		// 전달값 - 카페번호, 날짜, 시간, 인원
		//System.out.println("예약메소드 전달값 : "+ cafeReservation);
		List<CafeReservation> resultList = null;
		resultList = cafeReservationService.getReservButton(cafeReservation);
		//System.out.println("예약메소드 반환값 : "+ resultList);
		return resultList;
	}
	
	// 결제 컨트롤러로 이동
//	// 예약
//	@RequestMapping(value = "/cafe/cafe_reserv", method = RequestMethod.POST)
//	@ResponseBody
//	public int regReserv(CafeReservation cafeReservation) {
//		// 전달값 - 카페번호, 날짜, 시간, 인원
//		//System.out.println("예약메소드 전달값 : "+ cafeReservation);
//		int result = 0;
//		result = cafeReservationService.regReserv(cafeReservation);
//		//System.out.println("예약메소드 반환값 : "+ result);
//		return result;
//	}
	
	// 예약 리스트(카페)
	@RequestMapping(value = "/cafe/cafe_reserv_list", method = RequestMethod.POST)
	@ResponseBody
	public List<CafeReservation> getReservList(CafeReservation cafeReservation) {
		// 전달값 - 카페번호, 날짜, 시간, 인원
		//System.out.println("예약메소드 전달값 : "+ cafeReservation);
		List<CafeReservation> resultList = null;
		resultList = cafeReservationService.getReservList(cafeReservation);
		//System.out.println("예약메소드 반환값 : "+ resultList);
		return resultList;
	}
	
	// 예약 리스트 (회원)
	@RequestMapping(value = "/cafe/cafe_reserv_myList", method = RequestMethod.GET)
	public String getMyReserv() {
		return "cafe/cafe_reserv_myList";
	}
	
	// 예약 리스트 (회원)
	@RequestMapping(value = "/cafe/cafe_reserv_myList", method = RequestMethod.POST)
	@ResponseBody
	public List<CafeReservation> getMyReservList(@RequestParam("memIdx")int memIdx, Model model) {   		// 전달값 - 멤버idx
		List<CafeReservation> resultList = null;
		resultList = cafeReservationService.getMyReservList(memIdx);
		//System.out.println("예약메소드 반환값 : "+ resultList);
		//model.addAttribute("resultList", resultList);
		return resultList;
	}
	
	//	결제 컨트롤러 이동
//	// 예약 취소
//	@RequestMapping(value = "/cafe/cafe_reserv", method = RequestMethod.DELETE)
//	@ResponseBody
//	public int delReserv(@RequestParam("reservIdx") int reservIdx) {
//		// 전달값 - 예약 번호
//		System.out.println("예약메소드 전달값 : "+ reservIdx);
//		int result = 0;
//		result = cafeReservationService.delReserv(reservIdx);
//		System.out.println("예약메소드 반환값 : "+ result);
//		return result;
//	}
	
}
