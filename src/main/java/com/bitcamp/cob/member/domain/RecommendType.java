package com.bitcamp.cob.member.domain;

public class RecommendType {
	private int memIdx;
	private String preferAddr;
	private String preferGame;

	
	
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	public String getPreferAddr() {
		return preferAddr;
	}
	public void setPreferAddr(String preferAddr) {
		this.preferAddr = preferAddr;
	}
	public String getPreferGame() {
		return preferGame;
	}
	public void setPreferGame(String preferGame) {
		this.preferGame = preferGame;
	}
	@Override
	public String toString() {
		return "RecommendType [memIdx=" + memIdx + ", preferAddr=" + preferAddr + ", preferGame=" + preferGame + "]";
	}
	
	
	
	
}
