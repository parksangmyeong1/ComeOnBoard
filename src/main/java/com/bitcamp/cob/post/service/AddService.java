package com.bitcamp.cob.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.post.domain.CheckRequest;

@Service
public class AddService {

	@Autowired
	private SqlSessionTemplate template;
	
	public void addViews(int postIdx) {
		template.getMapper(PostDao.class).addViews(postIdx);
	}

	public int addbutton(CheckRequest checkRequest) {
		return template.getMapper(PostDao.class).addbutton(checkRequest);
	}
}
