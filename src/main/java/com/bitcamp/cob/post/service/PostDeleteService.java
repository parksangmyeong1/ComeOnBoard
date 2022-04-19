package com.bitcamp.cob.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class PostDeleteService {

	@Autowired
	private SqlSessionTemplate template;

	public int deletePost(int postIdx){
		int resultCnt=0;
		resultCnt = template.getMapper(PostDao.class).deletePost(postIdx);
		return resultCnt;
	}
}
