package com.bitcamp.cob.recomment.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.comment.domain.Comment;
import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.recomment.domain.Recomment;
import com.bitcamp.cob.recomment.domain.RecommentRegRequest;

@Service
public class RecommentRegService {

	@Autowired
	SqlSessionTemplate template;

	public int regComment(RecommentRegRequest recommRegRequest, 
			HttpServletRequest request) {
		
		int resultCnt = 0;
		
		Recomment recomment = recommRegRequest.toRecomment();
		System.out.println(recomment);
		
		resultCnt = template.getMapper(PostDao.class).insertRecomment(recomment);
		return resultCnt;
	}
}
