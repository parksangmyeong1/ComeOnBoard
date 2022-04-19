package com.bitcamp.cob.group.domain;

import java.util.List;

public class PageListView {

	private List<Group> groupList; 		// 게시물 리스트 객체 10개  DB에서 가져오는 값
	private int groupTotalCount; 		// 전체 게시물의 개수	 DB에서 가져오는 값
	private int currentPagenumber; 		// 현재 페이지 번호
	private int pageTotalCount; 		// 페이지의 개수
	private int groupCountPerPage; 		// 한 페이지에 표현할 게시글의 개수
	private int firstRow; 				// DB 게시물의 시작 위치
	
	
	public PageListView() {}


	

	public PageListView(List<Group> groupList, int groupTotalCount, int currentPagenumber, int pageTotalCount,
			int groupCountPerPage, int firstRow) {
		super();
		this.groupList = groupList;
		this.groupTotalCount = groupTotalCount;
		this.currentPagenumber = currentPagenumber;
		this.pageTotalCount = pageTotalCount;
		this.groupCountPerPage = groupCountPerPage;
		this.firstRow = firstRow;
		
		calpageTotalCount();
	}




	private void calpageTotalCount() {
		
		if(this.groupTotalCount == 0) {
			this.pageTotalCount = 0;
		} else {
			// 10 / 3 -> 3    10%3 >0 -> 3+1
			this.pageTotalCount = this.groupTotalCount / this.groupCountPerPage;
			if(this.groupTotalCount % this.groupCountPerPage > 0) {
				this.pageTotalCount++;
			}
		}
	}




	public List<Group> getGroupList() {
		return groupList;
	}




	public void setGroupList(List<Group> groupList) {
		this.groupList = groupList;
	}




	public int getGroupTotalCount() {
		return groupTotalCount;
	}




	public void setGroupTotalCount(int groupTotalCount) {
		this.groupTotalCount = groupTotalCount;
	}




	public int getCurrentPagenumber() {
		return currentPagenumber;
	}




	public void setCurrentPagenumber(int currentPagenumber) {
		this.currentPagenumber = currentPagenumber;
	}




	public int getPageTotalCount() {
		return pageTotalCount;
	}




	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}




	public int getGroupCountPerPage() {
		return groupCountPerPage;
	}




	public void setGroupCountPerPage(int groupCountPerPage) {
		this.groupCountPerPage = groupCountPerPage;
	}




	public int getFirstRow() {
		return firstRow;
	}




	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}




	@Override
	public String toString() {
		return "PageListView [groupList=" + groupList + ", groupTotalCount=" + groupTotalCount + ", currentPagenumber="
				+ currentPagenumber + ", pageTotalCount=" + pageTotalCount + ", groupCountPerPage=" + groupCountPerPage
				+ ", firstRow=" + firstRow + "]";
	}


	




	

	
	

	

	
	
	

}









