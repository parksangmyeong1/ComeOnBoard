package com.bitcamp.cob.post.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.common.utils.PagingVO;
import com.bitcamp.cob.post.dao.PostDao;
import com.bitcamp.cob.post.domain.Post;

@Service
public class PostListService {

	@Autowired
	private SqlSessionTemplate template;

	public List<Post> getPostListSearchType(Map<String, Object> map) {
		System.out.println("카테고리 x 검색 o");
		return template.getMapper(PostDao.class).selectBySearch(map);
	}
	
	public List<Post> getPostList(Map<String, Object> map) {
		System.out.println("카테고리 o 검색 x");
		System.out.println("카테고리 o 검색 o");
		return template.getMapper(PostDao.class).selectBySearchAndPaging(map);
	}
	
	public List<Post> getPostList(PagingVO vo) {
		System.out.println("카테고리 x 검색 x");
		return template.getMapper(PostDao.class).pagingPost(vo);
	}
	
	public List<Post> searchPostList(PagingVO vo, int memIdx) {
		return template.getMapper(PostDao.class).searchPost(vo,memIdx);
	}
	
}
