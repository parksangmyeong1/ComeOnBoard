package com.bitcamp.cob.recomment.domain;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Recomment {

	private int recommIdx;
	private int postIdx;
	private int commIdx;
	private int memIdx;
	private String recommWriter;
	private String recommContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Timestamp recommRegDate;
	private int recommLike;
	private int recommDislike;
	private int recommRep;
	private String memPhoto;
	
	public Recomment() {}
	
	
	public Recomment(int recommIdx, int postIdx, int commIdx, int memIdx, String recommWriter, String recommContent, Timestamp recommRegDate,
			int recommLike, int recommDislike, int recommRep, String memPhoto) {
		this.recommIdx = recommIdx;
		this.postIdx = postIdx;
		this.commIdx = commIdx;
		this.memIdx = memIdx;
		this.recommWriter = recommWriter;
		this.recommContent = recommContent;
		this.recommRegDate = recommRegDate;
		this.recommLike = recommLike;
		this.recommDislike = recommDislike;
		this.recommRep = recommRep;
		this.memPhoto = memPhoto;
	}


	public int getRecommIdx() {
		return recommIdx;
	}


	public void setRecommIdx(int recommIdx) {
		this.recommIdx = recommIdx;
	}


	public int getPostIdx() {
		return postIdx;
	}


	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}


	public int getCommIdx() {
		return commIdx;
	}


	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}


	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getRecommWriter() {
		return recommWriter;
	}

	public void setRecommWriter(String recommWriter) {
		this.recommWriter = recommWriter;
	}

	public String getRecommContent() {
		return recommContent;
	}

	public void setRecommContent(String recommContent) {
		this.recommContent = recommContent;
	}

	public Timestamp getRecommRegDate() {
		//return new Timestamp(recommRegDate.getTime()-(1000*60*60*9));
		return recommRegDate;
	}

	public void setRecommRegDate(Timestamp recommRegDate) {
		this.recommRegDate = recommRegDate;
	}

	public int getRecommLike() {
		return recommLike;
	}

	public void setRecommLike(int recommLike) {
		this.recommLike = recommLike;
	}

	public int getRecommDislike() {
		return recommDislike;
	}

	public void setRecommDislike(int recommDislike) {
		this.recommDislike = recommDislike;
	}

	public int getRecommRep() {
		return recommRep;
	}

	public void setRecommRep(int recommRep) {
		this.recommRep = recommRep;
	}
	// java.sql.TimeStamp -> java.util.Date
	public Date getDate() {
		return new Date(getRecommRegDate().getTime());
	}

	public String getMemPhoto() {
		return memPhoto;
	}


	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}

	@Override
	public String toString() {
		return "Recomment [recommIdx=" + recommIdx + ", postIdx=" + postIdx + ", commIdx=" + commIdx + ", recommWriter="
				+ recommWriter + ", recommContent=" + recommContent + ", recommRegDate=" + recommRegDate
				+ ", recommLike=" + recommLike + ", recommDislike=" + recommDislike + ", recommRep=" + recommRep + "]";
	}

}
