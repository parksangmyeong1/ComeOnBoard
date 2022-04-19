<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board</title>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

</head>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function(){

            $('#btn_find_id').on('click', function(){
            	let memName = $('#memName').val();
            	let memEmail = $('#memEmail').val();
            	console.log(memName.length);
            	if(memName.length<1){
            		alert('이름을 입력해주세요.');
            	} else if(memEmail.length<1) {
            		alert('이메일을 입력해주세요.')
            	} else {
            		$.ajax({
       					url: '<c:url value="/member/findId"/>',
       					type : 'post',
       					data : {
       						"memName" : memName,
       						"memEmail" : memEmail
       					},
       					success : function(data) {
       						$('#loading_find_id').addClass('display_none');
       						if (data.length>0) {
       							$('#container').hide();
       							$('#wrap_area_find_id').show();
       							$('#area_resultCnt').html('총 '+data.length+'개의 아이디가 검색되었습니다.')
       							$('#hidden_name').val(memName);
       							$('#hidden_memEmail').val(memEmail);
       							$.each(data, function(index, item){
       								var html = '<div class="resultId"><input type="radio" name="memId" id="'+item+'" value="'+item+'">';
       								html += '<label for="'+item+'">'+item+'</label><br>';
       								html += '</div><hr>'
       								$('#area_id').append(html);
       							});
       						} else {
       							alert('입력하신 정보와 일치하는 아이디가 없습니다.');
       						}
       					},
       					beforeSend : function() {
       						$('#loading_find_id').removeClass('display_none');
       					},
       					error : function(request, status, error) {
       						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
       						console.log(request);
       						console.log(status);
       						console.log(error);
       					}
                	});	
            	}
           		
            });
        });
            
    </script>

<style>
    * {
        padding: 0;
        margin: 0;
    }
    fieldset {
        border: none;
    }
    legend {
        visibility: hidden;
    }
    .wrap {
        background-color :rgb(245, 246, 247);
    }
    .area_logo {
        display: block;
        width: 768px;
        margin: 0 auto;
        height: 44px;
        padding: 180px 0 60px;
    }

    .area_logo img {
        display: block;
        height: 60px;
        margin: 0 auto;
    }

    #container,
    #wrap_area_find_id {
        display: block;
        width: 768px;
        margin: 0 auto;
        min-height: 500px;
        padding-bottom: 50px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #777;
    }

    .input_area {
        margin: 0 auto;
        width: 460px;
        height: 70px;
        margin-bottom: 10px;
    }

    .input_row {
        border: 1px solid #bbb;
        padding: 7px 35px 10px 11px;
        margin-bottom: 10px;
        width: 412px;
        height: 29px;
        background-color: #fff;
        font-size: 16px;
    }

    .input_row:focus,
    .input_num:focus,
    .input_phoneNum:focus {
        outline: rgb(52, 168, 83) 1px solid;
    }

    #btn_find_id,
    #btn_find_pw {
        display: block;
        margin: 0 auto;
        color: white;
        background-color: rgb(52, 168, 83);
        width: 460px;
        height: 48px;
        font-size: 16px;
        border: none;
        margin-bottom: 10px;
        border-radius: 10px;
    }

    #login_chk {
        width: 15px;

    }
    #login_chk:hover, label:hover {
        cursor: pointer;
    }

    .nav_login {
        margin:0 auto;
        width: 460px;
    }

    .nav_login>ul{
        width: 393px;
        margin: 10px auto;
        list-style: none;
        overflow: hidden;
    }

    .nav_login>ul>li {
        text-align: center;
        width: 130px;
        float: left;
        border-right: 1px solid black;
        color: #777;
    }

    #last_li {
        border: none;
    }

    .input_num {
        border: 1px solid #bbb;
        padding: 7px 1px 10px 11px;
        margin-right: 5px;
        margin-bottom: 10px;
        width: 134px;
        height: 29px;
        background-color: #fff;
        font-size: 16px;
    }

    select {
        width: 460px;
        height: 48px;
        background-color: #fff;
        font-size: 16px;
        padding-left: 8px;
        color: #777;
        border: 1px solid #bbb;
    }

    .input_phoneNum,
    .input_address {
        border: 1px solid #bbb;
        padding: 7px 35px 10px 11px;
        margin-bottom: 5px;
        width: 270px;
        height: 29px;
        background-color: #fff;
        font-size: 16px;
    }

    .input_phoneNum+button,
    .input_address+button {
        float: right;
        display: block;
        height: 48px;
        width: 135px;
        color: white;
        border: none;
        border-radius: 5px;
        background-color: rgb(66, 133, 244);
        font-size: 14px;
    }
    #phoneNum_input {
        height: 120px;
    }

    #input_profile {
        display: none;
    }

    #profile_button {
        display: block;
        margin: 0 auto;
        background-color: rgb(251,188,5);
        width: 460px;
        height: 48px;
        font-size: 16px;
        border: none;
        margin-bottom: 10px;
        border-radius: 10px;
        text-align: center;
        line-height: 48px
       };

    #profile_button:hover {
        cursor: pointer;
    }

    #address_area {
        height: 200px;
    }

    .display_none {
        display: none;
    }

    .color_red {
        color: red;
    }

    .form_find{
        display: none;
    }

    .on {
        display: block;
    }
        
    ul.tabs {
        margin: 0 auto;
        list-style: none;
        line-height: 40px;
        height: 40px;
        width: 470px;
    }
    li.current {
        border-radius: 10px;
        background-color: rgb(52, 168, 83);
        color: white;
    }

    ul.tabs li{
        text-align: center;
        display: inline-block;
        width: 49%;
        height: 40px;
    }

	#area_find_id {
		margin: 0 auto;
		width: 460px;
	}
	
	#area_id {
		background-color: #fff;
		border-radius: 10px;
	}
	
	.resultId {
		padding : 15px;
		height: 20px;
		font-size: 20px;
		font-weight: 400;
	}
	
	.resultId input {
		margin: 0 10px;
	}
	
   	.loadingimg {
   		width: 30px;
    }
</style>
<body>
    <div class="wrap">
     	<div class="area_logo">
	        <a href="<c:url value='/'/>">
	        	<img src="/cob/images/logo_full.png">
	        </a>
	    </div>
        <div id="container">

            <h2> - 아이디 찾기 - </h2>

            <div class="input_area">
                <p>이름</p>
                <input type="text" id="memName" name="memName" class="input_row" placeholder="이름">
            </div>

            <div class="input_area">
                <p>이메일 주소</p>
                <input type="text" id="memEmail" name="memEmail" class="input_row" placeholder="메일 주소 입력">
            	<img id="loading_find_id" class="loadingimg display_none" alt="loading" src="<c:url value='/images/loading.gif'/>">
            </div>   
            <button type = "button" id="btn_find_id">아이디 찾기</button>

        </div>
        <div id="wrap_area_find_id" style="display:none">
        	<div id="area_find_id">
        		<form action="<c:url value='/member/findPw'/>" method="post">
        		<h2>가입한 아이디 정보</h2>
        			<div id="area_resultCnt"></div>
        			<div id="area_id"></div>
        			<input type="hidden" id="hidden_name" name="memName">
        			<input type="hidden" id="hidden_memEmail" name="memEmail">
        			<button id="btn_find_pw">선택한 아이디의 비밀번호 찾기</button>
        		</form>   		
        	</div>
        </div>
    </div>
</body>
</html>