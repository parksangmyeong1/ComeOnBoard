<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComeOnBoard</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/views/frame/header.jsp" %>
	
	
	<h1> 정말 삭제 하시겠습니까?</h1>
	<form method="post">
		<input type="hidden" name="memAuth" value ="${loginInfo.memAuth}">
		<input type="hidden" name="memAuth" value ="${gamepage.gameIdx}">

		<input type="submit" value="삭제">
		<input type="button" class="btn_edit" value="돌아가기" id="btn_delete"
			onclick="location.href='<c:url value ='/game/gamepage/'/>${gamepage.gameIdx}'">			
	</form>	
	
	
</body>
</html>