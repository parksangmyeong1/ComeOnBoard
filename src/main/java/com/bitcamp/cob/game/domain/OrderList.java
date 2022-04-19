package com.bitcamp.cob.game.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderList {

	private String gameName;
	private int gamePrice;
	private int memIdx;
	private int gameIdx;
	private String memName;
	private String shipAddress;
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm",timezone="Asia/Seoul")
	private Timestamp orderDate;

	public OrderList() {}

	public OrderList(String gameName, int gamePrice, int memIdx, int gameIdx, String memName, String shipAddress,
			Timestamp orderDate) {
		
		this.gameName = gameName;
		this.gamePrice = gamePrice;
		this.memIdx = memIdx;
		this.gameIdx = gameIdx;
		this.memName = memName;
		this.shipAddress = shipAddress;
		this.orderDate = orderDate;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public int getGamePrice() {
		return gamePrice;
	}

	public void setGamePrice(int gamePrice) {
		this.gamePrice = gamePrice;
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

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public Timestamp getOrderDate() {
		//return new Timestamp(orderDate.getTime()-(1000*60*60*9));
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "OrderList [gameName=" + gameName + ", gamePrice=" + gamePrice + ", memIdx=" + memIdx + ", gameIdx="
				+ gameIdx + ", memName=" + memName + ", shipAddress=" + shipAddress + ", orderDate=" + orderDate + "]";
	}

	
	
}
