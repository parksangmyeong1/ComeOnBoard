<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<link rel="stylesheet" href="<c:url value="/css/readCreateGroup.css"/>">
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

<!-- 스타일시트 여러개 선언 가능!!! 우선순위: 아래>위 -->
<!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/header.jsp"%>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

</head>


<body>
	<input type="hidden" name="memIdx" value="${loginInfo.memIdx}">
	<div class="Wrapper">
		<div id="content">
			<div class="WritingWrap">
				<div class="articletitle">
					<hr>
					<div style="width: 200px" class="title_inside_div">
						<h3>위치: ${readCreateGroupPage.loc}</h3>
						<h3>장르: ${readCreateGroupPage.genre}</h3>
						<h3>인원:
							${readCreateGroupPageCountRegMem}/${readCreateGroupPage.grpMaxMem}</h3>
					</div>
					<div style="width: 500px" class="title_inside_div"
						id="date_information">
						<h3>모임 시작: ${readCreateGroupPage.grpDate}</h3>
						<h3>모집 마감: ${readCreateGroupPage.grpPostEndDate}</h3>
						<h3>작성자: ${readCreateGroupPage.nickName}</h3>
					</div>
				</div>
				<hr>
				<div id="attend_div">
					<!-- <a id="join_group" onclick="attend_gameGroup()"> -->
					<a onclick="chkComplete()" id="join_group" href="/cob/group/groupEditor?grpIdx=${readCreateGroupPage.grpIdx}&memIdx=${loginInfo.memIdx}">
						<!-- groupEditor컨트롤러에서 return 값을 management를 보여주게끔 변경? 참가 확정도 아닌데 보여주는게 괜찮을까? -->
						<!-- 확인은 참가가 확정되었을 때 management페이지에서 보여주고, 일단은 groupList페이지로 보내자 -->
						모임 참가 신청
					</a>
				</div>
				<div>
					<hr>
					<div id="grpTitle">${readCreateGroupPage.grpTitle}</div>
					<hr>
					<div id="grpContent"><pre><c:out value="${readCreateGroupPage.grpContent}"/></pre></div>
					<div id="edit">
						<a href="updateGroup?grpIdx=${readCreateGroupPage.grpIdx}"
							style="color: rgb(66, 133, 244);">수정하기</a>&nbsp;&nbsp; <a
							onclick="confirm_delete_group_board()"
							style="color: rgb(66, 133, 244); cursor:pointer;">삭제하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>

/* 	function loginTest() {
		if( '${loginInfo.memIdx}' == '') {
			alert('로그인이 필요합니다');
			location.href = '<c:url value="member/login"/>';
		}
	} */


	$(document).ready(function () {
	
		var memIdx = ${loginInfo.memIdx};
		var memIdxOnJsp = ${readCreateGroupPage.memIdx};

		// 모임 참가 신청버튼 보이기/숨기기(참가완료가 되어있다면)
		if ((memIdx != "null") && (memIdx == memIdxOnJsp)) {
			$("#join_group").hide();
		} else if ((memIdx != "null") && (memIdx != memIdxOnJsp)) {
			$("#edit").hide();
		} else if (memIdx.length == 0) {
			console.log(memIdx);
			$("#join_group").hide();
			$("#edit").hide();
		}
		<c:if test="${!empty showApplying}">
			$("#join_group").hide();
		</c:if>
		
		
	})

		
	
	function confirm_delete_group_board() {
		if (confirm("모임 게시글을 삭제하시겠습니까?") == true) {
			alert('삭제되었습니다');
			location.href = '<c:url value="deleteGroupBoard?grpIdx=${readCreateGroupPage.grpIdx}"/>'
		} else {
			return;
		}

	}
	
	function chkComplete(){
		alert('모임 참가 신청이 완료되었습니다.');
	}
	 
</script>



</html>




