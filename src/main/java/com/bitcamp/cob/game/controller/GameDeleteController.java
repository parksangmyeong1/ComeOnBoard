package com.bitcamp.cob.game.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.game.domain.Game;
import com.bitcamp.cob.game.service.GameDeleteService;

@Controller
@RequestMapping("/game/confirmDelete/{idx}")
public class GameDeleteController {

	@Autowired
	private GameDeleteService deleteService;

	@RequestMapping(method = RequestMethod.GET)
	public String gameDelete() {
		System.out.println("delete 겟");
		return "game/confirmDelete";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String gameReg(
			HttpServletRequest request, 
			Model model, 
			@ModelAttribute("game") Game game) {

		System.out.println("delete 컨트롤러 post");

		int result = deleteService.gameDelete(game);
		String view = "game/confirmDelete";

		System.out.println("delete" + result);
		model.addAttribute("result", result);

		if (result == 1) {
			view = "redirect:/";
		}
		System.out.println("delete222" + result);
		return view;
	}

}
