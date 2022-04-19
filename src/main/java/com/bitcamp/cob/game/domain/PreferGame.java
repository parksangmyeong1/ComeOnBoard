package com.bitcamp.cob.game.domain;

public class PreferGame {

	private int gameIdx;
	private int memIdx;
	
	public PreferGame(int gameIdx, int memIdx) {
		this.gameIdx = gameIdx;
		this.memIdx = memIdx;
	}
	
	public PreferGame() {}

	public int getGameIdx() {
		return gameIdx;
	}

	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	@Override
	public String toString() {
		return "PreferGame [gameIdx=" + gameIdx + ", memIdx=" + memIdx + "]";
	}
	
	
	
}
