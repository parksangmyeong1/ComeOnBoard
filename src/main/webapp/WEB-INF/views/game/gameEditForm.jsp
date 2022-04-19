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

    .reg_default{
        float: right;
        background-color: #f7f7f7;
        width: 200px;
        height: 200px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 2px solid white;
    }

    .reg_default>img{
        width: 100%;
        height: 100%;
    }


    .area_game_photo>input{
        margin-top: -10px;
        width: 200px;
        float: right;
        box-shadow: 1px 1px 3px 1px #dadce0;
       /*  visibility: hidden; */
    }
    .area_game_photo>input:hover{
        cursor: pointer;
    }

    .btn_game_photo{
        text-align: center;
        width: 200px;
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

   
    a{
        text-decoration: none;
        color: black;
    }
	
	.hidden{
		display : none;
	}
	
</style>
<script >
</script>
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
	
	$(document).ready(function(){
		$('#gameSort').val('${gamepage.gameSort}').attr("selected", "selected");	
		// 게임 솔트에 아래 있는 ${gamepage.gameSort} 를 찾아서 selected : selected 해준다
		$('#gameLmtAge').val('${gamepage.gameLmtAge}').attr("selected", "selected");	
	});

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

<body class="main_body">

    <%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<%@ include file="/WEB-INF/views/gameFrame/searchbar.jsp"%>


	<div class="background">


		<div class="title">
			<h2>게임정보수정</h2>
		</div>
		<hr>
		<form method="post" enctype="multipart/form-data" 
		accept-charset="UTF-8" class="form_game_reg">
			<div class="reg_wrap">

				<span class="area_game_photo">
					<div class="reg_default" alt="사진" id="image_container" ></div> 
					<h3>변경 이미지</h3> 
					<img src="<c:url value="/uploadfile/uploadgamefile"/>/${gamepage.gamePhoto}" class="reg_default" alt="사진" id="image_container"/>
					<h3>현재 이미지</h3>
					<input type="file" class="hidden" name="gamePhoto" id="image"  accept="image/*" onchange="setImg(event);" />
					<label class="btn_game_photo" for="image"> 이미지 변경 </label> 

				</span>

				<div class="area_game_reg">
					<ul>
						<li class="reg_item">게임명</li>
						<li class="reg_text">
						<input type="text" name="gameName" id="gameName" value="${gamepage.gameName}" >
						</li>
					</ul>
					<ul>
						<li class="reg_item">장르</li>
						<li class="reg_text">
							<select name="gameSort" id="gameSort" ">
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
						<li class="reg_text"><input type="text" name="gamePerson" id="gamePerson" value="${gamepage.gamePerson}"></li>
					</ul>
					<ul>
						<li class="reg_item">플레이타임</li>
						<li class="reg_text"><input type="text" name="gameTime" id="gameTime" value="${gamepage.gameTime}"></li>
					</ul>
				</div>
				<div class="area_game_reg2">
					<ul>
						<li class="reg_item2">사용연령</li>
						<li class="reg_text2">
							<select name="gameLmtAge" id="gameLmtAge"  class="form-control mr-2" value="${gamepage.gameLmtAge}" >
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
						<li class="reg_text2"><input type="text" name="gamePublisher" id="gamePublisher" value="${gamepage.gamePublisher}"></li>
					</ul>
					<ul>
						<li class="reg_item2">출시일</li>
						<li class="reg_text2"><input type="text" name="gamePubDate" id="gamePubDate" value="${gamepage.gamePubDate}"></li>
					</ul>
				</div>

				<div class="reg_intro">
					<ul>
						<li class="intro_li">INTRO</li>
						<li class="intro_text"><textarea cols="60" rows="8" name="gameIntro" id="gameIntro" >${gamepage.gameIntro}</textarea></li>

					</ul>

					<ul>
						<li class="intro_li">RULE</li>
						<li class="intro_text"><textarea cols="60" rows="8" name="gameRule" id="gameRule" >${gamepage.gameRule}</textarea></li>

					</ul>

					<ul>
						<li class="intro_li">PLAY</li>
						<li class="intro_text"><textarea cols="60" rows="8" name="gameVideo" id="gameVideo" >${gamepage.gameVideo}</textarea></li>

					</ul>
					
					<textarea class="hidden" name="gameIdx" id="gameIdx" >${gamepage.gameIdx}</textarea>
					

				</div>
				
				<div class="btn_game_reg">
					<input type="submit" value="수정" name="cob_gameRegBtn" id="cob_gameRegBtn" onclick="btnclick()">
				</div>
				
			</div>

		</form>
	</div>

</body>


</html>