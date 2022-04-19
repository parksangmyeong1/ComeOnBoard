package com.bitcamp.cob.member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;

@Service
public class MemberDeleteService {
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int delete(int memIdx, HttpSession session, HttpServletResponse response) {
		int resultCnt = 0;
		
		dao = template.getMapper(MemberDao.class);
		
		resultCnt = dao.deleteMember(memIdx);
		if(resultCnt>0) {
			session.removeAttribute("loginInfo");
			Cookie cookie = new Cookie("reid", "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		return resultCnt;
	}
}
