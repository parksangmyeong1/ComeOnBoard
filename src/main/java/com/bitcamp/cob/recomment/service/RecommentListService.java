package com.bitcamp.cob.recomment.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.recomment.domain.Recomment;

@Service
public class RecommentListService {

	@Autowired
	SqlSessionTemplate template;

	public List<Recomment> getRecommentList(int postIdx) {
		return template.getMapper(PostDao.class).selectRecommList(postIdx);
	}
}
