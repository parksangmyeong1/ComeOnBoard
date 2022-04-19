package com.bitcamp.cob.game.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.OrderList;

@Service
public class GameOrderListService {

	@Autowired
	private SqlSessionTemplate template;
	
	public List<OrderList> getOrderList(int idx){
		return template.getMapper(GameDao.class).selectOrderList(idx);
	}
	
}
