package com.bitcamp.cob.game.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.game.domain.GameEditRequest;
import com.bitcamp.cob.game.service.GameEditService;

@Controller
@RequestMapping("/game/gameEdit/{idx}")
public class GameEditController {

	@Autowired
	private GameEditService editService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String gameEdit() {
		System.out.println("에딧뭐냐");
		return "game/gameEditForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String gameReg(@ModelAttribute("regRequest") GameEditRequest regRequest, 
			HttpServletRequest request,
			Model model) {

		System.out.println("컨트롤러 post");
		System.out.println(regRequest); // 여기서 idx값을 0으로 바다옴 why?

		int result = editService.gameReg(regRequest, request);
		String view = "game/gameEditForm";

		System.out.println("edit : " + result);
		model.addAttribute("result", result);

		if (result == 1) {
			System.out.println("게임수정완료");
			view = "redirect:/game/gamepage/"+regRequest.getGameIdx();
		}
		System.out.println("edit222 : " + result);
		return view;
	}
	
}
