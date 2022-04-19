package com.bitcamp.cob.game.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.Game;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.GameRegRequest;
import com.bitcamp.cob.game.domain.SearchType;

@Service
public class GameRegService {

	final String UPLOAD_URI = "/uploadfile/uploadgamefile";
	private GameDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public int gameReg(GameRegRequest regRequest, HttpServletRequest request) {
	
		int resultCnt = 0;
		File newFile = null;
		
		
		// Game 객체를 생성하여 -> 저장된 파일의 이름 세팅
		Game game = regRequest.toGame();
		try {
		//파일 저장
		if(regRequest.getGamePhoto() != null && !regRequest.getGamePhoto().isEmpty()) {
			
			// 새로운 저장폴더 : File
			File newDir = new File(request.getSession().getServletContext().getRealPath(UPLOAD_URI));
			
			// 폴더가 없을시 폴더생성
			if(!newDir.exists()) {
				newDir.mkdir();
			}
		
			//회원별 고유한 파일 등록
			String newFileName;
			
				newFileName = System.currentTimeMillis()
				+"." + chkFileType(regRequest.getGamePhoto());
			
			
			newFile = new File(newDir, newFileName);
			
		
				regRequest.getGamePhoto().transferTo(newFile);
				game.setGamePhoto(newFileName);
		
			
		}else {
			game.setGamePhoto("gamephoto.png");
		}
		
		System.out.println(regRequest.getGameName());
		
		
		dao =  template.getMapper(GameDao.class);
		
		resultCnt = dao.insertGame(game);
		
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			if(newFile != null && newFile.exists()) {
				newFile.delete();
			}
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return resultCnt;
		
	}

	public List<GameMain> getGameMain(SearchType searchType){
		
		return template.getMapper(GameDao.class).searchGame(searchType);
	
	}		
	
	// 파일 확장자 체크
	private String chkFileType(MultipartFile file) throws Exception {
		String extension = "";

		// 업로드 파일의 type
		String contentType = file.getContentType();
		if (!(contentType.equals("image/jpeg") || contentType.equals("image/jpg") || contentType.equals("image/png")
				|| contentType.equals("image/gif"))) {
			throw new Exception("허용하지 않는 파일 타입 : " + contentType);
		}

		// 파일 확장자 구하기
		String fileName = file.getOriginalFilename();
		// 정규식의 패턴 문자열을 전달해야하기 때문에 \\. 으로 처리
		String[] nameTokens = fileName.split("\\.");

		// 토근의 마지막 index의 문자열을 가져옴 : 배열의개수 -1
		extension = nameTokens[nameTokens.length - 1].toLowerCase();

		// 지정한 파일 외 업로드 금지
		if (!(extension.equals("jpg") || extension.equals("png") || extension.equals("gif"))) {
			throw new Exception("허용하지 않는 파일 확장자 타입 : " + contentType);
		}

		return extension;
	}

}
