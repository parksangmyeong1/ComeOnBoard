package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.domain.Member;
import com.bitcamp.cob.member.domain.MemberInfo;
import com.bitcamp.cob.member.domain.RecommendType;
import com.bitcamp.cob.member.service.FriendRestService;

@RestController
public class FriendController {

	@Autowired
	private FriendRestService service;
	
	
	@PostMapping("/friends/{idx}")
	public int postFriend(
			@PathVariable("idx")int frIdx,
			Integer memIdx// 회원 idx 
			){ 
		int result = service.postFriend(memIdx, frIdx);

		return result;
	}
	
	@GetMapping("/members/login/{idx}")
	public Member getMyInfo(@PathVariable("idx") int memIdx) {
		Member member = service.getMyInfo(memIdx);
		return member;
	}
	
	@GetMapping("/member/{idx}")
	public MemberInfo getFriend(
			@PathVariable("idx")int idx,
			Integer memIdx
			){
		MemberInfo memberInfo = service.getMember(memIdx, idx);
		
		return memberInfo;
	}
	
	@GetMapping("/members/{memIdx}/friends/follow")
	public List<MemberInfo> getFriendList(@PathVariable("memIdx")int memIdx){
		List<MemberInfo> list = null;
		
		list = service.getFriendList(memIdx);
		
		return list;
	}
	
	@GetMapping("/friends/following/{memIdx}")
	public List<MemberInfo> getFollowingFriendList(@PathVariable("memIdx")int memIdx){
		List<MemberInfo> list = null;
		
		list = service.getFollowingFriendList(memIdx);
		
		return list;
	}
	
	@GetMapping("/friends/recommendFriends/{idx}")
	public List<MemberInfo> getRecommendFriend(
			@PathVariable("idx")int memIdx,
			RecommendType recommendType
			){
		List<MemberInfo> list = null;
		
		list = service.getRecommendFriend(recommendType);
		
		return list;
	}
	
	
	@DeleteMapping("/friends/{frIdx}")
	public int deleteFriend(@PathVariable("frIdx")int frIdx,
							@RequestParam("memIdx")int memIdx){
		int result = 0;
		
		result = service.deleteFriend(memIdx, frIdx);	
		
		return result;
	}

}
