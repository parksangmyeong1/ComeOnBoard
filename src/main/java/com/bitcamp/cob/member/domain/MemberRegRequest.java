package com.bitcamp.cob.member.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class MemberRegRequest {

	private String memId;
	private String nickName;
	private String memPassword;
	private String memName;
	private int year;
	private int month;
	private int day;
	private Timestamp memBirth;
	private String memGender; 
	private String preferAddr;
	private String memTel;
	private String memEmail;
	private MultipartFile memPhoto;
	

	


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



	public int getYear() {
		return year;
	}



	public void setYear(int year) {
		this.year = year;
	}



	public int getMonth() {
		return month;
	}



	public void setMonth(int month) {
		this.month = month;
	}



	public int getDay() {
		return day;
	}



	public void setDay(int day) {
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



	public MultipartFile getMemPhoto() {
		return memPhoto;
	}



	public void setMemPhoto(MultipartFile memPhoto) {
		this.memPhoto = memPhoto;
	}



	public void makeMemBirth() {

		if(year > 0 && month > 0  && day > 0) {
			String birthDay = year+"-"+month+"-"+day+" 00:00:00";
			memBirth = Timestamp.valueOf(birthDay);
			memBirth.toLocalDateTime();
		}
		
		};
	
	
	// 생성용 toMember
	public Member toMember() {
		return new Member(0,
				memId,	// ID
				nickName,
				memPassword, //password
				memName, // name
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
		return "MemberRegRequest [memId=" + memId + ", nickName=" + nickName + ", memPassword=" + memPassword
				+ ", memName=" + memName + ", year=" + year + ", month=" + month + ", day=" + day + ", memBirth="
				+ memBirth + ", memGender=" + memGender + ", preferAddr=" + preferAddr + ", memTel=" + memTel
				+ ", memEmail=" + memEmail + ", memPhoto=" + memPhoto + "]";
	}

	

	
	
	
}
