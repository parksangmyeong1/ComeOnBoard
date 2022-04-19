package com.bitcamp.cob.game.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.game.domain.GamePage;
import com.bitcamp.cob.game.domain.GameReview;
import com.bitcamp.cob.game.domain.PreferGame;
import com.bitcamp.cob.game.service.GamePageService;
import com.bitcamp.cob.member.domain.GameInfo;

@Controller
public class GamePageController {

	@Autowired
	private GamePageService pageService;
	
	
	@RequestMapping("/game/gamepage/{idx}")
	public String getGamePage(
			Model model,
			HttpSession session,
			@PathVariable("idx") int idx
			) {
				
		GamePage list = null;		
		String view = "game/gamePage2";

		list = pageService.getGamePage(idx);
		model.addAttribute("gamepage",list);
		session.setAttribute("gamepage", list);
		
		//System.out.println("여기가문제?" + list);		
		return view;
	}
	
	//선호게임 등록
	@RequestMapping(value ="/game/preferGame/{gameidx}", method = RequestMethod.GET)
	public String insertPrefer() {		
		return "game/gamePage2";
	}
			
	
	@RequestMapping(value = "/game/preferGame/{gameidx}",method = RequestMethod.POST)
	public String insertPreferGame(
			PreferGame preferGame,
			@PathVariable("gameidx") int gameidx
			) {		
		int result = pageService.preferGame(preferGame);	
		return "redirect:"+gameidx;
	}

	
	// 선호게임삭제
	@RequestMapping(value ="/game/preferGame2/{gameidx}", method = RequestMethod.GET)
	public String deletePrefer() {		
		return "game/gamePage2";
	}	
	
	@RequestMapping(value = "/game/preferGame2/{gameidx}",method = RequestMethod.POST)
	public String deletePreferGame(
			PreferGame preferGame,
			@PathVariable("gameidx") int gameidx
			) {
		
		int result = pageService.deleteGame(preferGame);
		
		return "redirect:"+gameidx;
	}
	
	
	
	
	
	
}
