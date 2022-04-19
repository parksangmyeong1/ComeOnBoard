package com.bitcamp.cob.member.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class MemberUpdateRequest {

	private int memIdx;
	private String nickName;
	private String year;
	private String month;
	private String day;
	private Timestamp memBirth;
	private String memGender; 
	private String preferAddr;
	private String memTel;
	private String memEmail;
	
	

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


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = month;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
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


	public void makeMemBirth() {
		String birthDay = year+"-"+month+"-"+day+" 00:00:00";
		Timestamp memBirth = Timestamp.valueOf(birthDay);
		memBirth.toLocalDateTime();
		this.memBirth = memBirth;
		};
	

	// 업데이트용 toMember
	public Member toMember() {
		return new Member(
				memIdx,
				null,	// ID
				nickName,
				null, //password
				null, // name
				memBirth,
				memGender,
				preferAddr,
				memTel,
				memEmail,
				null,	// photo
				null	// Auth
				);
	}


	@Override
	public String toString() {
		return "MemberUpdateRequest [memIdx=" + memIdx + ", nickName=" + nickName + ", year=" + year + ", month="
				+ month + ", day=" + day + ", memBirth=" + memBirth + ", memGender=" + memGender + ", preferAddr="
				+ preferAddr + ", memTel=" + memTel + ", memEmail=" + memEmail + "]";
	}


}
