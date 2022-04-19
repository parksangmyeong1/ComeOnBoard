package com.bitcamp.cob.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.game.domain.GameReview;
import com.bitcamp.cob.game.service.GameReviewService;

@Controller
public class GameRevRegController {
	
	@Autowired
	public GameReviewService reviewService;
	
	// 게임리뷰 리스트 출력
	@RequestMapping(value ="/game/gamerevpage", method = RequestMethod.GET)
	@ResponseBody
	public List<GameReview> gameRevSelect(GameReview gameIdx
			) {
		System.out.println("get으로받았따ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		List<GameReview> gameRevSelect = null;
		
		gameRevSelect = reviewService.gameRevSelect(gameIdx);
		//System.out.println("게임리뷰페이지 ::::" + gameRevSelect);
		return gameRevSelect;
	}
		
	
	// 게임 리뷰 등록
	@RequestMapping(value = "/game/gamepage/{idx}" ,method = RequestMethod.POST)
	public String gameRevReg(
			GameReview gameRev,
			@PathVariable("idx") int idx
			) {
		//System.out.println("게임 리뷰 등록 " + gameRev);
		
		//gameRev.setGameIdx(idx);
		
		int result = reviewService.gameRevReg(gameRev);
		
		//System.out.println("게임 리뷰 등록22 " + result);
		
		//String view = "game/gamePage2";
		//String view = "redirect:gamePage2.do";
		return "redirect:" + idx;
	}

	// 게임 리뷰 수정
	@RequestMapping(value = "/game/gamepage2/{revidx}", method = RequestMethod.POST)
	public String gameRevEdit(
			GameReview gameRev,
			@PathVariable("revidx") int revidx
			) {
		System.out.println("수정정보 : " + gameRev);
		
		gameRev.setRevContent(gameRev.getRevContent());
		gameRev.setRevRating(gameRev.getRevRating());
		gameRev.setRevIdx(revidx);
		int result =reviewService.gameRevEdit(gameRev);
		
		
		
		return "redirect: " + revidx;
	}
	
	
	// 게임 리뷰 삭제
	@RequestMapping(value = "/game/gamepage1/{gameidx}" ,method = RequestMethod.POST)
	@ResponseBody
	public String gameRevDele(
			GameReview gameRev,
			@PathVariable("gameidx") int gameidx
			
			) {
		System.out.println("리뷰삭제 들어옴");
		gameRev.setGameIdx(gameidx);
		gameRev.setRevIdx(gameRev.getRevIdx());
		gameRev.setMemIdx(gameRev.getMemIdx());
		System.out.println(" 리뷰 삭제 정보: " + gameRev);
		int result = reviewService.gameRevDel(gameRev);
		
		return "result";
		
	}
	

}


