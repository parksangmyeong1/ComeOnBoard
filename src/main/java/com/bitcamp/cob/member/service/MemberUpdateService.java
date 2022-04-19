package com.bitcamp.cob.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.LoginInfo;
import com.bitcamp.cob.member.domain.Member;
import com.bitcamp.cob.member.domain.MemberUpdateRequest;

@Service
public class MemberUpdateService {

	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 프로필 정보 수정
	public Member memberUpdate(MemberUpdateRequest updateRequest, HttpSession session){
		int resultCnt = 0;
		updateRequest.makeMemBirth();
		Member member = updateRequest.toMember();
			
		dao = template.getMapper(MemberDao.class);
			
		resultCnt = dao.updateMember(member);
		
		if(resultCnt>0) {
			LoginInfo loginInfo = dao.selectByIdx(member.getMemIdx());
			session.setAttribute("loginInfo", loginInfo);
		}
		return member;
	}
	
	// 프로필 사진 기본으로 수정
	public int memberPhotoDelete(LoginInfo loginInfo, HttpServletRequest request, HttpSession session) {
		final String UPLOAD_URI = "/uploadfile/member";
		int resultCnt = 0;
		File oldPhoto = null;
		String memPhoto = loginInfo.getMemPhoto();
		
		try {
			String path = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
			File newDir = new File(path);
			
			if(!memPhoto.equals("default.jpg")){
				oldPhoto = new File(newDir, memPhoto);
				oldPhoto.delete();
			}
			
			loginInfo.setMemPhoto("default.jpg");
				
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		dao = template.getMapper(MemberDao.class);
		resultCnt = dao.updateMemPhoto(loginInfo.getMemIdx(), loginInfo.getMemPhoto());

		session.setAttribute("loginInfo", loginInfo);
		return resultCnt;
	}
	
	// 프로필 사진 수정
		public String memberPhotoUpdate(LoginInfo loginInfo, MultipartFile newMemPhoto, HttpServletRequest request, HttpSession session) {
			final String UPLOAD_URI = "/uploadfile/member";
			String photoName = null;
			File newPhoto = null;
			File oldPhoto = null;
			String memPhoto = loginInfo.getMemPhoto();
			String newFileName = loginInfo.getMemId()+System.currentTimeMillis();
			try {
				String path = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
				File newDir = new File(path);
				
				
				newPhoto = new File(newDir, newFileName);
				
				if(!memPhoto.equals("default.jpg")){
					oldPhoto = new File(newDir, memPhoto);
					oldPhoto.delete();
				}

				
				if(newMemPhoto != null && !newMemPhoto.isEmpty()) {	
					newMemPhoto.transferTo(newPhoto);
					loginInfo.setMemPhoto(newFileName);
				} 
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} finally {
				dao = template.getMapper(MemberDao.class);
				int result = dao.updateMemPhoto(loginInfo.getMemIdx(), loginInfo.getMemPhoto());
				if(result>0) {
					photoName = newFileName;
				}
				
				session.setAttribute("loginInfo", loginInfo);
				
			}
			return photoName;
		}
	
	
}
