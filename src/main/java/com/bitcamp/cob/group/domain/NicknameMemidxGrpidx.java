package com.bitcamp.cob.group.domain;

import java.util.ArrayList;

public class NicknameMemidxGrpidx {

	private String nickName;
	private int memIdx;
	private int grpIdx;
	
	public NicknameMemidxGrpidx() {}

	public NicknameMemidxGrpidx(String nickName, int memIdx, int grpIdx) {
		super();
		this.nickName = nickName;
		this.memIdx = memIdx;
		this.grpIdx = grpIdx;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	@Override
	public String toString() {
		return "NicknameMemidxGrpidx [nickName=" + nickName + ", memIdx=" + memIdx + ", grpIdx=" + grpIdx + "]";
	}

	

	
	
	
	
}
