package com.bitcamp.cob.msg.dao;

import com.bitcamp.cob.msg.domain.Msg;

public interface MsgDao {
	
	// 메시지 보내기
	public int postMsg(Msg msg);

}
