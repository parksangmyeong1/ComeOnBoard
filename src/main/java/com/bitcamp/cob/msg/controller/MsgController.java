package com.bitcamp.cob.msg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.msg.domain.Msg;
import com.bitcamp.cob.msg.service.MsgService;

@RestController
public class MsgController {

	@Autowired
	MsgService service;
	
	@GetMapping("/msg/me")
	public List<Msg> getMsg() {
		List<Msg> list = null;
		return list;
	}
	
	@PostMapping("/msg")
	public int postMsg(Msg msg) {
		
		int result = service.postMsg(msg);
		return result;
	}
	
	@DeleteMapping("/msg/{idx}")
	public int deleteMsg() {
		int result = 0;
		return result;
	}
}
