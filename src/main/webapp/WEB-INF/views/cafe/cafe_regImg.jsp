<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty loginInfo}">
<script>
function makeRedirect(){
	var redirectUri = window.location.href;
	sessionStorage.setItem("redirectUri", redirectUri);
	location.href= '<c:url value="/member/login"/>' ;
}
</script>
<script>
	alert('로그인 후 사용이 가능합니다.');

	makeRedirect();
</script>

</c:if> 

<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Come on, Board : Cafe Registry Img</title> <!-- 문서 제목 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="<c:url value="/css/cafe_regForm.css"/>" type="text/css">
	<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

</head>

<script>

$(document).ready(function(){
	
	
	
	
});


</script>


<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>

    <div class="cafe_wrap">   
        <div class="info"> 
        
        <h5 class="info_menu">카페 이미지 등록</h5>
        <hr class="first_hr">
             <form action="<c:url value='/cafe/cafe_regImg'/>" method="post" enctype="multipart/form-data" id="regCafeImg">
            	<input type="hidden" name="cafeIdx" value="${cafeIdx}">
            	<input type="hidden" name="memIdx" value="${loginInfo.memIdx}">

            	<input type="file" name="cafeThumbnailFile" id="cafeThumbnailFile" onchange="setThumbnail(event);"><br>
            	<br>
				
				<input type="file" multiple="multiple" name="cafeImgFile" id="cafeImgFile" onchange="setImg(event);"><br>
				<br>
 
			    <button type="button" id="btn_cafe_info_submit" class="btn btn-primary col text-center mb-2">등록</button>
            </form>
            
            <label for="cafeThumbnail">썸네일 미리보기</label>
				<div id="thumbnail" class="form-control mb-2" style="height: 160px">
				</div>
			<label for="cafeImg">이미지 미리보기</label>
				<div id="imgs" class="form-control mb-2" style="height: 160px">
            	</div>

            <hr>
        </div>  
    </div>

</body>

<script>
// 썸네일 미리보기
function setThumbnail(event){
	
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#thumbnail").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}
// 카페 이미지 미리보기
function setImg(event){
	for (var image of event.target.files){
		var reader = new FileReader();
		reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#imgs").appendChild(img);
	};
		console.log(image);
		reader.readAsDataURL(image);
	}
}

</script>

	
<script>

//정보 입력시 빈값 체크
$('#btn_cafe_info_submit').click(function(){
	
/* 	var cafeThumbnail = $('#cafeThumbnail').val();
	var cafeImg = $('#cafeImg').val();

	// 입력 확인
	if(!cafeThumbnail.size) {   
		alert('썸네일를 첨부해주세요.');
		return;
	}

	if(!cafeImg.size) {   
		alert('카페 사진을 첨부해주세요.');
		return;
	} */
	//폼 서밋
	$('#regCafeImg').submit();	
});


</script>


	

</html>