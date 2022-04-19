package com.bitcamp.cob.group.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.domain.PageListView;
import com.bitcamp.cob.group.domain.SearchType;

@Service
public class ShowGroupListService {

	@Autowired
	private SqlSessionTemplate template;

	private final int groupCountPerPage = 10;

	// 리스트 출력
	// 요청 페이지에 표현할 메시지 리스트 구하기
	/*
	 * public ArrayList<Group> selectGroupList() {
	 * 
	 * ArrayList<Group> result = template.getMapper(GroupDao.class).selectList();
	 * 
	 * return result;
	 * 
	 * }
	 */

	public PageListView getGroupList(int pageNumber, SearchType searchType) {

		PageListView listView = null;

		// 전체 게시물의 갯수
		int groupTotalCount = template.getMapper(GroupDao.class).selectAllCount(searchType);
//		System.out.println(groupTotalCount);
		
		// 페이지에 표현할 그룹 객체들 ArrayList<Group>
		ArrayList<Group> groupList = null;
		
		// 시작행의 위치값 limit index
		int firstRow = (pageNumber-1)*groupCountPerPage;
		
		searchType.setFirstRow(firstRow);
		searchType.setCount(groupCountPerPage);
		
		groupList = template.getMapper(GroupDao.class).selectListBySearch(searchType);
		
		
				
//		listView = new PageListView(groupList, groupTotalCount, pageNumber, groupCountPerPage, firstRow);
		listView = new PageListView(groupList, groupTotalCount, pageNumber, searchType.getCount(), groupCountPerPage, firstRow);
		
		return listView;

	}

}
