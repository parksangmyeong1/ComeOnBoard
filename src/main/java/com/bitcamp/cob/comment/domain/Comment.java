package com.bitcamp.cob.comment.domain;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class Comment {

	private int commIdx;
	private int memIdx;
	private int postIdx;
	private String commWriter;
	private String commContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Timestamp commRegDate;
	private int commLike;
	private int commDislike;
	private int commRep;
	private String memPhoto;
	
	public Comment() {}

	public Comment(int commIdx, int memIdx, int postIdx, String commWriter, String commContent, Timestamp commRegDate, int commLike, int commDislike,
			int commRep, String memPhoto) {
		this.commIdx = commIdx;
		this.memIdx = memIdx;
		this.postIdx = postIdx;
		this.commWriter = commWriter;
		this.commContent = commContent;
		this.commRegDate = commRegDate;
		this.commLike = commLike;
		this.commDislike = commDislike;
		this.commRep = commRep;
		this.memPhoto = memPhoto;
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

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public String getCommWriter() {
		return commWriter;
	}

	public void setCommWriter(String commWriter) {
		this.commWriter = commWriter;
	}

	public String getCommContent() {
		return commContent;
	}
	
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Timestamp getCommRegDate() {
		//return new Timestamp(commRegDate.getTime());
		return commRegDate;
	}

	public void setCommRegDate(Timestamp commRegDate) {
		this.commRegDate = commRegDate;
	}

	public int getCommLike() {
		return commLike;
	}

	public void setCommLike(int commLike) {
		this.commLike = commLike;
	}

	public int getCommDislike() {
		return commDislike;
	}

	public void setCommDislike(int commDislike) {
		this.commDislike = commDislike;
	}

	public int getCommRep() {
		return commRep;
	}

	public void setCommRep(int commRep) {
		this.commRep = commRep;
	}
	// java.sql.TimeStamp -> java.util.Date
	public Date getDate() {
		return new Date(getCommRegDate().getTime());
	}

	public String getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}

	@Override
	public String toString() {
		return "Comment [commIdx=" + commIdx + ", postIdx=" + postIdx + ", commContent=" + commContent
				+ ", commRegDate=" + commRegDate + ", commLike=" + commLike + ", commDislike=" + commDislike
				+ ", commRep=" + commRep + "]";
	}
	
}
