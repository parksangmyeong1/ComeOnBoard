<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ComeOnBoard</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<style>

	* {
        margin: 0;
        padding: 0;
    }

    ul {
        list-style: none;
    }

    .main_body{
        background-color: #f7f7f7;
    }

	.background{
        margin: 20px auto;
        background-color:#f7f7f7;
        width: 950px;
        min-height: 700px;
        max-width: 980px;
        overflow: hidden;
        height: auto;
        border: 1px solid rgb(251, 188, 006);
    }

    .title{
        margin-left: 30px;
        padding-top: 30px;
        
    }

    .background>hr{
        margin-top: 5px;
        width: 150px;
        margin-left: 20px;
        border: 1px solid rgb(251, 188, 006);
       
    }

    .background>.order_wrap{
        margin: 20px auto;
        width: 880px;
        padding-top: 30px;
        height: 600px;
        
    }
    
    .area_game_photo{
        width: 245px;
        float: right;
        margin-right : 95px;
        
    }
    .area_game_photo>h3{
        width: 200px;
        float: right;
        margin-bottom: 10px;
       text-align : center;
    }

    .game_img{
        float: right;
        background-color: #f7f7f7;
        width: 250px;
        height: 250px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 2px solid white;
    }

    .game_img>img{
        width: 100%;
        height: 100%;
    }

    .area_game_order{
        text-align: center;
        height: 230px;
        width: 500px;
        margin-top : 20px;
    }
    .order_item{
        float: left;
        width: 190px;
        height: 60px;
        text-align: right;
        padding-right: 10px;
        padding-top: 16px;
        font-size: 20px;
        font-weight: bold;
    }
    .order_text{
        float: left;
        width: 300px;
        height: 80px;
        
    }
    .order_text>input{
        font-size: 20px;
        width: 280px;
        height: 50px;
        border: 3px solid white;
        box-shadow: 1px 1px 3px 1px #dadce0;
    	background-color: #f7f7f7; 
    }
    
    .order_text>select{
     	font-size: 20px;
        width: 280px;
        height: 50px;
        border: 3px solid white;
        box-shadow: 1px 1px 3px 1px #dadce0;
      	background-color: #f7f7f7; 
      	text-align: center;
    }

    .order_customer{
        text-align: center;
        height: 270px;
        width: 800px; 
    }

    .order_customer>ul{
        clear: both;
        margin-bottom: 20px;
    }
   
    .order_customer>ul>.order_address{
        float: left;
        width: 190px !important ;
        height: 62px;
        text-align: right;
        padding-right: 10px;
        font-size: 20px;
        font-weight: bold;
        margin-right: 10px;
        display:block;
        padding-top:10px;
    }
    
    .order_address_text{
    	width : 500px;
        height: 200px;
      	float:left;
        display:inline-block;
    }

    .order_customer>ul>li>input{
        display: block;
        border: 3px solid white;
        background-color: #f7f7f7; 
        box-shadow: 1px 1px 3px 1px #dadce0;
        resize: none;
        float: left;
      
    }   
    
    .btn_order_pay{
        width: 105px;
        height: 55px;
        margin: 0px auto;

    }
    .btn_order_pay>button{
        
        background-color: #f7f7f7 ;
        width:100px !important ; 
        height:40px !important ;
        text-decoration: none;
        border-radius: 10px;
        font-size: 24px;
        color: #000;   
        box-shadow: 1px 1px 3px 1px #dadce0;
    }

    .btn_order_pay>button:hover{ 
        background-color: rgb(251, 188, 006); 
        cursor: pointer;
    }

    a:hover{
        cursor: pointer;
    }

   
    a{
        text-decoration: none;
        color: black;
    }
	
	.hidden{
		display : none;
	}

	#order_address{
		width : 300px;
		height : 50px;
		font-size: 18px;
		clear:both;
		
	}
	#btn_address{
		width : 100px;
		margin-left:5px;
		height : 50px;
		margin-top:5px;
		
		font-size:14px;
		border: 1px solid #aaa;
		border-radius: 10px;
	}
	#btn_address:hover{
		cursor: pointer;
		background-color:rgb(251, 188, 006); 
	}	
	
	#order_postcode{
		width : 100px;
		height : 44px;
		margin-top:5px;
		font-size:18px;
		clear:both;
	}
	#order_detailAddress{
		width : 200px;
		margin-left:5px;
		height : 44px;
		margin-top:5px;
		font-size:18px;
		
	}
	#order_extraAddress{
		width : 100px;
		margin-left:5px;
		height : 44px;
		margin-top:5px;
		font-size:18px;
		float:left;
	}
	

</style>
<script >
</script>

<!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function btn_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("order_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("order_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('order_postcode').value = data.zonecode;
                document.getElementById("order_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("order_detailAddress").focus();
            }
        }).open();
    }
</script>
<body class="main_body">

    <%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<%@ include file="/WEB-INF/views/gameFrame/searchbar.jsp"%>


	<div class="background">


		<div class="title">
			<h2>게임 주문</h2>
		</div>
		<hr>
		<form method="post"  
		accept-charset="UTF-8" class="form_game_reg" id="order_form"> 
			<div class="order_wrap">

				<span class="area_game_photo">

					<img src="<c:url value="/uploadfile/uploadgamefile"/>/${gamepage.gamePhoto}" class="game_img" alt="사진" id="image_container"/>

				</span>

				<div class="area_game_order">
					<ul>
						<li class="order_item">게임명</li>
						<li class="order_text">
						<input type="text" id="gameName" value="${gamepage.gameName}" readonly>
						</li>
					</ul>

					<ul>
						<li class="order_item">게임가격</li>
						<li class="order_text"><input type="text" name="gamePrice" id="gamePrice" value="${gamepage.gamePrice}" readonly></li>
					</ul>
					<ul>
						<li class="order_item">이름</li>
						<li class="order_text"><input type="text" name="memName" id="memName" ></li>
					</ul>
					<ul>
						<li class="order_item">핸드폰 번호</li>
						<li class="order_text"><input type="text" name="phoneNum" id="phoneNum" ></li>
					</ul>							
				</div>

				<div class="order_customer">
					<ul>
						<li class="order_address">주소</li>
						
						<li class="order_address_text">
						<input type="text" id="order_address" placeholder="주소" readonly>
						<input type="button" id="btn_address" onclick="btn_execDaumPostcode()" value="우편번호 찾기">
						<input type="text" id="order_postcode" placeholder="우편번호" readonly>
						<input type="text" id="order_extraAddress" placeholder="참고항목" readonly>
						<input type="text" id="order_detailAddress" placeholder="상세주소">						
						</li>

					</ul>
					<textarea class="hidden" name="gameIdx" id="gameIdx" >${gamepage.gameIdx}</textarea>
					<textarea class="hidden" name="memIdx" id="memIdx" >${loginInfo.memIdx}</textarea>
					<input type="text" class="hidden" name="merchant" id="merchant">
					<input type="text" class="hidden" name="shipAddress" id="shipAddress">
				</div>
				
				<div class="btn_order_pay">
					<button type="button" id="btn_pay" onclick="requestPay()">결제</button>
				</div>
			</div>
 
  
		 </form> 
	</div>

</body>
<script>
	var merchantid = '${loginInfo.memIdx}'+new Date().getTime();
	console.log(merchantid);
	var IMP = window.IMP; 
	IMP.init("imp57300102"); 
	function requestPay() {			
		var shipAddress = $('#order_address').val() + $('#order_extraAddress').val() +$('#order_detailAddress').val();
		console.log(shipAddress)
			if($('#memName').val() == '' ){			
				alert ('이름을 입력해주세요');
				return false;
			} else if ($('#phoneNum').val() == ''){				
				alert ('핸드폰 번호를 입력해주세요');
				return false;
			} else if ($('#order_address').val() == ''){							
				alert('주소를 입력해주세요');
				return false;
			}else if ($('#order_detailAddress').val() == ''){							
				alert($('#order_address').val() + $('#order_extraAddress').val() + $('#order_detailAddress').val() );
				return false;
			}
			$('#merchant').attr('value',merchantid);
			$('#shipAddress').attr('value',shipAddress);
			console.log($("#order_form").serialize());
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({ // param
			pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
			pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
			merchant_uid : $('#merchant').val(),
			name : "${gamepage.gameName}",
			amount : $('#gamePrice').val(),
			buyer_email : "",
			buyer_name : $('#memName').val(),
			buyer_tel : $('#phoneNum').val(),
			buyer_addr : $('#shipAddress').val(),
			buyer_postcode : $('#order_postcode').val()
		}, function(rsp) { // callback
			if (rsp.success) {
				// 결제 성공 시 로직
        		$.ajax({
				type : 'POST',
				url : "<c:url value='/game/order/${gamepage.gameIdx}'/>",
				data :$("#order_form").serialize(),
				
				success: function(returnData){   
						alert("결제가 완료되었습니다.")
						
					},
					error:function(request,status,error){   //데이터 주고받기가 실패했을 경우 실행할 결과
						//alert('실패');
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						
					},
			   		 complete : function(){	
			   		 }
				
				
				});	
        		alert("결제가 완료되었습니다.")
				location.href="<c:url value='/game/gamepage/${gamepage.gameIdx}'/>"
  			} else {
				alert("결제에 실패하였습니다. \n에러 내용: " + rsp.error_msg);
			}	
		});
		
	}  	
  	
	
	
	
  </script>

</html>