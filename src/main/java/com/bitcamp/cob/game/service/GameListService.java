package com.bitcamp.cob.game.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.GameListView;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.SearchType;

@Service
public class GameListService {

	
	@Autowired
	private SqlSessionTemplate template;
	
	
	//페이지에 표현할 메시지 개수
	private final int gameCountPerPage = 10;
	
	public GameListView getGameList( SearchType searchType) {
		//System.out.println("여기로오니(GameListService)?");		
		
		GameListView listView = null;
		int orderType = searchType.getOrderType();		
		int sort = searchType.getSortType();
		//System.out.println("키워드 : " + searchType.getKeyword());
		///////////////////////////////////
		// 전체 게시물의 갯수
		int gameTotalCount = template.getMapper(GameDao.class).countGameList(searchType);
		
		//System.out.println("totalCount : " + gameTotalCount );
		// 페이지에 표현할  객체들 List<GameMain>
		List<GameMain> gameList = null;
		//SearchType search = null;
		// 시작행의 위치값  limit index
		int firstRow = (searchType.getPage()-1)*gameCountPerPage;
		//System.out.println("totalCount : " + firstRow +  gameCountPerPage + searchType.getKeyword());
		searchType.setFirstRow(firstRow);
		searchType.setGameCountPerPage(gameCountPerPage);
		searchType.setOrderType(orderType);
		searchType.setSortType(sort);
		//System.out.println("searchType : " + searchType);
		gameList = template.getMapper(GameDao.class).selectGamePaging(searchType);
		//System.out.println("gameList : " + gameList);
		
		listView = new GameListView(
				gameList, 
				gameTotalCount, 
				searchType.getPage(), 
				gameCountPerPage, 
				firstRow, 
				0,
				1,
				0,
				orderType,
				sort);
		System.out.println("listView : " + listView);
		return listView;
	}


	

}
