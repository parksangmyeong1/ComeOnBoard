package com.bitcamp.cob.recomment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class RecommentDeleteService {

	@Autowired
	SqlSessionTemplate template;

	public int deleteRecomment(int recommIdx) {
		return template.getMapper(PostDao.class).deleteRecomment(recommIdx);
	}
}
