<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>edit_group</title>
<link rel="stylesheet" href="<c:url value="/css/groupEditor.css"/>">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<!-- 	<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->


<!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

<script>
	function alert_edit() {
		alert("수정되었습니다.");
	}
	
	// 매개변수 != 값
	// 매개변수는 내가 임의로 정해주는 말 그대로 (변하는 수)
	// 함수 외부에서는 '값'을 전달해주는게 맞음
	function sendAjax(midx, gidx) {
		$.ajax({
			url: '<c:url value="/group/groupEditorAjax"/>',
			type:'get',
			data: { memIdx : midx, 
					grpIdx : gidx },
			success: function(data) {
				window.location.href = '<c:url value="groupEditorMyGroup?grpIdx=${groupEditorReadMyGroupResult.grpIdx}"/>';
			},
			error: function(data) {
				alert('데이터 전송이 실패 하였습니다');
			}
		}) 
	}
	function sendAjaxToDelete(idx1, idx2) {
		$.ajax({
			url: '<c:url value="/group/groupEditorAjaxDelete"/>',
			type:'get',
			data: { memIdx : idx1, 
					grpIdx : idx2 },
			success: function(data) {
				window.location.href = '<c:url value="groupEditorMyGroup?grpIdx=${groupEditorReadMyGroupResult.grpIdx}"/>';
			},
			error: function(data) {
				alert('데이터 전송이 실패 하였습니다');
			}
		}) 
	}
	function sendAjaxToDelete2(a, b) {
		$.ajax({
			url:'<c:url value="/group/groupEditorAjaxDelete2"/>',
			type:'get',
			data: {
				memIdx : a,
				grpIdx : b
			},
			success:function(data) {
				window.location.href = '<c:url value="groupEditorMyGroup?grpIdx=${groupEditorReadMyGroupResult.grpIdx}"/>';
			},
			error: function(data) {
				alert('데이터 전송이 실패하였습니다.');
			}
		})
	}
	
	
	
</script>

</head>

<!-- form post로 보낼때에는 input type="hidden" 형식으로 -->

<body>
	<div id="wrap">
		<div class="main_div">
			<form action="/cob/group/updateGroupOnlyTitleAndContent"
				method="post">
				<div id="div1" class="div">
					<input type="hidden" name="grpIdx"
						value="${groupEditorReadMyGroupResult.grpIdx}"> <input
						type="hidden" name="memIdx" value="${loginInfo.memIdx}">
					<!-- 제목 -->
					<div class="form-group">
						<label for="formGroupExampleInput">제목</label> <input type="text"
							class="form-control" id="formGroupExampleInput" name="grpTitle"
							value="${groupEditorReadMyGroupResult.grpTitle}">
					</div>
					<!-- 내용 -->
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							name="grpContent" rows="3"><c:out value="${groupEditorReadMyGroupResult.grpContent}"/></textarea>
					</div>
					<!-- 파일선택 -->
					<!-- <div class="form-group">
						<input type="file" class="form-control-file"
							id="exampleFormControlFile1">
					</div> -->
					<!-- 확인 -->
					<button type="submit" class="btn btn-primary" id="confirm"
						onclick="alert_edit()">수정</button>
				</div>
			</form>

			<!-- <form> -->
			<div id="div2" class="div" style="overflow: scroll">
				<h4>모임 참가 희망자</h4>
				<hr>
				<!-- 참가 희망자 리스트 -->
				<%-- <c:forEach items="groupEditorReadResult" var="list"> --%>
				<c:forEach items="${ajaxConfirmZeroList}" var="list"
					varStatus="status">
					<ul>
						<li>
							<div id="participant_list">
								<!-- 닉네임 들어갈 자리 -->
								${ajaxConfirmZeroList[status.index].nickName}
								<button class="btn btn-danger btn-sm" type="submit" id="decline"
									onclick="sendAjaxToDelete(${ajaxConfirmZeroList[status.index].memIdx}, ${ajaxConfirmZeroList[status.index].grpIdx})">거절</button>
								<button class="btn btn-success btn-sm" type="submit" id="accept"
									onclick="sendAjax(${ajaxConfirmZeroList[status.index].memIdx}, ${ajaxConfirmZeroList[status.index].grpIdx})">수락</button>
								<!-- sendAjax(memIdx, grpIdx) -->
							</div>
						</li>
					</ul>
				</c:forEach>
				<!-- 참가 희망자 리스트 끝! -->
			</div>
			<!-- </form> -->
		</div>
		<div class="main_div">
			<div id="div3" class="div">
				<!-- 참가 인원 카운트 -->
				<h4 id="count_participant">참여 인원(작성자포함): ${countMem}명&nbsp;/&nbsp;${countMaxMem}명</h4>
				<hr>
				<c:forEach items="${ajaxConfirmOneList}" var="list" varStatus="status">
					<ul>
						<li>
							<div id="participant_list_accepted">
								<!-- 닉네임 들어갈 자리 -->
								
								${ajaxConfirmOneList[status.index].nickName}
								<button class="btn btn-danger btn-sm" type="submit" id="decline"
									onclick="sendAjaxToDelete2(${ajaxConfirmOneList[status.index].memIdx},${ajaxConfirmOneList[status.index].grpIdx})">추방</button>
							</div>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

</html>