package com.bitcamp.cob.group.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;

@Service
public class ReadGroupBoardService {

	@Autowired
	private SqlSessionTemplate template;
	
	public Group groupBoard(int grpIdx) { //매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		
//		template.getMapper(GroupDao.class).selectGroupBoardContent(group); //매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		
//		System.out.println("ReadGroupControllerService에서 :"+grpIdx);
		
		return template.getMapper(GroupDao.class).selectGroupBoardContent(grpIdx);
		
		
	}

}
