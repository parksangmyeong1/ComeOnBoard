package com.bitcamp.cob.group.domain;

import java.sql.Timestamp;

public class RegGroup {

	private int grpRegIdx;
	private int memIdx;
	private int grpIdx;
	private Timestamp grpRegDate;
	private int grpConfirm;
	
	
	public RegGroup () {}


	public RegGroup(int grpRegIdx, int memIdx, int grpIdx, Timestamp grpRegDate, int grpConfirm) {
		super();
		this.grpRegIdx = grpRegIdx;
		this.memIdx = memIdx;
		this.grpIdx = grpIdx;
		this.grpRegDate = grpRegDate;
		this.grpConfirm = grpConfirm;
	}


	public int getGrpRegIdx() {
		return grpRegIdx;
	}


	public void setGrpRegIdx(int grpRegIdx) {
		this.grpRegIdx = grpRegIdx;
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


	public Timestamp getGrpRegDate() {
		return grpRegDate;
	}


	public void setGrpRegDate(Timestamp grpRegDate) {
		this.grpRegDate = grpRegDate;
	}


	public int getGrpConfirm() {
		return grpConfirm;
	}


	public void setGrpConfirm(int grpConfirm) {
		this.grpConfirm = grpConfirm;
	}


	@Override
	public String toString() {
		return "RegGroup [grpRegIdx=" + grpRegIdx + ", memIdx=" + memIdx + ", grpIdx=" + grpIdx + ", grpRegDate="
				+ grpRegDate + ", grpConfirm=" + grpConfirm + "]";
	}
	
	
	
}
