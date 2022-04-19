package com.bitcamp.cob.member.domain;

public class GameInfo {
	
	private int gameIdx;
	private String gameName;
	
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	
	@Override
	public String toString() {
		return "GameInfo [gameIdx=" + gameIdx + ", gameName=" + gameName + "]";
	}
	
	
	
}
