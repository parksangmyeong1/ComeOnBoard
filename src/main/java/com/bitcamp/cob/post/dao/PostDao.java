package com.bitcamp.cob.post.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.cob.comment.domain.Comment;
import com.bitcamp.cob.comment.domain.CommentPagingRequest;
import com.bitcamp.cob.common.utils.PagingVO;
import com.bitcamp.cob.post.domain.CheckRequest;
import com.bitcamp.cob.post.domain.Post;
import com.bitcamp.cob.recomment.domain.Recomment;

public interface PostDao {
	
	// 게시글 등록
	int insertPost(Post post);
	// 게시글 정보 수정
	int editPost(Post post);
	// 게시글 삭제
	int deletePost(int postIdx);
	// 수정할 게시글 가져오기
	Post selectByIdx(int postIdx);
	// 상세 게시글
	List<Post> selectPostDetail(int postIdx);
	// 게시글 리스트
	List<Post> selectAll();
	// 게시글 카테고리로 조회
	List<Post> selectBySort(String postSort);
	
	
	// 게시글 조회수 증가
	void addViews(int postIdx);
	// 게시글 댓글 수 조회
	int countComment(int postIdx);
	
	
	// 댓글 등록
	int insertComment(Comment comment);
	// 댓글 조회
	List<Comment> selectCommList(int postIdx);
	// 댓글 삭제
	int deleteComment(int commIdx);
	// 댓글 수정
	int editComment(int commIdx, String commContent);
	
	
	// 게시글 총 갯수
	int countPost(String postSort);
	// 게시글 총 갯수
	int countPost1(int memIdx);
	// 페이징 게시글 총 갯수
	int countPagingPost(Map<String, Object> map);
	// 페이징 처리 게시글 조회
	List<Post>pagingPost(PagingVO vo);
	// 작성자 게시글 조회
	List<Post>searchPost(PagingVO vo, int memIdx);
	// 검색으로 리스트 조회
	List<Post> selectBySearch(Map<String, Object> map);
	// 검색으로 리스트 조회
	List<Post> selectBySearchAndPaging(Map<String, Object> map);
	
	
	// 대댓글 등록
	int insertRecomment(Recomment recomment);
	// 대댓글 리스트 출력
	List<Recomment> selectRecommList(int postIdx);
	// 베스트 댓글 조회
	Comment selectBestComment(int postIdx);
	// 대댓글 삭제
	int deleteRecomment(int recommIdx);
	// 대댓글 수정
	int editRecomment(int recommIdx, String recommContent);
	

	// check용 등록
	int insertCheck(CheckRequest checkRequest);
	// 좋아요 했는지 찾기
	int selectLikeCheck(CheckRequest checkRequest);
	// 증가 버튼
	int addbutton(CheckRequest checkRequest);
	
	// 댓글 리스트 총 갯수
	int getComment(CommentPagingRequest request);
	// 댓글 리스트 출력
	List<Comment> getCommentList(CommentPagingRequest request);
}
