package com.bitcamp.cob.game.domain;

import java.util.List;

public class GameListView {

	private List<GameMain> gameList;
	private int gameTotalCount;  	// 전체 게임 갯수
	private int currentPageNumber; 	// 현재 페이지 번호
	private int pageTotalCount;		// 페이지 개수 = lastpage
	private int gameCountPerPage;	//페이지당 게시물 개수
	private int firstRow;			// DB 게시물의 시작 위치
	private int endRow;				// 마지막위치
	private int startPage;			// 페이지 시작번호 
	private int endPage;			// 페이지 마지막번호 
	private int cntPage =5;		// 하단에 보여지는 페이지 번호갯수
	private int orderType;
	private int sortType;

	
	public GameListView(List<GameMain> gameList, int gameTotalCount, int currentPageNumber, int gameCountPerPage,
			int firstRow, int endRow, int startPage,int endPage, int orderType, int sortType ) {
		
		this.gameList = gameList;
		this.gameTotalCount = gameTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.gameCountPerPage = gameCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.startPage = startPage;
		this.endPage = endPage;
		this.orderType = orderType;
		this.sortType = sortType;
		calPageTotalCount();
		calcStartEndPage(currentPageNumber, cntPage);
	}

	// 전체페이지수 계산
	private void calPageTotalCount() {
		
		if(this.gameTotalCount == 0) {
			this.pageTotalCount = 0;
		} else {
			this.pageTotalCount = this.gameTotalCount / this.gameCountPerPage;
			if(this.gameTotalCount % this.gameCountPerPage > 0) {
				this.pageTotalCount++;
			}			
		}		
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int currentPageNumber, int cntPage) {
		setEndPage(((int)Math.ceil((double)currentPageNumber / (double)cntPage)) * cntPage);
		if (getPageTotalCount() < getEndPage()) {
			setEndPage(getPageTotalCount());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	public List<GameMain> getGameList() {
		return gameList;
	}

	public int getGameTotalCount() {
		return gameTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getGameCountPerPage() {
		return gameCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
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
		return "GameListView [gameList=" + gameList + ", gameTotalCount=" + gameTotalCount + ", currentPageNumber="
				+ currentPageNumber + ", pageTotalCount=" + pageTotalCount + ", gameCountPerPage=" + gameCountPerPage
				+ ", firstRow=" + firstRow + ", endRow=" + endRow + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", cntPage=" + cntPage + ", orderType=" + orderType + ", sortType=" + sortType + "]";
	}

	
	
	
	
	
	
}
