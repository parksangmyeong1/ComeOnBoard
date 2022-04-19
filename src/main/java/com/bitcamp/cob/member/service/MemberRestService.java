package com.bitcamp.cob.member.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.LoginInfo;

@Service
public class MemberRestService {

	@Autowired
	private SqlSessionTemplate template;
	

	// 멤버 권한 변경하기
	public int updateMemberAuth(int memIdx, String memAuth, HttpSession session) {
		MemberDao dao = template.getMapper(MemberDao.class);
		int result = dao.updateMemberAuth(memIdx, memAuth);
		if(result>0) {
			LoginInfo loginInfo =  dao.selectByIdx(memIdx);
			session.setAttribute("loginInfo", loginInfo);
		}
		return result;
	}
}
