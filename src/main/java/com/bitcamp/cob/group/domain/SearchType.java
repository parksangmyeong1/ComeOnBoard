package com.bitcamp.cob.group.domain;

public class SearchType {

	private int p;	//페이지 번호
	private int firstRow;	// mapper limit 첫 번째 값
	private int count;	// limit 마지막 값
	private String searchCategory;
	private String keyword;
	
	
	
	public SearchType () {}
	
	
	public SearchType(int p, int firstRow, int count, String searchCategory, String keyword) {
		super();
		this.p = p;
		this.firstRow = firstRow;
		this.count = count;
		this.searchCategory = searchCategory;
		this.keyword = keyword;
	}



	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	@Override
	public String toString() {
		return "SearchType [p=" + p + ", firstRow=" + firstRow + ", count=" + count + ", searchCategory="
				+ searchCategory + ", keyword=" + keyword + "]";
	}
	
	
	
	
	
}
