package com.bitcamp.cob.post.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.post.domain.Post;

@Service
public class PostDetailService {

	@Autowired
	private SqlSessionTemplate template;
	
	public List<Post> selectpostDetail(int postIdx) {
		return template.getMapper(PostDao.class).selectPostDetail(postIdx);
	}
}
