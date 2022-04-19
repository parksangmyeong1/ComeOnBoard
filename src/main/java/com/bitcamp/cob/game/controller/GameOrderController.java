package com.bitcamp.cob.game.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.game.domain.GameOrder;
import com.bitcamp.cob.game.service.GameOrderService;

@Controller
public class GameOrderController {

	@Autowired
	private GameOrderService orderService;
	
	@RequestMapping(value="/game/order/{gameidx}", method = RequestMethod.GET)
	public String gamePayForm() {
		System.out.println("찍힘?get");
		
		return "game/gameOrderForm";
	}
	
	
	@RequestMapping(value="/game/order/{gameidx}", method = RequestMethod.POST)
	public String gamePay(
			HttpServletRequest request,
			Model model,
			@ModelAttribute("order") GameOrder order
			) {		
		System.out.println("찍힘?post"+order);
		
		int result = orderService.gamePay(order);
		System.out.println("찍힘?post");
		String view = "game/gamelist";		
		model.addAttribute("result",result);
		if(result == 1) {
			view = "member/mypage";
		}
		
		return view;
	}
	
}
