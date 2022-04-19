package com.bitcamp.cob.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.Member;
import com.bitcamp.cob.member.domain.MemberRegRequest;

@Service
public class MemberRegService {
	
	final String UPLOAD_URI = "/uploadfile/member";
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public int memberReg(
			MemberRegRequest regRequest,
			HttpServletRequest request
			) {
		int resultCnt = 0;
		File newFile = null;

		regRequest.makeMemBirth();
		try {
			String path = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
			File newDir = new File(path);
			
			if(newDir.exists()) {
				newDir.mkdir();
				System.out.println("저장 폴더를 생성했습니다.");
			}
			
			String newFileName = regRequest.getMemId()+System.currentTimeMillis();
			
			newFile = new File(newDir, newFileName);
			
			Member member = regRequest.toMember();
			
			if(regRequest.getMemPhoto() != null && !regRequest.getMemPhoto().isEmpty()) {
	
				regRequest.getMemPhoto().transferTo(newFile);
				member.setMemPhoto(newFileName);
				
			} else {
				member.setMemPhoto("default.jpg");
			}
			
			dao = template.getMapper(MemberDao.class);
			
			resultCnt = dao.insertMember(member);
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultCnt;
	}
}
