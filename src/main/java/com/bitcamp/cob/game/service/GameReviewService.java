package com.bitcamp.cob.game.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.GameReview;

@Service
public class GameReviewService {

	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<GameReview> gameRevSelect(GameReview gameIdx) {
					
		return template.getMapper(GameDao.class).selectReview(gameIdx);
	}
	
	
	// 리뷰작성
	public int gameRevReg(GameReview gameRev ) {
		
		
		return template.getMapper(GameDao.class).insertGameRev(gameRev);
	}
	
	// 리뷰삭제
	public int gameRevDel(GameReview gameRev ) {
		
		return template.getMapper(GameDao.class).deleteRev(gameRev);
	}

	// 리뷰수정
	public int gameRevEdit(GameReview gameRev) {
		return template.getMapper(GameDao.class).EditRev(gameRev);
	}
	
	
}
