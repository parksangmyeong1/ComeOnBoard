<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:if test="${empty loginChk}">
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
</c:if> --%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Text Editor</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
	integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
	crossorigin="anonymous" />

<link rel="stylesheet" href="<c:url value="/css/createGroup.css"/>">

<!-- 스타일시트 여러개 선언 가능!!! 우선순위: 아래>위 -->


<!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

</head>


<body>
	<!-- form action의 경로를 해당 컨트롤러의 매핑 주소로 한다 -->
	<!-- 해당 컨트롤러에서 'return 페이지'를 해주던가 redirect를 해주어서 게시글 리스트를 보여주면 된다 -->
	<%-- <form action="<c:url value="/cob/group/createGroup" />" method="post"> --%>
	<form method="post">
		<div class="Wrapper">
			<div id="content">
				<div class="WritingWrap">
					<div class="WritingHeader">
						<!-- 인풋 타입 히든으로 정보만 넘겨주고  표시x -->
						<input type="hidden" name="memIdx" value="${loginInfo.memIdx}">
						<input type="hidden" name="nickName" value="${loginInfo.nickName}">
						<h2 class="title">모임 등록</h2>
						<input type="submit" value="등록" class="upload_contents">
					</div>
					<div class="articlecate">
						<!-- 지역추가 함 -->
						<select name="loc" id="loc" style="width: 100px; height: 30px">
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="용산구">용산구</option>
							<option value="성동구">성동구</option>
							<option value="광진구">광진구</option>
							<option value="동대문구">동대문구</option>
							<option value="중랑구">중랑구</option>
							<option value="성북구">성북구</option>
							<option value="강북구">강북구</option>
							<option value="도봉구">도봉구</option>
							<option value="노원구">노원구</option>
							<option value="은평구">은평구</option>
							<option value="서대문구">서대문구</option>
							<option value="마포구">마포구</option>
							<option value="양천구">양천구</option>
							<option value="강서구">강서구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="영등포구">영등포구</option>
							<option value="동작구">동작구</option>
							<option value="관악구">관악구</option>
							<option value="서초구">서초구</option>
							<option value="강남구">강남구</option>
							<option value="송파구">송파구</option>
							<option value="강동구">강동구</option>
						</select>
						<!-- 게임 종류 -->
						<select name="genre" id="genre" style="width: 100px; height: 30px">
							<option value="전략">전략</option>
							<option value="추상">추상</option>
							<option value="컬렉터블">컬렉터블</option>
							<option value="가족">가족</option>
							<option value="어린이">어린이</option>
							<option value="파티">파티</option>
							<option value="테마">테마</option>
							<option value="워게임">워게임</option>
						</select>
						<!-- 모임 현재인원, 최대 정원 -->
						<div class="block_count">
							<label for="max_count" id="label_count">모임 최대인원</label> <select
								name="grpMaxMem" id="label_count"
								style="width: 100px; height: 30px">
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
							</select>
						</div>
						
						<div id="date">
							<label for="grpPostEndDate" class="dateBox1">모집 마감일&nbsp;</label>
							<input type="date" id="grpPostEndDate" name="grpPostEndDate" class="dateBox1"> 
							<input type="datetime-local" id="grpDate" name="grpDate" class="dateBox2"> 
							<label for="grpDate" class="dateBox2">모임 진행일 &nbsp;</label>
						</div>
						<hr style="margin-top: 30px; margin-bottom: 20px;">
					</div>
					<div class="articletitle">
						<textarea placeholder="제목을 입력해 주세요." class="textarea_input"
							name="grpTitle"></textarea>
					</div>
					<div class="write_contents">
						<br> 
						<label for="w3review">내용</label>
						<textarea id="text_content" name="grpContent" rows="30" cols="100" wrap="hard"></textarea>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>



</html>