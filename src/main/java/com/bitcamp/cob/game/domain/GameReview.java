package com.bitcamp.cob.game.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class GameReview {

	private int revIdx;
	private int gameIdx;
	private int memIdx;
	private String revContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm",timezone="Asia/Seoul")
	private Timestamp revRegDate;
	private int revRating;
	private String nickname;
	
	
	
	public GameReview() {}

	

	public int getRevIdx() {
		return revIdx;
	}



	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}



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



	public String getRevContent() {
		return revContent;
	}



	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}



	public Timestamp getRevRegDate() {
		//return new Timestamp(revRegDate.getTime()-(1000*60*60*9));
		return revRegDate;
	}



	public void setRevRegDate(Timestamp revRegDate) {
		this.revRegDate = revRegDate;
	}



	public int getRevRating() {
		return revRating;
	}



	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	@Override
	public String toString() {
		return "GameReview [revIdx=" + revIdx + ", gameIdx=" + gameIdx + ", memIdx=" + memIdx + ", revContent="
				+ revContent + ", revRegDate=" + revRegDate + ", revRating=" + revRating + ", nickname=" + nickname
				+ "]";
	}



	
	
	
	
}
