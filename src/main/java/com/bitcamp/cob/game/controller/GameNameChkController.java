package com.bitcamp.cob.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.game.domain.PreferGame;
import com.bitcamp.cob.game.service.GameNameChkService;
@Controller
public class GameNameChkController {

	@Autowired
	private GameNameChkService checkService;
	
	@RequestMapping(value = "/game/nameChk", method = RequestMethod.POST)
	@ResponseBody
	public String nameChk(
			@RequestParam("gameName") String gameName
			) {
		
		String chk = "Y";
		
		chk = checkService.gameNameChk(gameName);
		
		return chk;
		
	}
	
	@RequestMapping(value = "/game/preferChk", method = RequestMethod.POST)
	@ResponseBody
	public String preferChk(
			@RequestParam("gameIdx") int gameIdx,
			@RequestParam("memIdx") int memIdx,
			PreferGame pgf
			) {
		
		String chk = "Y";
		System.out.println("선호게임");
		pgf.setGameIdx(gameIdx);
		pgf.setMemIdx(memIdx);
		chk = checkService.gamePreferChk(pgf);
		System.out.println("선호게임 : " + chk);
		return chk;
	}
	
	
}
