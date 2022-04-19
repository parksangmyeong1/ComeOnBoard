package com.bitcamp.cob.member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.LoginInfo;
import com.bitcamp.cob.member.domain.Member;
import com.mysql.cj.Session;

@Service
public class LoginService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberDao dao;
	
	public boolean login(
			String id, 
			String pw, 
			String reid, 
			HttpSession session,
			HttpServletResponse response
			) {
		boolean loginChk = false;
		
		LoginInfo loginInfo = template.getMapper(MemberDao.class).selectByIdPw(id, pw);
		System.out.println(loginInfo);
		if(loginInfo != null) {
			session.setAttribute("loginInfo", loginInfo);
			loginChk = true;
		}
		// 아이디 저장을 위한 Cookie 설정
		if(reid != null && reid.length() > 1) {
			Cookie cookie = new Cookie("reid", id);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*365);
			
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("reid", id);
			cookie.setPath("/");
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}

		return loginChk;
	}
	
}
