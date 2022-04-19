<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty loginChk}">
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
    <!-- 파일 미리보기 -->

<script>



$(document).ready(function(){

	file();

});


function file(){
	$.ajax({
		url: '<c:url value="/cafe/fileDel"/>',
		type: 'post',
		data: {
			cafeIdx : 1,
			memIdx : 100
		},
		dataType: 'json',
		success: function(imgData){
			//alert('성공');
			console.log(imgData);
			var list = imgData;
			var html = '';

			if(list.length != 0){
				$.each(list, function(idx, cafe){
					var cafeImgIdx = cafe.cafeImgIdx;
					var cafeIdx = cafe.cafeIdx;
					var cafeName = cafe.cafeName;
					var cafeImg = cafe.cafeImg;
						
					var path = cafe.cafeIdx+'.'+cafe.cafeName+'/'+cafe.cafeImg;
					
					html += '<li file='+cafe.cafeImg+'>'+'\n'+
							'<img class=img-thumb src="<c:url value="/uploadfile/cafe/"/>'+path+'"/>'+'\n'+
							'<button class="delete-btn btn btn-danger" onclick="delimg('+cafeImgIdx+', '+cafeIdx+', \''+cafeName+'\', \''+cafeImg+'\');">X</button>'+'\n'+
							'</li>';
				})
				$('.uploaded_files').empty();
				$('.uploaded_files').append(html);
			}
			if(list.length == 0){
				$('.uploaded_files').empty();
			}
		},
		error: function(e){
			alert('실패');
			console.log(e);
		},
		complete : function(){	
		}
	});
}

</script> 






<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>

    <div class="cafe_wrap">   
        <div class="info"> 
        
        <h5 class="info_menu">카페 정보 등록</h5>
        <hr class="first_hr">

            <form method="post" enctype="multipart/form-data">
                <label for="exampleFormControlInput9">이미지 업로드</label>
				<input type="file" name="cafeImg" multiple="multiple" class="user_picked_files mb-2" />
                <input type="submit" class="btn btn-primary col text-center mb-2" value="등록" />
            </form>
            <div class ="form-group">
                <br>
                <label for="exampleFormControlInput10 text-muted">이미지 미리보기</label>
                <div class="thumnail form-control mb-2">
                	<ul class="uploaded_files"></ul>
                </div>
            </div>
            <button class="btn btn-secondary col text-center" value="취소" /></button>
            <hr>
        </div>  
    </div>
    



</body>


<script>
function delimg(cafeImgIdx, cafeIdx, cafeName, cafeImg){
	console.log('delimg 함수 실행');
	console.log(cafeName);
 		$.ajax({
		url: '<c:url value="/cafe/fileDel1"/>',
		type: 'post',
		data: {
			cafeImgIdx: cafeImgIdx,
			cafeIdx: cafeIdx,
			cafeName: cafeName,
			cafeImg: cafeImg
		},
		success: function(result){
			if(result == '1'){
				alert('이미지를 삭제했습니다.');
				file();
			} else {
				alert('오류가 발생하여 삭제되지 않았습니다. 잠시 후 다시 시도해주세요.');
			}
		},
		error: function(e){
			alert('실패');
			console.log(e);
		},
		complete : function(){	
		}
	});
}	
</script>

</html>

