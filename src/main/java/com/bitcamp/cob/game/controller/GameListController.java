package com.bitcamp.cob.game.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cob.game.domain.GameListView;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.service.GameListService;

@Controller
public class GameListController {

	@Autowired
	private GameListService listService;
	
	
	@RequestMapping("/game/gamelist")
	public String getGameList(
			Model model,
			HttpSession session,
			SearchType searchType
			) {

		GameListView listView = null; //원본
		//List<GameMain> list = null;
		String view = null; //원본

		view = "game/gameList2";
		//System.out.println("여기까진 된거?");
		//System.out.println("url : " + searchType);
		listView = listService.getGameList(searchType); // 페이징 데이터 //원본
		//System.out.println("뭐가 드어오긴함?" + listView);

		model.addAttribute("listView", listView); //원본
		session.setAttribute("order", searchType.getOrderType());
		// session.setAttribute("gamelist", list);
		//System.out.println("gamelist data : " + list);

		return view;
	}


	
}
