package com.bitcamp.cob.game.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.GamePage;
import com.bitcamp.cob.game.domain.PreferGame;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.member.domain.GameInfo;

@Service
public class GamePageService {

	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public GamePage getGamePage(int idx){
		
		return template.getMapper(GameDao.class).selectGamePage(idx);
				
	}


	// 선호게임 등록
	public int preferGame(PreferGame preferGame) {
		return template.getMapper(GameDao.class).insertPreferGame(preferGame);
	}
	// 선호게임 삭제
	public int deleteGame(PreferGame preferGame) {
		
		return template.getMapper(GameDao.class).deletePreferGame(preferGame);
	}
	
}
