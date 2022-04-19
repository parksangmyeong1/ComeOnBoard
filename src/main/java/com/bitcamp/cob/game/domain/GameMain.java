package com.bitcamp.cob.game.domain;

public class GameMain {

	private int gameIdx;
	private String gameName;
	private String gameSort;
	private String gamePerson;
	private String gameTime;
	private String gameLmtAge;
	private String gamePhoto;
	private int avg;

	public GameMain(int gameIdx, String gameName, String gameSort, String gamePerson, String gameTime,
			String gameLmtAge, String gamePhoto, int avg) {
		this.gameIdx = gameIdx;
		this.gameName = gameName;
		this.gameSort = gameSort;
		this.gamePerson = gamePerson;
		this.gameTime = gameTime;
		this.gameLmtAge = gameLmtAge;
		this.gamePhoto = gamePhoto;
		this.avg = avg;
	}

	public GameMain() {}

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

	public String getGameSort() {
		return gameSort;
	}

	public void setGameSort(String gameSort) {
		this.gameSort = gameSort;
	}

	public String getGamePerson() {
		return gamePerson;
	}

	public void setGamePerson(String gamePerson) {
		this.gamePerson = gamePerson;
	}

	public String getGameTime() {
		return gameTime;
	}

	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}

	public String getGameLmtAge() {
		return gameLmtAge;
	}

	public void setGameLmtAge(String gameLmtAge) {
		this.gameLmtAge = gameLmtAge;
	}

	public String getGamePhoto() {
		return gamePhoto;
	}

	public void setGamePhoto(String gamePhoto) {
		this.gamePhoto = gamePhoto;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	@Override
	public String toString() {
		return "GameMain [gameIdx=" + gameIdx + ", gameName=" + gameName + ", gameSort=" + gameSort + ", gamePerson="
				+ gamePerson + ", gameTime=" + gameTime + ", gameLmtAge=" + gameLmtAge + ", gamePhoto=" + gamePhoto
				+ ", avg=" + avg + "]";
	}

	
	
	
}


