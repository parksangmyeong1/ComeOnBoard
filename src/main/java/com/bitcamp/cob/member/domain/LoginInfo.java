package com.bitcamp.cob.member.domain;

public class LoginInfo {

	private int memIdx;
	private String memId;
	private String nickName;
	private String memPhoto;
	private String preferAddr;
	private String memAuth; // member, manager, ban, cafe
	
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
	public String getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
	public String getPreferAddr() {
		return preferAddr;
	}
	public void setPreferAddr(String preferAddr) {
		this.preferAddr = preferAddr;
	}
	public String getMemAuth() {
		return memAuth;
	}
	public void setMemAuth(String memAuth) {
		this.memAuth = memAuth;
	}
	@Override
	public String toString() {
		return "LoginInfo [memIdx=" + memIdx + ", memId=" + memId + ", nickName=" + nickName + ", memPhoto=" + memPhoto
				+ ", preferAddr=" + preferAddr + ", memAuth=" + memAuth + "]";
	}
	
	

	
	
	
}
