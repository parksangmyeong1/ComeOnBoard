package com.bitcamp.cob.util;

import java.util.Random;

public class MakeCertNumber {
	
	// 이메일 인증에 사용할 6자리 난수 생성 메소드
	public static int makeCertNumber(){
		int minNum = 100000;
		int maxNum = 1000000;
		
		Random random = new Random();
	 	
		return random.nextInt((maxNum-minNum+1))+minNum;
	}
}
