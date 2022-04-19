package com.bitcamp.cob.member.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;

@Service
public class IdCheckService {	
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public String idCheck(String id) {
		
		String result = "Y";
		
		Pattern p = Pattern.compile("^[a-z0-9]{8,16}$");
		Matcher m = p.matcher(id);
		if(!m.matches()) {
			result = "R";
		} else {
			dao = template.getMapper(MemberDao.class);
			
			if(dao.selectById(id)>0) {
				result = "N";
			}
		}

		return result;
	}
	
	public String nicknameCheck(String nickName) {
		String result = "Y";
		
		Pattern p = Pattern.compile("^[가-힣|a-z|A-Z|0-9|]{2,8}$");
		Matcher m = p.matcher(nickName);
		
		if(!m.matches()) {
			result = "R";
		} else {
			dao = template.getMapper(MemberDao.class);
			
			if(dao.selectByNickName(nickName)>0) {
				result = "N";
			};
		}
		return result;
	}
}
