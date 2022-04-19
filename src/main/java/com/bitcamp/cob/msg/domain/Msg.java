package com.bitcamp.cob.msg.domain;

import java.sql.Timestamp;

public class Msg {
	
	private int msgIdx;
	private int sendIdx; // 보내는 사람
	private String sendNickName;
	private int recIdx; // 받는 사람
	private String recNickName;
	private String msgContent; // 내용
	private Timestamp sendDate; // 보낸 시간 
	private int readChk; // 
	
	public int getMsgIdx() {
		return msgIdx;
	}
	public void setMsgIdx(int msgIdx) {
		this.msgIdx = msgIdx;
	}
	public int getSendIdx() {
		return sendIdx;
	}
	public void setSendIdx(int sendIdx) {
		this.sendIdx = sendIdx;
	}
	public String getSendNickName() {
		return sendNickName;
	}
	public void setSendNickName(String sendNickName) {
		this.sendNickName = sendNickName;
	}
	public int getRecIdx() {
		return recIdx;
	}
	public void setRecIdx(int recIdx) {
		this.recIdx = recIdx;
	}
	public String getRecNickName() {
		return recNickName;
	}
	public void setRecNickName(String recNickName) {
		this.recNickName = recNickName;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public Timestamp getSendDate() {
		return sendDate;
	}
	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}
	public int getReadChk() {
		return readChk;
	}
	public void setReadChk(int readChk) {
		this.readChk = readChk;
	}
	@Override
	public String toString() {
		return "InputMsg [msgIdx=" + msgIdx + ", sendIdx=" + sendIdx + ", sendNickName=" + sendNickName + ", recIdx="
				+ recIdx + ", recNickName=" + recNickName + ", msgContent=" + msgContent + ", sendDate=" + sendDate
				+ ", readChk=" + readChk + "]";
	}
	
	
	
}
