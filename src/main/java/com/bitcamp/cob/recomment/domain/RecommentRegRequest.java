package com.bitcamp.cob.recomment.domain;

public class RecommentRegRequest {

	// 사용자의 입력을 저장하는 용도의 클래스
	// regForm의 name과 일치시켜야 알아서 저장해준다.
	// 알아서 넣어주기 때문에 생성자 필요가 없다.
	private int postIdx;
	private int commIdx;
	private int memIdx;
	private String recommContent;

	public RecommentRegRequest() {}
	
	public RecommentRegRequest(int postIdx, int commIdx, int memIdx, String recommContent) {
		this.postIdx = postIdx;
		this.commIdx = commIdx;
		this.memIdx = memIdx;
		this.recommContent = recommContent;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public int getCommIdx() {
		return commIdx;
	}

	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getRecommContent() {
		return recommContent;
	}

	public void setRecommContent(String recommContent) {
		this.recommContent = recommContent;
	}

	// MemberRegRequest -> Member 
	// 사용자에게 받는 건 MemberRegRequest지만 DB저장은 Member라서 바꿔줘야한다.
	public Recomment toRecomment() {
		return new Recomment(0, postIdx, commIdx, memIdx, null, recommContent, null, 0, 0, 0, null);
	}

	
}
