package com.bitcamp.cob.group.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;

@Service
public class CreateGroupBoardService {


	@Autowired
	private SqlSessionTemplate template;
	
	public int groupBoardReg(Group group) {
//	public Group groupBoardReg(Group group) {
		
//		System.out.println("CreateGroupController -> service: "+group);
		// dao(DB) 저장
		
		
//		System.out.println("CreateGroupControllerService에서 grpIdx확인"+group.getGrpIdx());
		
		return template.getMapper(GroupDao.class).insertGroupBoardContent(group);
//		return group.getGrpIdx();

		
	}

	
	
}
