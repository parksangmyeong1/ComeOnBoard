<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Come On, Board : My Reservation List</title> <!-- 문서 제목 -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<script>

$(document).ready(function(){
	
	my_reserv();
	
});

//예약 리스트 생성
function my_reserv(){
	
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;

	$.ajax({
		url: '<c:url value="/cafe/cafe_reserv_myList"/>',
		type: 'post',
		data: {memIdx: ${loginInfo.memIdx}},
		dataType: 'json',
		success: function(data){
			var asd =  data;
			var html = '';
			if(asd.length){
				html += '<div class="display_none" style="width:800px; text-align: center; line-height: 62px">';
				html += '<table class="table">';
				html += '<tr>';
				html += '<th>No</th>';
				html += '<th>결제시간</th>';
				html += '<th>카페이름</th>';
				html += '<th>예약날짜</th>';
				html += '<th>예약시간</th>';
				html += '<th>테이블</th>';
				html += '<th>가격</th>';
				html += '<th>예약취소</th>';
				html += '</tr>';
					$.each(asd, function(idx, list) {
						html += '<tr>';
						html += '<td>'+(idx+1)+'</td>';
						html += '<td>'+list.regDate+'</td>';
						html += '<td>'+list.cafeName+'</td>';
						html += '<td>'+list.reservDate+'</td>';
						html += '<td>'+list.reservTime+'시</td>';
						if(list.reservFourTable == 1){
							html += '<td>4인석</td>';
						}
						if(list.reservgrpTable == 1){
							html += '<td>8인석</td>';
						}
						html += '<td>'+list.stdFee+'원</td>';
						html += '<td>';
						//if(list.reservDate > dateString){
							html += '<button class="btn btn-outline-danger" onclick="pay_cancel('+list.reservIdx+', \''+list.stdFee+'\', \''+list.tid+'\')">예약취소</button>';
						//}
						html += '</td>';
						html += '</tr>';
					})
					html += '</table>';
					html += '</div>';
			}
			if(!data.length){
				html += '<h2>예약이 없습니다.<h2>';
			}
			$('#area_my_reservation').empty();
			$('#area_my_reservation').append(html);
		},
		error: function(request,status,error){
			console.log('실패');
		},
		complete : function(){	
		}
	})
}

function pay_cancel(reservIdx, stdFee, tid){
	console.log(reservIdx);
	console.log(stdFee);
	console.log(tid);
	if(confirm('예약을 취소하실 경우 복구할 수 없습니다.\n취소하시겠습니까?')){
		$.ajax({
			url: '<c:url value="/cafe/cafe_payCancel"/>',
			type: 'post',
			data: { 
				reservIdx: reservIdx,
				stdFee: stdFee,
				tid: tid
			},
			success: function(result){
				if(result = 1){
					my_reserv();
					alert('예약이 취소되었습니다.');
				} else {
					my_reserv();
					alert('오류가 발생하여 실패했습니다.\n잠시 후 다시 시도해주세요.');
				}
			},
			error: function(request,status,error){
				console.log(request);
				console.log(status);
				console.log(error);
			}
		})
	} else {
		alert('취소되었습니다.');
	}
}

</script>
<body>
<div id="area_my_reservation"></div>
</body>

</html>


