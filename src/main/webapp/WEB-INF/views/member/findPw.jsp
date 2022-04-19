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
        	let checkEmail = false;
        	let checkPassword = false;
        	// 이메일  체크 초기화
			$('#input_email').focusin(function() {
				$('#msg_email').removeClass('color_blue');
				$('#msg_email').removeClass('color_red');
				$('#msg_email').html('');
				$(this).val('');
			});
			
			// 이메일 인증번호 체크 초기화
			$('#input_certNum').focusin(function(){
				$('#msg_cert_number').html('');
				$('#msg_cert_number').removeClass('color_blue');
				$('#msg_cert_number').removeClass('color_red');
				$('#msg_emsg_cert_numbermail').html('');
				$(this).val('');
			})
			// 이메일 인증번호 체크 
			$('#btn_cert_number').on('click', function(){
				checkEmail = chkEmail();
			});
			
			$('#btn_find_pw').on('click', function(){
				console.log(checkEmail);
				if(!checkEmail){
					alert('이메일 인증을 먼저 진행해주세요.');
				} else {
					$.ajax({
						type: 'post',
						url: '<c:url value="/member/findPw"/>',
						data: { 
							memId : $('#memId').val(),
							memEmail : $('#input_email').val(),
							memName : $('#memName').val()
						},
						async: false,
						success: function(data){
							if(data>0){
								$('#container').hide();
								$('#wrap_area_find_pw').show();
							} else {
								alert('정보가 올바르지 않습니다. 다시 확인해주세요.');
							}
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
			
			// 비밀번호 체크 초기화
			$('#memPassword').focusin(function() {
				$('#msg_pw').addClass('color_grey');
				$('#msg_pw').removeClass('color_blue');
				$('#msg_pw').removeClass('color_red');
				$('#msg_pw').html(' 영문, 숫자, 특수문자 각 1회 이상, 8-16자리');
				$(this).val('');	
			});
			
			// 비밀번호 체크
			$('#memPassword').focusout(function(){
				var exptext = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
				var password = $('#memPassword').val();
				if(password.trim().length>0 && exptext.test(password)){
					$('#msg_pw').removeClass('display_none');
					$('#msg_pw').html('사용가능');
					$('#msg_pw').addClass('color_blue');
					$('#msg_pw').removeClass('color_grey');
				} else {
					$('#msg_pw').removeClass('display_none');
					$('#msg_pw').html('형식이 올바르지 않습니다. 다시 입력해주세요.');
					$('#msg_pw').addClass('color_red');
					$('#msg_pw').removeClass('color_grey');
				}
			});
			
			// 비밀번호 일치 초기화
			$('#memRePw').focusin(function() {
				$('#msg_repw').addClass('display_none');
				$('#msg_repw').removeClass('color_blue');
				$('#msg_repw').removeClass('color_red');
				$(this).val('');	
			});
			
			// 비밀번호 일치 체크
			$('#memRePw').focusout(function(){
				
				if ($('#memRePw').val().length>0 && $('#memRePw').val() == $('#memPassword').val()) {
					$('#msg_repw').removeClass('display_none');
					$('#msg_repw').html('비밀번호가 일치합니다.');
					$('#msg_repw').addClass('color_blue');
					$('#msg_repw').removeClass('color_grey');
					checkPassword = true;
				} else {
					$('#msg_repw').removeClass('display_none');
					$('#msg_repw').html('비밀번호가 일치하지 않습니다.');
					$('#msg_repw').addClass('color_red');
					$('#msg_repw').removeClass('color_grey');
					checkPassword = false;
				}
				
			});
			
			// 비밀번호 변경
			$('#btn_update_pw').on('click', function(){
				if(!checkPassword){
					alert('비밀번호 형식이 올바르지 않습니다. 다시 확인해주세요.');
				} else {
					$.ajax({
						type: 'put',
						url: '<c:url value="/member/password"/>',
						data: { 
							memId : $('#memId').val(),
							memPassword : $('#memPassword').val()
						},
						async: false,
						success: function(data){
							if(data>0){
								alert('비밀번호가 변경 되었습니다.');
								location.href ='<c:url value="/member/login"/>';
							} else {
								alert('비밀번호가 변경되지 않았습니다. 다른 비밀번호를 다시 입력해주세요.')
							}
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
    #wrap_area_find_pw {
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
        min-height: 70px;
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

    #btn_update_pw,
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

	#area_find_pw {
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
	
    .input_short {
       border: 1px solid #bbb;
       padding: 7px 35px 10px 11px;
       margin-bottom: 5px;
       width: 270px;
       height: 29px;
       background-color: #fff;
       font-size: 16px;
  	}
  	
    .btn_chk {
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
   
   #btn_cert_number {
   		background-color: rgb(251, 188, 5);
   		color : black;
   }
   
</style>
<body>
    <div class="wrap">
     	<div class="area_logo">
	        <a href="<c:url value='/'/>">
	        	<img src="<c:url value='/images/logo_full.png'/>">
	        </a>
	    </div>
        <div id="container">

            <h2> - 비밀번호  찾기 - </h2>
                <form id="form_find_id_by_email">
                        <div class="input_area">
                            <p>아이디</p>
                            <input type="text" id="memId" name="memName" class="input_row" placeholder="아이디" value="${findIdPwInfo.memId}">
                        </div>
                        
                        <div class="input_area">
                            <p>이름</p>
                            <input type="text" id="memName" name="memName" class="input_row" placeholder="이름" value="${findIdPwInfo.memName}">
                        </div>
        
                        <div class="input_area">
		                    <p>본인 확인 이메일</p>
		                    <input type="text" id="input_email" class="input_short" placeholder="ex) cob@cob.com" name="memEmail" value="${findIdPwInfo.memEmail}">
		                    <button type="button" id="btn_chk_email" class="btn_chk" onclick="sendEmail()">인증번호 받기</button>
		                    <span id="msg_email" class="msg"></span>
		                    <img id="email_loading" class="loadingimg display_none" alt="loading" src="<c:url value='/images/loading.gif'/>"><br>
		                    <input type="text" id="input_certNum" class="input_short" placeholder="인증번호 입력">
		                    <button type="button" id="btn_cert_number" class="btn_chk">인증번호 확인</button>
		                	<span id="msg_cert_number" class="msg"></span>
               			 </div>
                        
                        <button type = "button" id="btn_find_pw">비밀번호 변경하기</button>
                </form>
        </div>

        <div id="wrap_area_find_pw" style="display:none">
        	<div id="area_find_pw">
        		<h2>새로운 비밀번호 입력</h2>
        			<div class="input_area">
	                    <input type="password" id="memPassword" name="memPassword" class="input_row" placeholder="비밀번호" required>
	                	<span id="msg_pw" class="msg color_grey"> 영문, 숫자, 특수문자 각 1회 이상, 8-16자리</span>
	                </div>
	                <div class="input_area">
	                    <input type="password" id="memRePw" name="memRePw" class="input_row" placeholder="비밀번호 확인" required>
	                    <span id="msg_repw" class="msg color_grey display_none"></span>
	                </div>
        			<button id="btn_update_pw" type="button">비밀번호 변경하기</button>		
        	</div>
        </div>
    </div>
</body>
<script>
	function sendEmail(){
		let email = $('#input_email').val();
		let emailChk = isEmail(email);
		if(emailChk){
			
			$.ajax({
				type: "post",
				url: '<c:url value="/members/email"/>',
				data: { memEmail : email},
				beforeSend : function() {
					$('#msg_email').addClass('display_none');
					$('#email_loading').removeClass('display_none');
				},
				success: function(data){
					if(data>0){
						$('#email_loading').addClass('display_none');
						$('#msg_email').removeClass('display_none')
						$('#msg_email').html('인증번호가 전송 되었습니다. 인증번호를 입력해주세요.');
						$('#msg_email').addClass('color_blue');
					}
				},
				error : function(request, status, error) {
					alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		} else {
			$('#msg_email').html('형식에 맞지 않는 이메일입니다. 다시 입력해주세요.');
			$('#msg_email').addClass('color_red');
		}
	}
	
	function isEmail(email){
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		return regExp.test(email);
	}
	
	function chkEmail(){
		let inputCertNum = $('#input_certNum').val();
		var chk = false;
		$.ajax({
			type: 'post',
			url: '<c:url value="/members/chkemail"/>',
			data: { "inputCertNum" : inputCertNum},
			async: false,
			success: function(data){
				if(data){
					$('#msg_cert_number').removeClass('display_none');
					$('#msg_cert_number').html('인증번호가 일치합니다.');
					$('#msg_cert_number').addClass('color_blue');
					chk = true;
				} else {
					$('#msg_cert_number').removeClass('display_none');
					$('#msg_cert_number').html('인증번호가 일치하지 않습니다. 다시 확인해주세요.');
					$('#msg_cert_number').addClass('color_red');
				}
			}, 
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		return chk;
	}
	
</script>
</html>