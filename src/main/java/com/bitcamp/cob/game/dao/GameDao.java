package com.bitcamp.cob.game.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.cob.game.domain.Game;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.GamePage;
import com.bitcamp.cob.game.domain.GameOrder;
import com.bitcamp.cob.game.domain.GameReview;
import com.bitcamp.cob.game.domain.OrderList;
import com.bitcamp.cob.game.domain.PreferGame;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.domain.SortType;
import com.bitcamp.cob.member.domain.GameInfo;

public interface GameDao {
	
	
	// 게임등록
	int insertGame(Game game);
	// 게임정보수정
	int editGame(Game game);
	//List<Game> selectAllGame(int idx);
	// 게임 삭제
	int deleteGame(Game game);
	
	//List<GameReview> allGameReview();
	// 게임리스트 총 게시글 갯수
	int countGameList(SearchType searchType);
	// 게임 메인
	//List<GameMain> selectGameMain(@Param("firstRow") int firstRow, @Param("gameCountPerPage") int gameCountPerPage);
	// 게임 메인에서 게임 분류별 검색
	//List<GameMain> sortGame(SortType sortType);		
	// 게임 페이지
	GamePage selectGamePage(int idx);
	// 게임 메인에서 게임 리스트 검색
	List<GameMain> searchGame(SearchType searchType);
	
	// 게임페이지 리뷰 등록
	int insertGameRev (GameReview gameRev);
	// 게임리뷰  출력
	List<GameReview> selectReview(GameReview gameIdx);
	// 리뷰 삭제
	int deleteRev (GameReview gameRev);
	// 리뷰 삭제
	int EditRev (GameReview gameRev);	
	// 페이징
	List<GameMain> selectGamePaging(SearchType searchType);
	
	//선호게임 등록
	int insertPreferGame(PreferGame preferGame);
	//선호게임 삭제
	int deletePreferGame(PreferGame preferGame);
	
	//게임 이름 중복체크
	int selectName(String gameName);
	//선호게임 체크 
	int preferChk(PreferGame pgf);
	
	// 주문정보 입력
	int insertOrder(GameOrder order);
	// 주문목록
	List<OrderList>selectOrderList(int idx);
	
}
