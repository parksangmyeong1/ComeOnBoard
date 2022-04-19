package com.bitcamp.cob.cafe.domain;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public class CafePaging {

	private String searchType;
	private String sortType;
	private String keyword;
	private int page;
	private int totalCnt;
	private int startNum;
	private int endNum;
	private List<Cafe> cafe;
	
	public CafePaging() {}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
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

	public List<Cafe> getCafe() {
		return cafe;
	}

	public void setCafe(List<Cafe> cafe) {
		this.cafe = cafe;
	}

	@Override
	public String toString() {
		return "CafePaging [searchType=" + searchType + ", sortType=" + sortType + ", keyword=" + keyword + ", page="
				+ page + ", totalCnt=" + totalCnt + ", startNum=" + startNum + ", endNum=" + endNum + ", cafe=" + cafe
				+ "]";
	}

}
