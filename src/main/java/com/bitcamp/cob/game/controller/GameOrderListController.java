package com.bitcamp.cob.game.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cob.game.domain.GameListView;
import com.bitcamp.cob.game.domain.OrderList;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.service.GameListService;
import com.bitcamp.cob.game.service.GameOrderListService;

@Controller
public class GameOrderListController {

	@Autowired
	private GameOrderListService listService;
	
	
	@RequestMapping("/game/gameorderlist/{idx}")
	public String getGameList(
			Model model,
			HttpSession session,
			@PathVariable("idx") int idx
			) {

		List<OrderList> list = null;
		list = listService.getOrderList(idx);
		model.addAttribute("orderlist",list);
		
		return "game/gameOrderList";
	}


	
}
