package com.bitcamp.cob.cafe.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.domain.CafeReview;
import com.bitcamp.cob.cafe.domain.CafeReviewPaging;

@Service
public class CafeReviewService {

	@Autowired
	private SqlSessionTemplate template;

	// 카페리뷰 출력
	public List<CafeReview> getCafeReview(CafeReviewPaging cafeReviewPaging) {
		return template.getMapper(CafeDao.class).getCafeReview(cafeReviewPaging);
	}
	
	// 선택한 카페의 총 리뷰 갯수
	public int getTotalCafeReviewCnt(int cafeIdx) {
		return template.getMapper(CafeDao.class).getTotalCafeReviewCnt(cafeIdx);
	}
	
	// 카페 리뷰 작성
	public int writeCafeReview(CafeReview cafeReview) {
		return template.getMapper(CafeDao.class).writeCafeReview(cafeReview);
	}

	// 카페 리뷰 수정
	public int updateCafeReview(CafeReview cafeReview) {
		return template.getMapper(CafeDao.class).updateCafeReview(cafeReview);
	}
	
	// 카페 리뷰 삭제
	public int deleteCafeRevie(int revIdx) {
		return template.getMapper(CafeDao.class).deleteCafeReview(revIdx);
	}

}