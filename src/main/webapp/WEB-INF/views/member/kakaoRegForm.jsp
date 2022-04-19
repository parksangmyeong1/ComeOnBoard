<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board: 회원가입</title>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
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
	
	    #container {
	        display: block;
	        width: 768px;
	        margin: 0 auto;
	        min-height: 700px;
	        padding-bottom: 50px;
	    }
	    #form_create_id {
	        width: 462px;
	        margin: 0 auto;
	    }
	
	    #form_create_id h2 {
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
	
	    .btn_reg {
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
	
	    #input_memberphoto {
	        display: none;
	    }
	
	    #btn_photo {
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
	        line-height: 48px;
	       }
	
	    #btn_photo:hover {
	        cursor: pointer;
	    }
	
	    #address_area {
	        height: 200px;
	    }
	    span.required {
	    	color : rgb(234,67,53);
	    }
	    

	    .msg {
	    	font-size:13px;
	    }
	   
	    
	    .loadingimg {
	    	width: 30px;
	    }
	    
	    #msg_nickName {
	    	display: block;
	    	height: 25px;
	    }
	    
	    #btn_cert_number {
	    	background-color: rgb(52,168,83);
	    }
	</style>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>0
	<script>
		$(document).ready(function() {
			$('.genderSelect').val('${memGender}').attr("selected", "selected");
			// 가입 전 데이터 확인
			let checkId = true;
			let checkPassword = true;
			let checkNickName = false;
			let checkEmail = true;
			
			// 닉네임 중복체크 초기화
			$('#nickName').focusin(function() {
				$('#msg_nickName').addClass('color_grey');
				$('#msg_nickName').removeClass('color_blue');
				$('#msg_nickName').removeClass('color_red');
				$('#msg_nickName').html('한글, 영어, 숫자 조합 2-8자리');
				$(this).val('');
			});
			
			// 닉네임 중복 체크 
			$('#nickName').focusout(function() {
				$.ajax({
					url : '<c:url value="/member/nickNameCheck"/>',
					type : 'post',
					data : {
						nickName : $(this).val()
					},
					beforeSend : function() {
						$('#msg_nickName').addClass('display_none');
						$('#nickName_loading').removeClass('display_none');
					},
					success : function(data) {
						// data : Y(사용 가능) / R(정규식 맞지 않을때) / N(중복 아이디)
						if (data == 'Y') {
							$('#msg_nickName').removeClass('display_none');
							$('#msg_nickName').html('사용가능');
							$('#msg_nickName').addClass('color_blue');
							$('#msg_nickName').removeClass('color_grey');
							checkNickName = true;
						} else if(data == 'R'){
							$('#msg_nickName').removeClass('display_none');
							$('#msg_nickName').html('닉네임 형식과 일치하지 않습니다. 다시 입력해주세요.');
							$('#msg_nickName').addClass('color_red');
							$('#msg_nickName').removeClass('color_grey');
						} else {
							$('#msg_nickName').removeClass('display_none');
							$('#msg_nickName').html('중복된 닉네임입니다. 다시 입력해주세요.');
							$('#msg_nickName').addClass('color_red');
							$('#msg_nickName').removeClass('color_grey');
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					},
					complete : function() {
						$('#nickName_loading').addClass('display_none');
					}
				});
			});
			
			
			// 우편번호 찾기 
			$('#btn_address').click(function(){
			  new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			        	
			    	    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			    	    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			    	    var addr = ''; // 주소 변수
			    	    var extraAddr = ''; // 참고항목 변수
			    	
			    	    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			    	    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			    	        addr = data.roadAddress;
			    	    } else { // 사용자가 지번 주소를 선택했을 경우(J)
			    	        addr = data.jibunAddress;
			    	    }
			    	
			    	    // 우편번호와 주소 정보를 해당 필드에 넣는다.
			    	    $('#postCode').val(data.zonecode);
			    	    $('#addr').val(addr);
			    	    // 선호 지역을 입력한다.
			    	   	var preferAddrArray = (addr).split(' ');
			    
			    	    $('#preferAddr').val(preferAddrArray[0]+' '+preferAddrArray[1]);

			        }
			    }).open();

				return false;
			});
			
			$('#btn_regMember').on('click', function(){
				alert
				if(checkId){
					if(checkPassword){
						if(checkNickName){
							if(checkEmail){ // 모든 확인 완료시 submit
								$('#form_create_id').submit();
							} else{ // 이메일 확인
								alert('이메일을 확인해주세요.');
							}
						} else { // 닉네임 확인
							alert('닉네임을 확인해주세요.');
						}
					} else { // 비밀번호 확인
						alert('비밀번호를 확인해주세요.');
					}
				} else { // 아이디 확인
					alert('아이디를 먼저 확인해주세요.');
				}
			});
		});
</script>  

</head>

<body>
	
    <div class="area_logo">
        <a href="<c:url value='/'/>">
        	<img src="/cob/images/logo_full.png">
        </a>
    </div>

    <div id="container">
 
        <form id="form_create_id" method="post" enctype="multipart/form-data" action="<c:url value='/member/memberReg'/>">
            <input id="memId" name="memId" type="hidden" class="input_row" placeholder="아이디 " value="${memId}"required>
            <fieldset>
                <legend>회원 정보</legend>
                <div class="input_area">
                    <p>이름<span class="required"> *</span></p>
                    <input type="text" class="input_row" placeholder="이름" name="memName" required>
                </div>
                
                <div class="input_area">
                    <p>닉네임<span class="required"> *</span></p>
                    <input type="text" id="nickName" name="nickName" class="input_row" placeholder="닉네임" required>
                    <span id="msg_nickName" class="msg color_grey"> 한글, 영어, 숫자 조합 2-8자리</span>
                	<img id="nickName_loading" class="loadingimg display_none" alt="loading" src="<c:url value='/images/loading.gif'/>">
                </div>

                <div class="input_area">
                    <p>생년월일<span class="required"> *</span></p>
                    <input class="input_num" type="number" placeholder="년" name="year" size="4" min="1970" required><input class="input_num" type="number" placeholder="월" name="month" min="1" max="12" required><input class="input_num" type="number" placeholder="일" name="day" min="1" max="31" required>
                </div>

                <div class="input_area">
                    <p>성별</p>
                    <select class="genderSelect" name="memGender">
                    	<option disabled selected hidden>성별 선택</option>
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                    </select>
                </div>

                <div class="input_area">
                    <p>본인 확인 이메일<span class="required"> *</span></p>
                    <input type="text" id="input_email"class="input_row" name="memEmail" value="${memEmail}" readonly>
                </div>

                <div class="input_area">
                    <p>휴대전화<span class="required"> *</span></p>
                    <input type="text" class="input_row" placeholder="전화번호 입력" name="memTel" pattern="^\d{3}-\d{3,4}-\d{4}$" required>
                </div>

                <div class="input_area">
                    <p>프로필 사진</p>
                        <label id="btn_photo" for="input_memberphoto">파일 업로드</label>
                        <input type="file" id="input_memberphoto" name="memPhoto">

                </div>

                <div id="address_area" class="input_area">
                  <p>선호 지역(주소 선택시 구까지 자동 입력)</p>
                  <input type="text" id="postCode" name="postCode" class="input_short" placeholder="우편 번호" readonly>
                  <button id="btn_address" type="button" class="btn_chk">우편 번호</button>
                  <input type="text" id="addr" name="addr" class="input_row" placeholder="주소" readonly>
                  <input type="text" id="preferAddr" name="preferAddr" class="input_row" placeholder="선호 지역" readonly>
                </div>
                
                <button type="button" id="btn_regMember" class="btn_reg">가입하기</button>
            </fieldset>
        </form>   
    </div>
</body>

</html>