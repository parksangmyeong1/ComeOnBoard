package com.bitcamp.cob.post.domain;

public class Request {
	
	private String searchType;
	private String keyword;
	private String nowPage;
	private String cntPerPage;
	
	public Request() {}
	
	public Request(String searchType, String keyword, String nowPage, String cntPerPage) {
		this.searchType = searchType;
		this.keyword = keyword;
		this.nowPage = nowPage;
		this.cntPerPage = cntPerPage;
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
	public String getNowPage() {
		return nowPage;
	}
	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}
	public String getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(String cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	@Override
	public String toString() {
		return "request [searchType=" + searchType + ", keyword=" + keyword + ", nowPage="
				+ nowPage + ", cntPerPage=" + cntPerPage + "]";
	}
	
}
