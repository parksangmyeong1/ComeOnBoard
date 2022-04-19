package com.bitcamp.cob.post.domain;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Post {

	private int postIdx;
	private int memIdx;
	private String postWriter;
	private int views;
	private String postTitle;
	private String postContent;
	private String postSort;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Timestamp postRegDate;
	private int postLike;
	private int postDislike;
	private int postRep;
	private String memPhoto;
	
	public Post() {}
	
	public Post(int postIdx, int memIdx, String postWriter, int views, String postTitle, String postContent,
			String postSort, Timestamp postRegDate, int postLike, int postDislike, int postRep, String memPhoto) {
		this.postIdx = postIdx;
		this.memIdx = memIdx;
		this.postWriter = postWriter;
		this.views = views;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postSort = postSort;
		this.postRegDate = postRegDate;
		this.postLike = postLike;
		this.postDislike = postDislike;
		this.postRep = postRep;
		this.memPhoto = memPhoto;
	}
	
	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostSort() {
		return postSort;
	}

	public void setPostSort(String postSort) {
		this.postSort = postSort;
	}

	public Timestamp getPostRegDate() {
		//return new Timestamp(postRegDate.getTime()-(1000*60*60*9));
		return postRegDate;
	}

	public void setPostRegDate(Timestamp postRegDate) {
		this.postRegDate = postRegDate;
	}

	public int getPostLike() {
		return postLike;
	}

	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}

	public int getPostDislike() {
		return postDislike;
	}

	public void setPostDislike(int postDislike) {
		this.postDislike = postDislike;
	}

	public int getPostRep() {
		return postRep;
	}

	public void setPostRep(int postRep) {
		this.postRep = postRep;
	}
	// java.sql.TimeStamp -> java.util.Date
	public Date getDate() {
		return new Date(getPostRegDate().getTime());
	}

	public String getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}

	@Override
	public String toString() {
		return "Post [postIdx=" + postIdx + ", memIdx=" + memIdx + ", postWriter=" + postWriter + ", views=" + views
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + ", postSort=" + postSort
				+ ", postRegDate=" + postRegDate + ", postLike=" + postLike + ", postDislike=" + postDislike
				+ ", postRep=" + postRep + "]";
	}
	
}
