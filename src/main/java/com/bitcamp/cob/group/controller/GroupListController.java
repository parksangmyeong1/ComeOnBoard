package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.bitcamp.cob.group.domain.PageListView;
import com.bitcamp.cob.group.domain.SearchType;
import com.bitcamp.cob.group.service.ShowGroupListService;


@Controller
public class GroupListController {

	@Autowired
	private ShowGroupListService service;

	@RequestMapping(value = "/group/groupList", method = RequestMethod.GET)
	public String getGroupList(SearchType searchType,
								Model model, 
								@RequestParam(value="page", defaultValue = "1") int pageNumber) {

		
		PageListView pageListView = service.getGroupList(pageNumber, searchType);


		model.addAttribute("pageListView", pageListView);
		
		return "group/groupList";
	}

}
