<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 보내기</title>
</head>
<body>
<form action="<c:url value='/msg'/>" method="post">
	<input type="hidden" value="12" name="sendIdx">
	<input type="text" placeholder="보내고 싶은 내용" name="msgContent">
	<input type="text" placeholder="원하는 사람의 번호"name="recIdx">
	<input type="submit">
</form>
	</body>
</html>