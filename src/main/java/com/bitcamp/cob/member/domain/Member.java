package com.bitcamp.cob.member.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class Member {

	private int memIdx;
	private String memId;
	private String nickName;
	@JsonIgnore
	private String memPassword;
	private String memName;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Timestamp memBirth;
	private String memGender;
	private String preferAddr;
	private String memTel;
	private String memEmail;
	private String memPhoto;
	private String memAuth; // member, manager, ban, cafe
	
	
	public Member(int memIdx, String memId, String nickName, String memPassword, String memName, Timestamp memBirth,
			String memGender, String preferAddr, String memTel, String memEmail, String memPhoto, String memAuth) {
		this.memIdx = memIdx;
		this.memId = memId;
		this.nickName = nickName;
		this.memPassword = memPassword;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.preferAddr = preferAddr;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.memPhoto = memPhoto;
		this.memAuth = memAuth;
	}

	public Member() {};
	
	

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMemPassword() {
		return memPassword;
	}

	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
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

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}

	public String getMemAuth() {
		return memAuth;
	}

	public void setMemAuth(String memAuth) {
		this.memAuth = memAuth;
	}

	@Override
	public String toString() {
		return "Member [memIdx=" + memIdx + ", memId=" + memId + ", nickName=" + nickName + ", memPassword="
				+ memPassword + ", memName=" + memName + ", memBirth=" + memBirth + ", memGender=" + memGender
				+ ", preferAddr=" + preferAddr + ", memTel=" + memTel + ", memEmail=" + memEmail + ", memPhoto="
				+ memPhoto + ", memAuth=" + memAuth + "]";
	}
	
	
	
}
