<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty loginInfo}">
	<script>
		alert('로그인하지 않았습니다.');
		history.back();
	</script>
</c:if> 

<c:if test="${loginInfo.memAuth ne 'cafe'}">
	<script>
		alert('카페 등록 권한이 없습니다.');
		history.back();
	</script>
</c:if> 

<c:if test="${checkCafe >= 1}">
	<script>
		alert('이미 등록하셨습니다.');
		history.back();
	</script>
</c:if> 

<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Come on, Board : Cafe Registry</title> <!-- 문서 제목 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="<c:url value="/css/cafe_regForm.css"/>" type="text/css">
	<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

</head>

<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>

    <div class="cafe_wrap">   
        <div class="info"> 
        
        <h5 class="info_menu">카페 정보 등록</h5>
        <hr class="first_hr">
			<!-- 이미지를 제외한 기본 정보 등록  enctype="multipart/form-data" -->
            <form method="post" id="cafeInfo">
            	<input type="hidden" name="memIdx" value="${loginInfo.memIdx}">
                <label for="cafeName">카페 이름</label>
                <input type="text" name="cafeName" class="form-control mb-2" id="cafeName" placeholder="카페 이름">

                <label for="cafeAddress">카페 주소</label>
                <input type="text" name="cafeAddress" class="form-control mb-2" id="cafeAddress" placeholder="카페 주소">

				<label for="cafeTime">영업시간</label>
                <input type="text" name="cafeTime" class="form-control mb-2" id="cafeTime" placeholder="00:00~00:00">
				
				<label for="stdFee">시간당 기본 요금</label>
                <input type="number" name="stdFee" class="form-control mb-2" id="stdFee" placeholder="시간당 기본 요금">
				
				<label for="tenPerFee">10분당 추가 요금</label>
                <input type="number" name="tenPerFee" class="form-control mb-2" id="tenPerFee" placeholder="10분당 추가 요금">
				
				<label for="fourTable">4인석 수</label>
                <input type="number" name="fourTable" class="form-control mb-2" id="fourTable" placeholder="4인석 수">
				
				<label for="grpTable">8인석 수</label>
                <input type="number" name="grpTable" class="form-control mb-2" id="grpTable" placeholder="8인석 수">
				
				<label for="cafeTel">카페 전화번호</label>
                <input type="text" name="cafeTel" class="form-control mb-2" id="cafeTel" pattern="^\d{3}-\d{3,4}-\d{4}$" placeholder="000-0000-0000" required>
				<!--                 
				<label for="cafeThumbnail">썸네일 미리보기</label>
				<input type="file" name="cafeThumbnail" id="cafeThumbnail">	
				<div id="thumbnail" class="form-control mb-2">
				</div>
				        				
 				<label for="cafeImg">이미지 미리보기</label>
				<input type="file" multiple="multiple" name="cafeImg" id="cafeImg">
				<div id="preview" class="form-control mb-2">
				</div>
 				-->
			    <button type="button" id="btn_cafe_info_submit" class="btn btn-primary col text-center mb-2">등록</button>
            </form>
            <hr>
        </div>  
    </div>

</body>

<script>

//정보 입력시 빈값 체크
$('#btn_cafe_info_submit').click(function(){
	
	var cafeName = $('#cafeName').val();
	var cafeAddress = $('#cafeAddress').val();
	var cafeTime = $('#cafeTime').val();
	var stdFee = $('#stdFee').val();
	var tenPerFee = $('#tenPerFee').val();
	var fourTable = $('#fourTable').val();
	var grpTable = $('#grpTable').val();
	var cafeTel = $('#cafeTel').val();
	
	var timePattren = /^\d{2}:\d{2}~\d{2}:\d{2}/;
	var telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
	
	// 입력 확인
	if(!cafeName.trim().length) {   
		alert('카페이름을 입력해주세요.');
		$('#cafeName').focus();
		return;
	}
	if(!cafeAddress.trim().length) { 
		alert('주소을 입력해주세요.');
		$('#cafeAddress').focus();
		return;
	}
	if(!cafeTime.trim().length) {  
		alert('운영시간을 입력해주세요.');
		$('#cafeTime').focus();
		return;
	}
	if(!timePattren.test(cafeTime.trim())){
		alert('형식에 맞게 입력해주세요. (00:00~00:00)');
		$('#cafeTime').focus();
		return;
	}
	if(!stdFee.trim().length) {  
		alert('이용요금을 입력해주세요.');
		$('#stdFee').focus();
		return;
	}
	if(!tenPerFee.trim().length) { 
		alert('추가요금을 입력해주세요.');
		$('#tenPerFee').focus();
		return;
	}
	if(!fourTable.trim().length) { 
		alert('보유하고 있는 4인석을 입력해주세요.');
		$('#fourTable').focus();
		return;
	}
	if(!grpTable.trim().length) { 
		alert('보유하고 있는 8인석을 입력해주세요.');
		$('#grpTable').focus();
		return;
	}
	if(!cafeTel.trim().length) {
		alert('전화번호을 입력해주세요.');
		$('#cafeTel').focus();
		return;
	}
	if(!telPattern.test(cafeTel.trim())){
		alert('형식에 맞게 입력해주세요. (000-0000-0000)');
		$('#cafeTel').focus();
		return;
	}
	// 폼 서밋
	$('#cafeInfo').submit();	
});


</script>

</html>