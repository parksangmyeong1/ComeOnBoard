package com.bitcamp.cob.post.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class CountService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int countPost(String postSort) {
		return template.getMapper(PostDao.class).countPost(postSort);
	}
	
	public int countPost1(int memIdx) {
		return template.getMapper(PostDao.class).countPost1(memIdx);
	}
	
	public int countPagingPost(Map<String, Object> map) {
		return template.getMapper(PostDao.class).countPagingPost(map);
	}

	public int countcomment(int postIdx) {
		return template.getMapper(PostDao.class).countComment(postIdx);
	}
	
}
