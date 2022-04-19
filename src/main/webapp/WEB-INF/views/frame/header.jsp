<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
function makeRedirect(){
	var redirectUri = window.location.href;
	sessionStorage.setItem("redirectUri", redirectUri);
	location.href= '<c:url value="/member/login"/>' ;
}

function logout(){
	location.href='<c:url value="/member/logout"/>';
}
</script>
        <div class="nav_top">
            <ul class="area_gnb">
                <li>다크모드</li>
                <li><a href="<c:url value='/member/mypage'/>">마이페이지</a></li>
                <c:if test="${loginInfo == null}">
       	            <li><a href="#" onclick="makeRedirect()">로그인</a></li>
                </c:if>
				<c:if test="${loginInfo != null}">
					<li><a href="#" onclick="logout()">로그아웃</a></li>
				</c:if>
            </ul>
        </div>

        <div class="container">
            <a href="<c:url value='/'/>"><img src="<c:url value='/images/logo_white.png'/>" class="logo"></a>
            <div class="nav_main">
                <ul class="right_ul font_white">
                    <li><a href="<c:url value='/group/groupList'/>">모임</a></li>
                    <li><a href="<c:url value='/cafe/cafe_list'/>">카페</a></li>
                    <li><a href="<c:url value='/post/postList'/>">게시판</a></li>    
                    <li><a href="<c:url value='/game/gamelist'/>">보드게임</a></li>  
                </ul>
            </div>
        </div>



    </header>