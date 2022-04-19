<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ComeOnBoard</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>

    header {
        position: relative;
        z-index: 20;
        min-width: 980px;
        width: 100%;
        height: 140px;
        background-color: rgb(66, 133, 244);
        text-align: center;
    }
    .MultiBar {
        display: inline-block;
        height: 30px;
        width: 100%;
        max-width: 1280px;
        padding: 12px 0px 5px;
    } 

    .area_gnb {
        font-size: 12px;
        width: 500px;
        height: 30px;
        float: right;
        color: white;
    }

    .area_gnb>li {
        float: right;
        width: 75px;
    }

    .container {
        display: inline-block;
        height: 93px;
        width: 100%;
        max-width: 1280px;
        position: relative;
    }

    .logo {
        position: absolute;
        left: 50%;
        width: 180px;
        margin-left: -90px;
    }


    .main_naviwrap {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-width: 1280px;
        height: 80px;
        margin-top: -98px;
        padding-bottom: 10px;
    }
    .main_nav {
        padding-top: 45px;
    }
    .main_nav>.left_ul {
        float: left;
        overflow: hidden;
    }
    .main_nav>.right_ul {
        float: right;
        overflow: hidden;
    }

    .main_nav>ul>li {
        color: white;
        width: 85px;
        float: left;
    }

	
</style>
<body>
	<header>
		<div class="MultiBar">
			<ul class="area_gnb">
				<li>시작페이지로</li>
				<li>다크모드</li>
				<li>마이페이지</li>
				<li>로그인</li>
			</ul>
		</div>

		<div class="container">
			<img src="<c:url value='/images/cob_white.png' />"class="logo"/>
		</div>
		<div class="main_naviwrap">
			<div class="main_nav">
				<ul class="left_ul">
					<li>회사소개</li>
					<li>회사소개</li>
					<li>회사소개</li>
				</ul>
			</div>
		</div>

		<div class="main_naviwrap">
			<div class="main_nav">
				<ul class="right_ul">
					<li>모임</li>
					<li>게시판</li>
					<li>카페</li>
					<li>게임</li>
				</ul>
			</div>
		</div>
	</header>


</body>


</html>