package com.bitcamp.cob.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;

@Service
public class PwCheckService {	
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public int pwCheck(String mid, String pw) {
		int result = 0;
		
		dao = template.getMapper(MemberDao.class);
		
		result = dao.selectPwById(mid, pw);

		return result;
	}

	public int pwUpdate(String memId, String memPassword) {
		int result = 0;
		
		dao = template.getMapper(MemberDao.class);
		
		result = dao.updatePwById(memId, memPassword);
		return result;
	}
}
