package com.bitcamp.cob.post.domain;

public class CheckRequest {

	private String type;
	private String tableType;
	private int idx;
	private int memIdx;
	
	public CheckRequest() {}
	
	public CheckRequest(String type, String tableType, int idx, int memIdx) {
		this.type = type;
		this.tableType = tableType;
		this.idx = idx;
		this.memIdx = memIdx;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTableType() {
		return tableType;
	}
	public void setTableType(String tableType) {
		this.tableType = tableType;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	@Override
	public String toString() {
		return "CheckRequest [type=" + type + ", tableType=" + tableType + ", idx=" + idx + ", memIdx=" + memIdx + "]";
	}
	
}
