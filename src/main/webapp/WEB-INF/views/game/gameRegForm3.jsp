<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ComeOnBoard</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
        min-height: 1000px;
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

    .background>.reg_wrap{
        margin: 20px auto;
        width: 880px;
        padding-top: 30px;
        height: 1170px;
        
    }
    
    .area_game_photo{
        width: 230px;
        float: right;
        margin-right : 80px;
    }
    .area_game_photo>h3{
        width: 170px;
        float: right;
        margin-bottom: 10px;
       
    }

    .reg_default{
        float: right;
        background-color: #f7f7f7;
        width: 240px;
        height: 240px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 2px solid white;
    }

    .reg_default>img{
        width: 100%;
        height: 100%;
    }


    .area_game_photo>input{
        margin-top: 10px;
        width: 200px;
        float: right;
        box-shadow: 1px 1px 3px 1px #dadce0;
        visibility: hidden;
    }
    .area_game_photo>input:hover{
        cursor: pointer;
    }

    .btn_game_photo{
        text-align: center;
        width: 240px;
        float: right;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #000;
    }
 
    .btn_game_photo:hover{
        cursor: pointer;
        background-color: rgb(251, 188, 006);
    }

    .area_game_reg{
        text-align: center;
        height: 330px;
        width: 500px;
    }
    .reg_item{
        float: left;
        width: 190px;
        height: 60px;
        text-align: right;
        padding-right: 10px;
        padding-top: 16px;
        font-size: 20px;
        font-weight: bold;
    }
    .reg_text{
        float: left;
        width: 300px;
        height: 80px;
        
    }
    .reg_text>input{
        font-size: 20px;
        width: 280px;
        height: 50px;
        border: 3px solid white;
        box-shadow: 1px 1px 3px 1px #dadce0;
    	background-color: #f7f7f7; 
    }
    
    .reg_text>select{
     	font-size: 20px;
        width: 280px;
        height: 50px;
        border: 3px solid white;
        box-shadow: 1px 1px 3px 1px #dadce0;
      	background-color: #f7f7f7; 
      	text-align: center;
    }

    .area_game_reg2{
        text-align: center;
        height: 250px;
        width: 500px;
    }
    
    .reg_item2{
        float: left;
        width: 190px;
        height: 60px;
        text-align: right;
        padding-right: 10px;
        padding-top: 16px;
        font-size: 20px;
        font-weight: bold;
    }
    .reg_text2{
        float: left;
        width: 300px;
        height: 80px;
    } 
    .reg_text2>input{
        font-size: 20px;
        width: 280px;
        height: 50px;
        border: 3px solid white;
        box-shadow: 1px 1px 3px 1px #dadce0;
        background-color: #f7f7f7;
    }   

	 .reg_text2>select{
     	font-size: 20px;
        width: 280px;
        height: 50px;
        border: 3px solid white;
        box-shadow: 1px 1px 3px 1px #dadce0;
      	background-color: #f7f7f7; 
      	text-align: center;
    }


    .reg_intro{
        text-align: center;
        height: 450px;
        width: 800px; 
    }

    .reg_intro>ul{
        clear: both;
        margin-bottom: 20px;
    }
   
    .reg_intro>ul>.intro_li{
        float: left;
        width: 190px !important ;
        height: 62px;
        text-align: right;
        padding-right: 10px;
        font-size: 20px;
        font-weight: bold;
        margin-right: 10px;
    }
    
    .intro_text{
        height: 130px;
        margin: 20px auto;
    }

    .reg_intro>ul>li>textarea{
        display: block;
        border: 3px solid white;
        background-color: #f7f7f7; 
        box-shadow: 1px 1px 3px 1px #dadce0;
        resize: none;
       
    }   
    
    .btn_game_reg{
        width: 105px;
        height: 55px;
        margin: 0px auto;

    }
    .btn_game_reg>input{
        
        background-color: #f7f7f7 ;
        width:100px !important ; 
        height:40px !important ;
        text-decoration: none;
        border-radius: 10px;
        font-size: 24px;
        color: #000;   
        box-shadow: 1px 1px 3px 1px #dadce0;
    }

    .btn_game_reg>input:hover{ 
        background-color: rgb(251, 188, 006); 
        cursor: pointer;
    }

    a:hover{
        cursor: pointer;
    }

   
    /* a{
        text-decoration: none;
        color: black;
    } */



	
</style>
<script>

	function setImg(event) {

		var reader = new FileReader();

		reader.onload = function(event) {
			/* document.querySelector("div#image_container").removeChild(); */
			var oldImg = document.querySelector("#image_container img");
			if (oldImg != null) {
				document.querySelector("#image_container").removeChild(oldImg);
			}

			var newImg = document.createElement("img");
			newImg.setAttribute("src", event.target.result);
			document.querySelector("#image_container").appendChild(newImg);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
	

	
</script>

<script>
$(document).ready(function(){
	
	
	$('#cob_gameRegBtn').on('click',function(){
	
		if($('#gameRule').val() == '' && $('#gameName').val() == ''){
			
			alert ('게임 이름과 RULE을 입력해주세요');
			return false;
		} else if ($('#gameRule').val() == ''){
			
			alert ('RULE을 입력해주세요');
			return false;
		} else if ($('#gameName').val() == ''){
			
			alert('게임 이름을 입력해주세요');
			return false;
			
		}		
	});

});


</script>
<script>
	// 게임 이름 중복 체크
	$(document).ready(function(){
		
		$('#gameName').focusout(function(){
			
			$.ajax({
				url : '<c:url value="/game/nameChk"/>',
				type : 'post',
				data : {
					gameName : $(this).val()
				},
				success : function(data){
					
					if(data == 'Y'){
						$('#msg_name').html('사용가능');
						$('#msg_name').addClass('color_blue');
						$('#msg_name').removeClass('color_grey');
					} else {						
						$('#msg_name').html('중복된 게임이름입니다.');
						$('#msg_name').addClass('color_red');
						$('#msg_name').removeClass('color_grey');
						$('#msg_name').removeClass('color_blue');
					}
				},
				error : function(request,status,error){
					alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
					console.log(request);
					console.log(status);
					console.log(error);					
				},
				complete : function(){
					
				}
			})
		
		});
			
	});
	
	
</script>
<body class="main_body">

    <%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<%@ include file="/WEB-INF/views/gameFrame/searchbar.jsp"%>

	<div class="background">

		<div class="title">
			<h2>게임등록</h2>
		</div>
		<hr>
		<form method="post"  enctype="multipart/form-data"
		 accept-charset="UTF-8" class="form_game_reg">
			<div class="reg_wrap">

				<span class="area_game_photo">
					<h3>게임 이미지</h3>
					<div class="reg_default" id="image_container"></div> 
					<input type="file" name="gamePhoto" id="image" accept="image/*" onchange="setImg(event);" />
					<label class="btn_game_photo" for="image"> 이미지 등록 </label>

				</span>

				<div class="area_game_reg">
					<ul>
						<li class="reg_item">게임명</li>
						<li class="reg_text"><input type="text" name="gameName" id="gameName" >
							<span id="msg_name" class="msg color_grey"></span>
						</li>
						
					</ul>
					<ul>
						<li class="reg_item">장르</li>
						<li class="reg_text">
							<select name="gameSort" id="gameSort" >
								<option value="전략">전략</option>
								<option value="추상">추상</option>
								<option value="컬렉터블">컬렉터블</option>
								<option value="가족">가족</option>
								<option value="어린이">어린이</option>
								<option value="파티">파티</option>
								<option value="테마">테마</option>
								<option value="워게임">워게임</option>
							</select>
						</li>
					</ul>
					<ul>
						<li class="reg_item">게임인원</li>
						<li class="reg_text"><input type="text" name="gamePerson" id="gamePerson" ></li>
					</ul>
					<ul>
						<li class="reg_item">플레이타임</li>
						<li class="reg_text"><input type="text" name="gameTime" id="gameTime" ></li>
					</ul>
				</div>
				<div class="area_game_reg2">
					<ul>
						<li class="reg_item2">사용연령</li>
						<li class="reg_text2">
							<select name="gameLmtAge" id="gameLmtAge"  class="form-control mr-2" >
								<option value="전체연령가">전체연령가</option>
								<option value="7세">7세</option>
								<option value="12세">12세</option>
								<option value="15세">15세</option>
								<option value="19세">19세</option>
							</select>	
						</li>
					</ul>				
					<ul>
						<li class="reg_item2">출판사</li>
						<li class="reg_text2"><input type="text" name="gamePublisher" id="gamePublisher"></li>
					</ul>
					<ul>
						<li class="reg_item2">출시일</li>
						<li class="reg_text2"><input type="text" name="gamePubDate" id="gamePubDate"></li>
					</ul>
				</div>

				<div class="reg_intro">
					<ul>
						<li class="intro_li">INTRO</li>
						<li class="intro_text"><textarea cols="60" rows="8" name="gameIntro" id="gameIntro"></textarea></li>

					</ul>

					<ul>
						<li class="intro_li">RULE</li>
						<li class="intro_text"><textarea cols="60" rows="8" name="gameRule" id="gameRule"></textarea></li>

					</ul>

					<ul>
						<li class="intro_li">PLAY</li>
						<li class="intro_text"><textarea cols="60" rows="8" name="gameVideo" id="gameVideo"></textarea></li>

					</ul>



				</div>
				
				<div class="btn_game_reg">
					<input type="submit" value="등록" name="cob_gameRegBtn" id="cob_gameRegBtn" >
				</div>
				
			</div>

		</form>
	</div>

</body>


</html>