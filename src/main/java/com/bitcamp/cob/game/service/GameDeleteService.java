package com.bitcamp.cob.game.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.Game;

@Service
public class GameDeleteService {

	private GameDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int gameDelete(Game game) {
		
		int resultCnt = 0;
		
		resultCnt = template.getMapper(GameDao.class).deleteGame(game);
		
		return resultCnt;
	}
}
