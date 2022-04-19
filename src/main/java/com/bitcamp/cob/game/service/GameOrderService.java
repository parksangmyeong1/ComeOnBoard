package com.bitcamp.cob.game.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.GameOrder;

@Service
public class GameOrderService {

	private GameDao dao;
	@Autowired
	private SqlSessionTemplate template;
	
	public int gamePay(GameOrder order) {
	System.out.println("찎히나?");
		return  template.getMapper(GameDao.class).insertOrder(order);
	}
}
