package com.bitcamp.cob.game.domain;

public class SearchType {
	
	private int page; // 페이징 시작 번호
	private String searchType;
	private String keyword;
	private int firstRow; // 페이지에서 표시되는 첫번째 게시물.
	private int gameCountPerPage; // 페이지에 표시될 게시물 갯수
	private int orderType;
	private int sortType;
	
	public SearchType(int page, String searchType, String keyword,int sortType) {

		this.page = page;
		this.searchType = searchType;
		this.keyword = keyword;
		this.sortType=sortType;
	}
	
	public SearchType() {
		
		this.page = 1;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getGameCountPerPage() {
		return gameCountPerPage;
	}

	public void setGameCountPerPage(int gameCountPerPage) {
		this.gameCountPerPage = gameCountPerPage;
	}

	
	
	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
	
	
	

	public int getSortType() {
		return sortType;
	}

	public void setSortType(int sortType) {
		this.sortType = sortType;
	}

	@Override
	public String toString() {
		return "SearchType [page=" + page + ", searchType=" + searchType + ", keyword=" + keyword + ", firstRow="
				+ firstRow + ", gameCountPerPage=" + gameCountPerPage + ", orderType=" + orderType + ", sortType="
				+ sortType + "]";
	}





	
	
	

	


	
	
	
}

