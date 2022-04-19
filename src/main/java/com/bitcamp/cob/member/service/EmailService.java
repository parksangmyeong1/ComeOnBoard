package com.bitcamp.cob.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.util.MakeCertNumber;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender sender;
	
	public int sendEmail(String memEmail, HttpSession session) {
		int result = 1;
		
		int certNum = MakeCertNumber.makeCertNumber();
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("Come On, Board E-mail 인증 번호", "UTF-8");
		
			String html = "<h1>Come On, Board 인증번호는 " + certNum +" 입니다.</h1>";
			html += "<h1>cob 해당 페이지에서  인증번호를 입력해주세요.</h1>";
			message.setText(html, "UTF-8", "html");
			message.addRecipient(RecipientType.TO, 
								new InternetAddress(memEmail));
			
			sender.send(message);
			
		} catch (MessagingException e) {
			result = 0;
			e.printStackTrace();
			
		} 
		session.setAttribute("certNum", certNum);
		return result;
	}
	
	public boolean chkEmail(int inputCertNum, HttpSession session) {
		boolean chk = false;
		
		int certNum = (int)session.getAttribute("certNum");
		if(inputCertNum  == certNum) {
			chk = true;
		}
		
		return chk;
	}
	
	
	
}
