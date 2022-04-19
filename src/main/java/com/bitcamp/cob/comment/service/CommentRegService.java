package com.bitcamp.cob.comment.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.comment.domain.Comment;
import com.bitcamp.cob.comment.domain.CommentRegRequest;
import com.bitcamp.cob.post.dao.PostDao;

@Service
public class CommentRegService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private PostDao dao;
	
	public int regComment(CommentRegRequest regRequest,
			HttpServletRequest request) {
		
		int resultCnt = 0;
		
		Comment comment = regRequest.toComment();
		System.out.println("서비스 : "+comment);
		
		dao = template.getMapper(PostDao.class);
		resultCnt = dao.insertComment(comment);
		
		return resultCnt;
	}
}
