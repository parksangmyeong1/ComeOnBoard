package com.bitcamp.cob.cafe.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.domain.CafeSearchType;

@Service
public class cafeListService {

	@Autowired
	private SqlSessionTemplate template;
	
	// 정렬방법 선택시
	public List<Cafe> cafeListBySort(CafePaging cafePaging) {
		System.out.println("서비스 정렬 설정시 실행");
		return template.getMapper(CafeDao.class).cafeListBySort(getPage(cafePaging));
	}
	
	// 검색어 입력시
	public List<Cafe> cafeListByKeyword(CafePaging cafePaging) {
		System.out.println("서비스 키워드 설정시 실행");
		return template.getMapper(CafeDao.class).cafeListByKeyword(getPage(cafePaging));
	}

	// 전체 갯수 반환
	public int getCafeTotalCnt() {
		return template.getMapper(CafeDao.class).getCafeTotalCnt();
	}
	
	// 페이징 처리
	public CafePaging getPage(CafePaging cafePaging) {
		
		if(cafePaging.getPage() == 1) {
			cafePaging.setStartNum(0);
			cafePaging.setEndNum(9);
		} else {
			cafePaging.setStartNum(cafePaging.getPage()+(8*(cafePaging.getPage()-1)));
			cafePaging.setEndNum(9);
		}
		//System.out.println("페이지번호 : "+cafePaging.getPage());
		//System.out.println("시작번호 : "+cafePaging.getStartNum());
		//System.out.println("마지막번호 : "+cafePaging.getEndNum());
		
		return cafePaging;
	}
}