package com.bitcamp.cob.msg.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.msg.dao.MsgDao;
import com.bitcamp.cob.msg.domain.Msg;


@Service
public class MsgService {

	@Autowired
	private SqlSessionTemplate template;
	
	public int postMsg(Msg msg) {
		return template.getMapper(MsgDao.class).postMsg(msg);
	}

}
