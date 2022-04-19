package com.bitcamp.cob.game.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.PreferGame;

@Service
public class GameNameChkService {

	private GameDao dao;
	
	private PreferGame pfg;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String gameNameChk(String gameName) {
		
		String result = "Y";
		
		dao = template.getMapper(GameDao.class);
		
		if(dao.selectName(gameName)>0) {
			result = "N";
		}
		
		return result;
	}

	public String gamePreferChk(PreferGame pgf) {
		System.out.println("선호게임 서비스 ");
		String result = "Y";
		
		//System.out.println("game"+gameIdx+"memidx"+memIdx);
		dao = template.getMapper(GameDao.class);
		System.out.println("선호게임 서비스 1 :" + dao.preferChk(pgf) );
		if(dao.preferChk(pgf) > 0) {
			result = "N";
		}
		System.out.println("선호게임 서비스 2");
		return result;
		
	}

}
