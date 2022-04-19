package com.bitcamp.cob.group.domain;

import java.util.ArrayList;

public class NicknameList {

	private ArrayList<String> nickNameList;
	
	public NicknameList () {}

	public NicknameList(ArrayList<String> nickNameList) {
		super();
		this.nickNameList = nickNameList;
	}

	public ArrayList<String> getNickNameList() {
		return nickNameList;
	}

	public void setNickNameList(ArrayList<String> nickNameList) {
		this.nickNameList = nickNameList;
	}

	@Override
	public String toString() {
		return "NicknameList [nickNameList=" + nickNameList + "]";
	}
	
	
	
}
