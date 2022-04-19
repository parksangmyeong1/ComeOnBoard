package com.bitcamp.cob.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.post.domain.CheckRequest;

@Service
public class SelectService {

	@Autowired
	SqlSessionTemplate template;

	public int selectLikeCheck(CheckRequest checkRequest) {
		return template.getMapper(PostDao.class).selectLikeCheck(checkRequest);
	}
}
