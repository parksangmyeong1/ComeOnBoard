package com.bitcamp.cob.cafe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafeImgInfo;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.domain.CafeReservation;
import com.bitcamp.cob.cafe.domain.CafeReview;
import com.bitcamp.cob.cafe.domain.CafeReviewPaging;
import com.bitcamp.cob.cafe.domain.CafeSearchType;

public interface CafeDao {

	// 카페 리스트 출력 - 정렬 방식 선택시
	List<Cafe> cafeListBySort(CafePaging cafePaging);
	// 카페 리스트 출력 - 검색어 입력시
	List<Cafe> cafeListByKeyword(CafePaging cafePaging);
	// 전체 카페의 수
	int getCafeTotalCnt();
	// 카페 페이지
	Cafe getCafeInfo(int idx);
	// 리뷰 리스트 출력
	List<CafeReview> getCafeReview(CafeReviewPaging cafeReviewPaging);
	// 선택한 카페의 리뷰 갯수
	int getTotalCafeReviewCnt(int cafeIdx);
	// 카페 리뷰 작성
	int writeCafeReview(CafeReview cafeReview);
	// 카페 정보 등
	int regCafe(Cafe cafe);
	// 카페 리뷰 수정
	int updateCafeReview(CafeReview cafeReview);
	// 카페 리뷰 삭제
	int deleteCafeReview(int revIdx);
	// 카페 썸네일 저장
	int regCafeThumbnail(@Param("cafeThumbnail") String cafeThumbnail, @Param("cafeIdx") int cafeIdx);
	// 카페 이미지 저장
	int regCafeImg(@Param("cafeImg") String cafeImgs, @Param("cafeIdx") int cafeIdx, @Param("memIdx") int memIdx);
	// 카페 인덱스 반환
	CafeImgInfo getCafeIdxName(int memIdx);
	// 카페 이미지 리스트 반환
	List<CafeImgInfo> getImgList(CafeImgInfo cafeImgInfo);
	// 카페 이미지 삭제
	int delImg(int cafeImgIdx);
	// 카페 정보 수정
	int updateCafeInfo(Cafe cafe);
	// 카페 이미지 반
	List<String> getCafeImg(int idx);
	// 카페 등록 여부
	int checkCafe(int attribute);
	// 카페 예약 리스트 반환
	List<CafeReservation> getReservButton(CafeReservation cafeReservation);
	// 카페 가결제 예약
	int regReserv(CafeReservation cafeReservation);
	// 카페 가결제 승인
	int confirmReserv(@Param("reservIdx") int idx, @Param("tid") String tid);
	// 카페 예약 확인 리스트
	List<CafeReservation> getReservList(CafeReservation cafeReservation);
	// 예약 취소
	int delReserv(int reservIdx);
	// 내 예약정보
	List<CafeReservation> getMyReservList(int memIdx);
	
	


}
