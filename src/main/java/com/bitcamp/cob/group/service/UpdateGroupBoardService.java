package com.bitcamp.cob.group.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.domain.TitleAndContent;

@Service
public class UpdateGroupBoardService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public int groupBoardEdit(Group group) {
		
		template.getMapper(GroupDao.class).updateGroupBoardContent(group);
		
		return group.getGrpIdx();
		
	}

	public Group reviewContent(Group group) {
		
		template.getMapper(GroupDao.class).reSelectContent(group);
		
		return template.getMapper(GroupDao.class).reSelectContent(group);
		
	}
	
	// groupEditor에서 제목과 내용만 수정해주는 역할
	public int updateOnlyTitleAndContent(TitleAndContent tac) {
		
		return template.getMapper(GroupDao.class).updateCreatedTitleAndContent(tac);
		
	}
	

}





