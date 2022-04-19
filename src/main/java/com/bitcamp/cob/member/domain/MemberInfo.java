package com.bitcamp.cob.member.domain;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberInfo {

	private int memIdx;
	private String nickName;
	private String memName;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Timestamp memBirth;
	private String memGender;
	private String preferAddr;
	private String memPhoto;
	private int followChk;
	private List<GameInfo> preferGame;
	
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Timestamp getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Timestamp memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getPreferAddr() {
		return preferAddr;
	}
	public void setPreferAddr(String preferAddr) {
		this.preferAddr = preferAddr;
	}
	public String getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
	
	
	public int getFollowChk() {
		return followChk;
	}
	public void setFollowChk(int followChk) {
		this.followChk = followChk;
	}
	
	public List<GameInfo> getPreferGame() {
		return preferGame;
	}
	public void setPreferGame(List<GameInfo> preferGame) {
		this.preferGame = preferGame;
	}
	
	@Override
	public String toString() {
		return "MemberInfo [memIdx=" + memIdx + ", nickName=" + nickName + ", memName=" + memName + ", memBirth="
				+ memBirth + ", memGender=" + memGender + ", preferAddr=" + preferAddr + ", memPhoto=" + memPhoto
				+ ", followChk=" + followChk + ", preferGame=" + preferGame + "]";
	}
	
	
}
