package com.bitcamp.cob.cafe.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.member.domain.LoginInfo;

@Service
public class CafeInfoService {

	@Autowired
	private SqlSessionTemplate template;

	// 카페 정보 출력
	public Cafe getCafeInfo(int idx) {
		Cafe cafe = template.getMapper(CafeDao.class).getCafeInfo(idx);
		cafe.setCafeImg(template.getMapper(CafeDao.class).getCafeImg(idx));
		return cafe;
	}
	
	// 카페 정보 등록
	public int regCafe(Cafe cafe) {
		return template.getMapper(CafeDao.class).regCafe(cafe);
	}

	// 카페 정보 수정
	public int updateCafeInfo(Cafe cafe) {
		return template.getMapper(CafeDao.class).updateCafeInfo(cafe);
	}

	// 카페 등록 여부
	public int checkCafe(int memIdx) {
		return template.getMapper(CafeDao.class).checkCafe(memIdx);
	}

}