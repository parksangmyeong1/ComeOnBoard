package com.bitcamp.cob.group.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;

@Service
public class EditorDeleteService {

	@Autowired
	private SqlSessionTemplate template;
	
	// 참여 대기자 거절
	public int deleteAttendant(int memIdx, int grpIdx) {
		
		return template.getMapper(GroupDao.class).refuseApplyForParticipation(memIdx, grpIdx);
		
	}
	
	// 이미 참여한 사람 추방
	public int deleteAttenddant2(int memIdx, int grpIdx) {
		
		return template.getMapper(GroupDao.class).exileAttendant(memIdx, grpIdx);
		
	}
	
	
}
