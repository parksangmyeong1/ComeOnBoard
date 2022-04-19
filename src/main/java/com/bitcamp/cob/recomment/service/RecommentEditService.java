package com.bitcamp.cob.recomment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class RecommentEditService {

	@Autowired
	SqlSessionTemplate template;

	public int editRecomment(int recommIdx, String recommContent) {
		return template.getMapper(PostDao.class).editRecomment(recommIdx, recommContent);
	}
}
