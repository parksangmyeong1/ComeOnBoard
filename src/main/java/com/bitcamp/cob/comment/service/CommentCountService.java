package com.bitcamp.cob.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class CommentCountService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int countComment(int postIdx) {
		return template.getMapper(PostDao.class).countComment(postIdx);
	}

}
