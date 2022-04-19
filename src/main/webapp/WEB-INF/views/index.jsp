<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board</title>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

</head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<body>
    <%@ include file="/WEB-INF/views/frame/header.jsp" %>

    <div class="content">
        <div class="content_wrap">
            <div id="search_bar">
                <img src="/cob/images/logo_color.png" id="search_logo">
                <div class="wrap">
                    <input type="text" name="searchText" placeholder="검색어를 입력해주세요.">
                    <button type="button" id="search_btn"><img id="search_img" src="/cob/images/search.png"></button>
                </div>
            </div>
            <div id="menu_wrap">
                <div class="content_menu">
                    <ul>
                        <li><a href="<c:url value='/group/groupList'/>"><img src="/cob/images/meet.png"><br>모 임</a></li>
                        <li><a href="<c:url value='/cafe/cafe_list'/>"><img src="/cob/images/cafe.png"><br>보드게임카페</a></li>              
                        <li><a href="<c:url value='/post/postList'/>"><img src="/cob/images/board.png"><br>게시판</a></li>
                        <li><a href="<c:url value='/game/gamelist'/>"><img src="/cob/images/game.png"><br>보드게임</a></li>
                    </ul>
    
                </div>
                <!--   <div class="nav_board">
                    <ul>
                        <li><a href="#">서 울</a></li>
                        <li><a href="#">경 기</a></li>
                        <li><a href="#">강 원</a></li>
                        <li><a href="#">충 청</a></li>
                        <li><a href="#">전 라</a></li>
                        <li><a href="#">경 북</a></li>
                        <li><a href="#">경 남</a></li>
                        <li><a href="#">제 주</a></li>
                    </ul>
                </div> -->
            </div>

        </div>
    </div>

</body>
</html>