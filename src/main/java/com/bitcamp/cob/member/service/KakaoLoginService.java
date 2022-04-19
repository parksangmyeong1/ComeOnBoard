package com.bitcamp.cob.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.LoginInfo;

@Service
public class KakaoLoginService {

	@Autowired
	private SqlSessionTemplate template;
	
	// 카카오 회원번호로 로그인 된 아이디가 있는지 확인
	public LoginInfo chkMember(String memId) {
		MemberDao dao = template.getMapper(MemberDao.class);
		LoginInfo loginInfo = dao.selectByKakaoId(memId);

		return loginInfo;
	}
	
}
