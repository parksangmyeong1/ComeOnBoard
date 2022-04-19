package com.bitcamp.cob.post.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.post.domain.CheckRequest;
import com.bitcamp.cob.post.domain.Post;
import com.bitcamp.cob.post.domain.PostRegRequest;

@Service
public class PostRegService {

	@Autowired
	private SqlSessionTemplate template;
	
	public int regPost(PostRegRequest regRequest,
			HttpServletRequest request) {
		
		int resultCnt = 0;

		Post post = regRequest.toPost();
		System.out.println(post);
		
		resultCnt = template.getMapper(PostDao.class).insertPost(post);
		return resultCnt;
	}

	public int regCheck(CheckRequest checkRequest, 
			HttpServletRequest request) {

		int resultCnt = 0;
		resultCnt = template.getMapper(PostDao.class).insertCheck(checkRequest);
		return resultCnt;
	}
}
