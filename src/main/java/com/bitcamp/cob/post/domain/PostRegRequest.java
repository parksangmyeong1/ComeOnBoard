package com.bitcamp.cob.post.domain;

public class PostRegRequest {

	// 사용자의 입력을 저장하는 용도의 클래스
	// regForm의 name과 일치시켜야 알아서 저장해준다.
	// 알아서 넣어주기 때문에 생성자 필요가 없다.
	private int memIdx;
	private String postWriter;
	private String postTitle;
	private String postContent;
	private String postSort;

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostSort() {
		return postSort;
	}

	public void setPostSort(String postSort) {
		this.postSort = postSort;
	}

	// 데이터가 잘들어왔는지 확인하는 용도
	// getOriginalFilename 쓰는 이유는 데이터 확인용으로 파일 이름을 보기 위해서
	@Override
	public String toString() {
		return "PostRegRequest [memIdx=" + memIdx + ", postWriter=" + postWriter + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", postSort=" + postSort + "]";
	}
	
	// MemberRegRequest -> Member 
	// 사용자에게 받는 건 MemberRegRequest지만 DB저장은 Member라서 바꿔줘야한다.
	public Post toPost() {
		return new Post(0, memIdx, postWriter, 0, postTitle, postContent, postSort,
				null, 0, 0, 0, null);
	}

	
}
