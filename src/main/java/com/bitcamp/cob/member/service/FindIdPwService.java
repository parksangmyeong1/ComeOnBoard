package com.bitcamp.cob.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.FindIdPwInfo;

@Service
public class FindIdPwService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<String> findIdByEmail(FindIdPwInfo findIdPwInfo) {
		return template.getMapper(MemberDao.class).getMemId(findIdPwInfo);
	}

	public int findPwByEmail(FindIdPwInfo findIdPwInfo) {
		return template.getMapper(MemberDao.class).getMemPw(findIdPwInfo);
	}

	public int updatePassword(String memId, String memPassword) {
		return template.getMapper(MemberDao.class).updatePwById(memId, memPassword);
	}
}
