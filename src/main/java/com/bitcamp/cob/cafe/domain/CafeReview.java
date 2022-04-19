package com.bitcamp.cob.cafe.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CafeReview {

	private int revIdx;
	private int cafeIdx;
	private int memIdx;
	private String memPhoto;
	private String nickName;
	private String revContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp revRegTimestamp;
	private int revRating;
	
	public CafeReview() {}

	public int getRevIdx() {
		return revIdx;
	}

	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}

	public int getCafeIdx() {
		return cafeIdx;
	}

	public void setCafeIdx(int cafeIdx) {
		this.cafeIdx = cafeIdx;
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

	public Timestamp getRevRegTimestamp() {
		return revRegTimestamp;
	}

	public void setRevRegTimestamp(Timestamp revRegTimestamp) {
		this.revRegTimestamp = revRegTimestamp;
	}

	public int getRevRating() {
		return revRating;
	}

	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	public String getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}

	@Override
	public String toString() {
		return "CafeReview [revIdx=" + revIdx + ", cafeIdx=" + cafeIdx + ", memIdx=" + memIdx + ", memPhoto=" + memPhoto
				+ ", nickName=" + nickName + ", revContent=" + revContent + ", revRegTimestamp=" + revRegTimestamp
				+ ", revRating=" + revRating + "]";
	}

	

}
