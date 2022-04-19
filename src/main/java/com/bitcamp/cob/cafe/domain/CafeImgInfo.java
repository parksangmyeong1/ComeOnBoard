package com.bitcamp.cob.cafe.domain;

public class CafeImgInfo {

	private int cafeImgIdx;
	private int cafeIdx;
	private int memIdx;
	private String cafeName;
	private String cafeImg;
	private String path;
	
	public CafeImgInfo() {}

	public int getCafeImgIdx() {
		return cafeImgIdx;
	}

	public void setCafeImgIdx(int cafeImgIdx) {
		this.cafeImgIdx = cafeImgIdx;
	}

	public int getCafeIdx() {
		return cafeIdx;
	}

	public void setCafeIdx(int cafeIdx) {
		this.cafeIdx = cafeIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getCafeImg() {
		return cafeImg;
	}

	public void setCafeImg(String cafeImg) {
		this.cafeImg = cafeImg;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "CafeImgInfo [cafeImgIdx=" + cafeImgIdx + ", cafeIdx=" + cafeIdx + ", memIdx=" + memIdx + ", cafeName="
				+ cafeName + ", cafeImg=" + cafeImg + ", path=" + path + "]";
	}

	

}
