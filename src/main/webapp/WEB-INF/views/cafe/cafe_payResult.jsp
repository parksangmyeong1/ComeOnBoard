<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Come On, Board : Cafe info</title> <!-- 문서 제목 -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
.font{
	font-family: 'Jeju Myeongjo', serif;
	color: black;
}
</style>

</head>

<c:if test="${payResult eq 'success'}">
<body>
	<div style="height: 100px "></div>
	<div style="text-align: center;">
		<table class="font" style="text-align: center; display: inline-block;">
			<tr>
				<td colspan="2"><h2>결제가 완료되었습니다.</h2><br></td>
			</tr>

			<tr>
				<td><h5>가맹점</h5></td>
				<td><h5>ComeOnBoard</h5></td>
			</tr>
			<tr>
				<td><h5>결제방법</h5></td>
				<td><h5>${info.payment_method_type}</h5></td>
			</tr>
			<tr>
				<td><h5>결제금액</h5></td>
				<td><h5>${info.amount.total}원</h5></td>
			</tr>
			<tr>
				<td><h5>결제일시</h5></td>
				<td><h5>${info.approved_at}</h5></td>
			</tr>
			<tr>
				<td><h5>결제내역</h5></td>
				<td><h5>${info.item_name}</h5></td>
			</tr>
			<tr>
				<td colspan="2"><h5><br>예약정보는 마이페이지에서 확인할 수 있습니다.</h5></td>
			</tr>
		
		</table>	
	</div>
	
</body>
</c:if>

<c:if test="${payResult eq 'fail' || empty payResult}">
	<script>
	alert('오류가 발생하여 처리에 실패했습니다.\n잠시 후 다시 시도해주세요.');
	window.close();
	</script>
</c:if>   

<c:if test="${payResult eq 'cancel'}">
	<script>
	alert('결제가 취소되었습니다.');
	window.close();
	</script>
</c:if>

</html>