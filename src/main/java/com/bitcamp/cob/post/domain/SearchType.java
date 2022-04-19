package com.bitcamp.cob.post.domain;

public class SearchType {
	
	private String searchType;
	private String keyword;
	
	public SearchType() {
	}
	
	public SearchType(String searchType, String keyword) {
		this.searchType=searchType;
		this.keyword=keyword;
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
		return "SearchType [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
