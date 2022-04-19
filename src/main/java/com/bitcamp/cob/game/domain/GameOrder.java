package com.bitcamp.cob.game.domain;

public class GameOrder {

	private int cusIdx;
	private int memIdx;
	private int gameIdx;
	private String memName;
	private int gamePrice;
	private String shipAddress;
	private String phoneNum;
	private String merchant;
	
	public GameOrder(int cusIdx, int memIdx, int gameIdx, String memName, int gamePrice, String shipAddress,
			String phoneNum, String merchant) {
		this.cusIdx = cusIdx;
		this.memIdx = memIdx;
		this.gameIdx = gameIdx;
		this.memName = memName;
		this.gamePrice = gamePrice;
		this.shipAddress = shipAddress;
		this.phoneNum = phoneNum;
		this.merchant = merchant;
	}
	
	public GameOrder() {}

	public int getCusIdx() {
		return cusIdx;
	}

	public void setCusIdx(int cusIdx) {
		this.cusIdx = cusIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public int getGameIdx() {
		return gameIdx;
	}

	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public int getGamePrice() {
		return gamePrice;
	}

	public void setGamePrice(int gamePrice) {
		this.gamePrice = gamePrice;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
		

	public String getMerchant() {
		return merchant;
	}

	public void setMerchant(String merchant) {
		this.merchant = merchant;
	}

	@Override
	public String toString() {
		return "GameOrder [cusIdx=" + cusIdx + ", memIdx=" + memIdx + ", gameIdx=" + gameIdx + ", memName=" + memName
				+ ", gamePrice=" + gamePrice + ", shipAddress=" + shipAddress + ", phoneNum=" + phoneNum + ", merchant="
				+ merchant + "]";
	}


	
	
	
}
