<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Come on, Board</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<!-- taglib 코어태그 선언 후 href 경로 설정(경로의 유연성) -->
<link rel="stylesheet" href="<c:url value="/css/groupList.css"/>">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>







<script>
	$(document).ready(function() {

		$("#aside1").click(function() {
			location.href = '<c:url value="/group/groupManagement?memIdx=${loginInfo.memIdx}"/>';
		});

		$('#aside2').click(function() {
			/* location.href = 'createGroup'; */
			location.href = '<c:url value="/group/createGroup"/>';
		})

	});
</script>





</head>


<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<div id="wrap">
		<div class="main_div">
			<section>
				<div class="container">
					<div id="tab-1" class="tab-content current">
						<table class="table">
							<colgroup>
								<col style="width: 100px">
								<col style="width: 100px">
								<col style="width: 300px">
								<col style="width: 140px">
								<col style="width: 160px">
								<col style="width: 120px">
								<col style="width: 120px">
							</colgroup>
							<thead>
								<tr>
									<th>지역</th>
									<th>장르</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>모집마감일</th>
									<th>진행일</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${pageListView.groupList}" var="list">
									<tr>
										<td>${list.loc}</td>
										<td>${list.genre}</td>
										<td><a href="<c:url value="/group/readGroup?grpIdx=${list.grpIdx}"/>">${list.grpTitle}</a></td>
										<td>${list.nickName}</td>
										<td><fmt:formatDate value="${list.grpPostDate}" type="both"/></td>
										<td><h4>${list.grpPostEndDate}</h4></td>
										<td><h4>${list.grpDate}</h4></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- page값 사용 하는 곳 -->
						<c:forEach begin="1" end="${pageListView.pageTotalCount}" var="num">
						<div class="wrap_list">
							<ul class="list_count">
								<li style="margin-right:10px;">
									<a href="<c:url value="groupList?page=${num}&searchCategory=${searchType.searchCategory}&keyword=${searchType.keyword}"/>">[${num}]</a>
								</li>
							</ul>
						</div>
						</c:forEach>

						<br>

						<form id="search_var">
								<select name="searchCategory" id="form_select_category">
									<option value="searchAll">전체</option>
									<option value="searchLoc">지역</option>
									<option value="searchGenre">장르</option>
									<option value="searchTitle">제목</option>
									<option value="searchNickname">닉네임</option>
								</select> 
								<input type="text" name="keyword" id="form_search">
								<button type="submit" id="form_button">검색</button>
						</form>
					</div>
				</div>
			</section>
			<aside id="aside1">
				<div class="no_overflow">
					<button class="button200px">
						<img src="<c:url value='/images/management_group.png'/>"
							width="200px" height="180px">
					</button>
					<%-- <input type="hidden" name="memIdx" value="${loginInfo.memIdx}"> --%>
					<a>모임 관리</a>
				</div>
			</aside>
			<aside id="aside2">
				<div class="no_overflow">
					<button class="button200px">
						<img src="<c:url value='/images/people.png'/>" width="200px"
							height="180px">
					</button>
					모임 등록
				</div>
			</aside>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>

</html>