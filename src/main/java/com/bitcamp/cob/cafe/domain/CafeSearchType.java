package com.bitcamp.cob.cafe.domain;

public class CafeSearchType {

	private String searchType;
	private String keyword;
	
	public CafeSearchType() {
	}

	public CafeSearchType(String searchType, String keyword) {
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "CafeSearchType [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
