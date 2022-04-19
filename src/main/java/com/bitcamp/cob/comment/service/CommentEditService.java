package com.bitcamp.cob.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class CommentEditService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int editComment(int commIdx, String commContent) {
		return template.getMapper(PostDao.class).editComment(commIdx, commContent);
	}
}
