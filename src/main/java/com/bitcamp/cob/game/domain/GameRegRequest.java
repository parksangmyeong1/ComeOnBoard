package com.bitcamp.cob.game.domain;

import org.springframework.web.multipart.MultipartFile;

public class GameRegRequest {

	private String gameName;
	private String gameSort;
	private String gamePerson;
	private String gameTime;
	private String gameLmtAge;
	private String gamePublisher;
	private String gamePubDate;
	private MultipartFile gamePhoto;
	private String gameIntro;
	private String gameRule;
	private String gameVideo;

	
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

	public MultipartFile getGamePhoto() {
		return gamePhoto;
	}

	public void setGamePhoto(MultipartFile gamePhoto) {
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
		return "GameRegRequest [gameName=" + gameName + ", gameSort=" + gameSort + ", gamePerson=" + gamePerson
				+ ", gameTime=" + gameTime + ", gameLmtAge=" + gameLmtAge + ", gamePublisher=" + gamePublisher
				+ ", gamePubDate=" + gamePubDate + ", gamePhoto=" + gamePhoto + ", gameIntro=" + gameIntro
				+ ", gameRule=" + gameRule + ", gameVideo=" + gameVideo + "]";
	}

	public Game toGame() {

		return new Game
				(0, 
				gameName, 
				gameSort, 
				gamePerson, 
				gameTime, 
				gameLmtAge, 
				gamePublisher, 
				gamePubDate, 
				null, 
				gameIntro, 
				gameRule, 
				gameVideo);

	}

}
