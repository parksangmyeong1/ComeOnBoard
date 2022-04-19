package com.bitcamp.cob.group.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;

@Service
public class EditorAttendService {
	
	@Autowired // autowired 어노테이션을 안 해주면 nullPointException 오류가 생긴다 
	private SqlSessionTemplate template;

	public int updateAttendants(int memIdx, int grpIdx) {
		
		return template.getMapper(GroupDao.class).judgeRequest(memIdx, grpIdx);
		
	}
	
	
	
}
