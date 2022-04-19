package com.bitcamp.cob.game.domain;

public class SortType {
	
	private String sortType;
	private String sortKeyword;
	
	public SortType() {}

	public SortType(String sortType, String sortKeyword) {
		this.sortType = sortType;
		this.sortKeyword = sortKeyword;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getSortKeyword() {
		return sortKeyword;
	}

	public void setSortKeyword(String sortKeyword) {
		this.sortKeyword = sortKeyword;
	}

	@Override
	public String toString() {
		return "SortType [sortType=" + sortType + ", sortKeyword=" + sortKeyword + "]";
	};
	
	
	
}
