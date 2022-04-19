package com.bitcamp.cob.game.domain;

public class Game {
	
	private int gameIdx;
	private String gameName;
	private String gameSort;
	private String gamePerson;
	private String gameTime;
	private String gameLmtAge;
	private String gamePublisher;
	private String gamePubDate;
	private String gamePhoto;
	private String gameIntro;
	private String gameRule;
	private String gameVideo;
	
	public Game(int gameIdx, String gameName, String gameSort, String gamePerson, String gameTime, String gameLmtAge,
			String gamePublisher, String gamePubDate, String gamePhoto, String gameIntro, String gameRule,
			String gameVideo) {
		this.gameIdx = gameIdx;
		this.gameName = gameName;
		this.gameSort = gameSort;
		this.gamePerson = gamePerson;
		this.gameTime = gameTime;
		this.gameLmtAge = gameLmtAge;
		this.gamePublisher = gamePublisher;
		this.gamePubDate = gamePubDate;
		this.gamePhoto = gamePhoto;
		this.gameIntro = gameIntro;
		this.gameRule = gameRule;
		this.gameVideo = gameVideo;
	}
	
	public Game() {}

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

	public String getGamePublisher() {
		return gamePublisher;
	}

	public void setGamePublisher(String gamePublisher) {
		this.gamePublisher = gamePublisher;
	}

	public String getGamePubDate() {
		return gamePubDate;
	}

	public void setGamePubDate(String gamePubDate) {
		this.gamePubDate = gamePubDate;
	}

	public String getGamePhoto() {
		return gamePhoto;
	}

	public void setGamePhoto(String gamePhoto) {
		this.gamePhoto = gamePhoto;
	}

	public String getGameIntro() {
		return gameIntro;
	}

	public void setGameIntro(String gameIntro) {
		this.gameIntro = gameIntro;
	}

	public String getGameRule() {
		return gameRule;
	}

	public void setGameRule(String gameRule) {
		this.gameRule = gameRule;
	}

	public String getGameVideo() {
		return gameVideo;
	}

	public void setGameVideo(String gameVideo) {
		this.gameVideo = gameVideo;
	}

	@Override
	public String toString() {
		return "Game [gameIdx=" + gameIdx + ", gameName=" + gameName + ", gameSort=" + gameSort + ", gamePerson="
				+ gamePerson + ", gameTime=" + gameTime + ", gameLmtAge=" + gameLmtAge + ", gamePublisher="
				+ gamePublisher + ", gamePubDate=" + gamePubDate + ", gamePhoto=" + gamePhoto + ", gameIntro="
				+ gameIntro + ", gameRule=" + gameRule + ", gameVideo=" + gameVideo + "]";
	}

	
	
}
