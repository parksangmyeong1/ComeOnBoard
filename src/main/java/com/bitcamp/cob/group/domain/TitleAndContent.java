package com.bitcamp.cob.group.domain;

public class TitleAndContent {

	private int memIdx;
	private int grpIdx;
	private String grpTitle;
	private String grpContent;
	
	public TitleAndContent() {}
	
	public TitleAndContent(int memIdx, int grpIdx, String grpTitle, String grpContent) {
		super();
		this.memIdx = memIdx;
		this.grpIdx = grpIdx;
		this.grpTitle = grpTitle;
		this.grpContent = grpContent;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public int getGrpIdx() {
		return grpIdx;
	}

	public void setGrpIdx(int grpIdx) {
		this.grpIdx = grpIdx;
	}

	public String getGrpTitle() {
		return grpTitle;
	}

	public void setGrpTitle(String grpTitle) {
		this.grpTitle = grpTitle;
	}

	public String getGrpContent() {
		return grpContent;
	}

	public void setGrpContent(String grpContent) {
		this.grpContent = grpContent;
	}

	@Override
	public String toString() {
		return "UpdatedBoardForEditor [memIdx=" + memIdx + ", grpIdx=" + grpIdx + ", grpTitle=" + grpTitle
				+ ", grpContent=" + grpContent + "]";
	}
	
	
	
}
