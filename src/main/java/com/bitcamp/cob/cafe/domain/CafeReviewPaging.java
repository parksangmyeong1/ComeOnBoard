package com.bitcamp.cob.cafe.domain;

import java.util.List;

public class CafeReviewPaging {

	private int currentPage; // 현재 페이지
	private int totalPage; // 페이지 총 갯수
	private int totalReviewCnt; // 리뷰 총 갯수
	private int startNum; // 시작 인덱스
	private int endNum; // 마지막 숫자
	private int cafeIdx; // 카페 번호
	private List<CafeReview> cafeReview; // 리뷰
	
	public CafeReviewPaging() {}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalReviewCnt() {
		return totalReviewCnt;
	}

	public void setTotalReviewCnt(int totalReviewCnt) {
		this.totalReviewCnt = totalReviewCnt;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getCafeIdx() {
		return cafeIdx;
	}

	public void setCafeIdx(int cafeIdx) {
		this.cafeIdx = cafeIdx;
	}

	public List<CafeReview> getCafeReview() {
		return cafeReview;
	}

	public void setCafeReview(List<CafeReview> cafeReview) {
		this.cafeReview = cafeReview;
	}

	@Override
	public String toString() {
		return "CafeReviewPaging [currentPage=" + currentPage + ", totalPage=" + totalPage + ", totalReviewCnt="
				+ totalReviewCnt + ", startNum=" + startNum + ", endNum=" + endNum + ", cafeIdx=" + cafeIdx
				+ ", cafeReview=" + cafeReview + "]";
	}

	


}
