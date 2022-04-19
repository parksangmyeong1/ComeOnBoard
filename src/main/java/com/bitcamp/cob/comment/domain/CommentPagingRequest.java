package com.bitcamp.cob.comment.domain;

import java.util.List;

import com.bitcamp.cob.cafe.domain.CafeReview;

public class CommentPagingRequest {

	// 사용자의 입력을 저장하는 용도의 클래스
	// regForm의 name과 일치시켜야 알아서 저장해준다.
	// 알아서 넣어주기 때문에 생성자 필요가 없다.
	private int currentPage; // 현재 페이지
	private int totalPage; // 페이지 총 갯수
	private int totalCommCnt; // 리뷰 총 갯수
	private int commPerPage = 7;
	private int startNum; // 시작 인덱스
	private int endNum; // 마지막 숫자
	private int postIdx; // 카페 번호
	private List<Comment> comment; // 리뷰

	public CommentPagingRequest() {}

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

	public int getTotalCommCnt() {
		return totalCommCnt;
	}

	public void setTotalCommCnt(int totalCommCnt) {
		this.totalCommCnt = totalCommCnt;
	}

	public int getCommPerPage() {
		return commPerPage;
	}

	public void setCommPerPage(int commPerPage) {
		this.commPerPage = commPerPage;
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

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "request [currentPage=" + currentPage + ", totalPage=" + totalPage + ", totalCommCnt=" + totalCommCnt
				+ ", startNum=" + startNum + ", endNum=" + endNum + ", postIdx=" + postIdx + ", comment=" + comment
				+ "]";
	}
}
