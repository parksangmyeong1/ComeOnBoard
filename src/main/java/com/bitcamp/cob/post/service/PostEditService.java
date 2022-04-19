package com.bitcamp.cob.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.post.domain.Post;

@Service
public class PostEditService {
	
	@Autowired
	private SqlSessionTemplate template;

	public Post selectByIdx(int postIdx) {
		return template.getMapper(PostDao.class).selectByIdx(postIdx);
	}
	public int editPost(Post post) {
		return template.getMapper(PostDao.class).editPost(post);
	}
	
}
