package com.bitcamp.cob.member.domain;

public class FindIdPwInfo {
	
	String memId;
	String memName;
	String memEmail;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	@Override
	public String toString() {
		return "FindIdPwInfo [memId=" + memId + ", memName=" + memName + ", memEmail=" + memEmail + "]";
	}

	
}
