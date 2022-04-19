<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComeOnBoard</title>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    ul {
        list-style: none;
    }
  
    .ex_wrap{
        width: 100%;
        background-color: #f7f7f7;
        border: 1px solid rgb(251, 188, 006); 
        width: 980px;
        margin: 0px auto;
        height: 270px;
        padding: 0px 5px;
    }

    .ex_title{
        margin: 10px 30px 0px 30px;
    }

    .ex_wrap>div>h2{
        margin-top: 8px;
        display: inline-block;
    }

    .ex_wrap>div>input{
        display: inline-block;
        margin : 8px 0px;
        margin-left : 5px;
        width: 50px;
        visibility : hidden;
        
    }
    .ex_wrap>div>form>input{
        display: inline-block;
        margin : 8px 0px;
        margin-left : 5px;
        width: 100px;
        float : left;
    }
    .ex_score{
        background-color: rgb(052,168,083);
        width:130px;
        height:130px;
        border-radius: 75px;
        margin-top: 13px;
        margin-left: 25px;
        float: left;
        box-shadow: 1px 1px 3px 1px #dadce0;
    }

    .ex_score>h1{
        text-align: center;
        padding-top: 20px;
        font-size: 64px;
      
    }
    .ex_list{
    	width : 640px;
    	float : left;
    	height : 170px;
    }
    .ex_left{
        margin-left: 40px;
        margin-top: 18px;
        float: left;
        font-size: 18px;
        width : 190px;
        height : 110px;
    } 
    .ex_left>li{
        margin-top: 20px;
        
    }   
    .ex_center{
        margin-left:20px;
        margin-top: 18px;
        float: left;
        font-size: 18px;
        width : 200px;
        height : 110px;
    }
    .ex_center>li{
        margin-top: 20px;
    }    
    .ex_right{
        margin-left:10px;
        margin-top: 18px;
        float: left;
        font-size: 18px;
        width : 150px;
        height : 110px;
    }
    .ex_right>li{
        margin-top: 20px;
    }    
     .ex_under{
        margin-left:40px;
        float: left;
        font-size: 18px;
        width : 500px;
        height : 30px;
    }    
    .ex_img{
        float: right;
        margin-right: 20px;
        display: inline-block;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border-radius: 15px 15px;
        
    }
    
    .ex_img>img{
        border-radius: 20px;
    }

    .rule_wrap{
        width: 100%;
        background-color: #f7f7f7;
        width: 980px;
        margin: 0px auto;
        height: 70%;
        
        padding: 0px 5px;
        border-left: 1px solid rgb(251, 188, 006);
        border-right: 1px solid rgb(251, 188, 006);
        border-bottom: 1px solid rgb(251, 188, 006);
    }


  
    .rule_list input[type=radio]{
        display: none;
    }

    #tab-1:checked ~ .rule_list_tab label:nth-child(1), /* id:tab-1 과 rule_list_tab 자손을 연결 */
    #tab-2:checked ~ .rule_list_tab label:nth-child(2),
    #tab-3:checked ~ .rule_list_tab label:nth-child(3),
    #tab-4:checked ~ .rule_list_tab label:nth-child(4){
        background-color: rgb(251, 188, 006); 
        box-shadow: none;   
    }

    .rule_content > div{
        display: none;
    }

    .rule_content > pre{
        display: none;
        width:860px;
        white-space: pre-wrap;
    }

    #tab-1:checked ~ .rule_content pre:nth-child(1), 
    #tab-2:checked ~ .rule_content pre:nth-child(2),
    #tab-3:checked ~ .rule_content pre:nth-child(3),
    #tab-4:checked ~ .rule_content pre:nth-child(4){
        display: block;
    }

    .rule_list{
        margin: 0 auto;
        width: 900px;
        max-width: 100%;
        padding-top: 20px;
        padding-left: 40px;
        padding-right: 40px;
    }

    .rule_list_tab{
        overflow: hidden;
    }

    
    .rule_list_tab label{
        
        font-size: 18px;
        width: 25%;
        float: left;
        text-align: center;
        padding: 15px 0px;
        text-transform: uppercase; /* 글자를 대문자로 바꿔준다 */
        font-weight: bold;
        letter-spacing: 2px; /* 글자사이 간격 */
        user-select: none; /* 드래그를 막아주는 속성 */
        background-color: #f7f7f7;
        /* box-shadow: 1px 1px 3px 1px #dadce0; */
        /* border-right: 1 px solid rgb(251, 188, 006); */
        -webkit-user-select: none;
    }
 
    .rule_list_tab>label:hover{
        background-color: rgb(66, 133, 244);
        cursor: pointer;
    }

    .rule_content {
        background-color: rgb(250, 250, 250);
        min-height: 370px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
    }


    .rule_content > div{
        padding: 30px;
        line-height: 1.5;
        font-size: 17px;
    }
    
    .rule_content > pre{
        padding: 30px;
        line-height: 1.5;
        font-size: 20px;
    }    
 
    .rule_content_name3 > iframe{
        width: 400px;
        height: 300px;
    }

    .review_item{
        padding-top: 20px;
        padding-left: 40px;
        width: 921px;
       
    }
    
    .review_text{
        font-size: 16px;
    }
   
    .review_wrap{
        margin: 0px auto;
        width: 670px;
        height: 160px;
        display: inline;
    }

    .review_area{
        width: 630px;
        height: 50px;
        margin: 20px auto;
    }
    .review_text{
        width: 578px;
        height: 40px;
        font-size: 18px;
        float: left;
        resize: none;
        background-color: white;
        border-radius: 15px 0px 0px 15px;
        outline: none;
        text-indent: 10px;
        padding-top: 10px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        
    }
    .review_btn{
        background-color: rgb(251, 188, 006);
        width:50px;
        height:52px;
        border-radius: 0px 10px 10px 0px;
        float: left;
        font-size: 18px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
    }
    .review_btn:hover{
		background-color: rgb(66, 133, 244); 
        cursor: pointer;
    } 
    .review_list{
        clear: left;
        margin-top: 20px;
    }
    .list_item{
        clear: left;
        width: 872px;
        height: 60px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        margin-top: 5px;
    }
    .list_id{
        float: left;
        border-right: 2px solid rgb(251, 188, 006);
        padding-top: 10px ;
        width: 110px;
        height: 48px;
        text-align : center;
        font-size:20px;
    }
    .list_text{
        float: left;
       /* border-right: 2px solid rgb(251, 188, 006); */
        width: 495px;
        
    }
    
     .list_text>pre{
        float: left;      
        width: 475px;
        padding: 10px;
        white-space: pre-wrap;
        text-overflow: ellipsis;
        font-size:16px;
        height: 48px;
        text-align : center;
    }   
    
    .list_rating{
        float: left;
        padding-top : 18px;
        padding-right : 10px;
        padding-left:10px;
        font-size:16px;
        border-right: 2px solid rgb(251, 188, 006);
        border-left: 2px solid rgb(251, 188, 006);
        height : 40px;
        
    }    
    .list_date{
        float: left;
        padding-top : 18px;
        padding-right : 10px;
        padding-left:10px;
        border-right: 2px solid rgb(251, 188, 006);
        height : 40px;
        
    }
    .list_delete{
        float: right;
        padding: 15px 3px;        
    }    
    .list_delete>button{
    	background-color:#f7f7f7;
    	border-radius: 5px;
    	box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        width: 35px;
    }
    .list_delete>button:hover{
		background-color: rgb(66, 133, 244); 
        cursor: pointer;
    }            
    .paging{
        margin-top: 25px;
        margin-left: auto;
        margin-right: auto;
        width: 300px;
    }
    .paging>ul>li{
        float: left;
        width: 36px;
        height: 20px;
        border-right: 2px solid rgb(251, 188, 006);
        border-left: 2px solid rgb(251, 188, 006);
        text-align: center;
        box-shadow: 1px 1px 3px 1px #dadce0;
        padding: 0px 1px;
        padding-bottom: 3px;
    }

    .moving{
        clear: left;
        margin: 0px auto;
        padding-top: 20px;
        width: 129px;
        height: 30px;
        
    }
    .moving>ul>li{
        text-align : center;
    }
    .moving>ul>li>a{
    	display : block;
        width: 70px;
        border-radius: 5px;
        margin-right: 30px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        text-align : center;
        
    }

    .moving>ul>li>a:hover{
    	background-color: rgb(66, 133, 244); 
        cursor: pointer;
    }

    a{
        text-decoration: none;
        color: black;
    }

    hr{
            margin-bottom: 10px;
            width: 500px;
            background-color: rgb(251, 188, 006);
            height: 2px;
        }

    input[type=button]:hover{
        background-color: rgb(66, 133, 244); 
        cursor: pointer;
    }

    .star-rating {
        display: flex;
        flex-direction: row-reverse;
        font-size: 2.25rem;
        line-height: 2.5rem;
        justify-content: space-around;
        padding: 0 0.2em;
        text-align: center;
        width: 5em;
        margin: 0px auto;
    }
 

    .star-rating input {
     display: none;
    }
 
    .star-rating label {
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 2.3px;
        -webkit-text-stroke-color: #2b2a29;
        cursor: pointer;
    }
    
    .star-rating :checked ~ label {
        -webkit-text-fill-color: rgb(251, 188, 006);
    }
    
    .star-rating label:hover,
    .star-rating label:hover ~ label {
     -webkit-text-fill-color: rgb(251, 188, 006);
    }

	.rev_none{
		display : none;
	}
	.visible {
		visibility : visible
	}
	.visible_hidden{
		visibility : hidden
	}
	
</style>

<script>
  function ratingToPercent(){
      const score = +this.restaurant.averageScore * 20;
      return score + 1.5;
    }  

</script>

<script>
    $(function(){
    	var video = '${gamepage.gameVideo}';
 	
        var embed = $('#content_iframe'); // 영상코드

        $('#tab-3').on('click',function(){
           /*  $('.rule_content_name3 ').empty(); */
            var path = $(this).attr('href');  
            $('.rule_content_name3').append(video);
            $(path).show();
            
        })

        $('#tab-1').on('click',function(){
            $('.rule_content_name3 ').empty();
        })

        $('#tab-2').on('click',function(){
            $('.rule_content_name3 ').empty();
        })

        $('#tab-4').on('click',function(){
            $('.rule_content_name3 ').empty();
        }) 
    });

</script>
<script>

$(document).ready(function(){
	

	var reIdx = null;
	// 리뷰리스트 출력
	$.ajax({
		type: 'get',   //get방식으로 명시
		url : '<c:url value="/game/gamerevpage"/>',  //이동할 jsp 파일 주소
		data : {
			gameIdx : ${gamepage.gameIdx}
		},
		dataType:'json',   //문자형식으로 받기
		aysnc: false,
		success: function(returnData){   
		/* 	console.log(returnData);
			console.log(${gamepage.gameIdx}); */
			var data = returnData;
			var html = '';
			
			$.each(data, function(idx, review){
				console.log(idx);
   				console.log(review)
 				
 				var reviewIdx = review.memIdx;
   				html += '<ul class="list_item">'+'\n'+
			                 '<li class="list_id">'+'<a href="#">'+review.nickname+'</a>'+'</li>'+'\n'+
			                 '<li class="list_text">'+'<pre>'+review.revContent+'</pre>'+'</li>'+'\n'+
			                 '<li class="list_rating">'+review.revRating+'</li>'+'\n'+
			                 '<li class="list_date">'+review.revRegDate+'</li>'+'\n';
			    if('${loginInfo.memIdx}' == reviewIdx){
			    	html += '<li class="list_delete"><button onclick="rev_dele('+review.revIdx+');">삭제</button></li>'+'\n';
			    	/* html += '<li class="list_delete"><button id="rev_edit" onclick="rev_edit('+review.revIdx+');">수정</button></li>'+'\n';			    	
			    	console.log('똑같다고 실행됨'); */
			    }           
			                 
			        html +=  '<li class="rev_none">'+review.revIdx+'</li>'+'\n'+
			                 '<li class="rev_none">'+review.memIdx+'</li>'+'\n'+
						'</ul>';
					/* html +='<form method="post">'+'\n'+ */
							
			});
			$('.review_list').append(html);
			
		},
		error:function(request,status,error){   //데이터 주고받기가 실패했을 경우 실행할 결과
			//alert('실패');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		},
   		 complete : function(){	
   		 }
	});
	


});



</script>
<script>

$(function(){
	
	if('${loginInfo.memAuth}' == 'manager'){
		$('#btn_edit').css('visibility','visible');
		$('#btn_delete').css('visibility','visible');
	}

});

</script>
<script>
// 리뷰삭제
function rev_dele(idx){
	console.log(idx)
	
	$.ajax({
		type: 'post',   //get방식으로 명시
		url : '<c:url value="/game/gamepage1/"/>${gamepage.gameIdx}',  //이동할 jsp 파일 주소
		data : {
			revIdx : idx,	
			memIdx : ${loginInfo.memIdx}
		},
		/* dataType:'json',   //문자형식으로 받기 */
		success: function(){   
				
			alert("삭제됬습니다.")	
			location.reload();
					
	
		},
		error:function(request,status,error){   //데이터 주고받기가 실패했을 경우 실행할 결과
			//alert('실패');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
		},
			 complete : function(){	
				 
			 }
	});
};





</script>

<script>
 
$(document).ready(function(){
		
	$('#review_btn').on('click',function(){
		
		if ('${loginInfo.memIdx}' == '' ){
			alert('로그인 해주세요');
			location.href="/cob/member/login";
			return false;	
			
		}else if($('#revContent').val() == ''){			
			alert ('평점과 리뷰 내용을 모두 입력해주세요');
			return false;
		} else if(!$('#rev_form :input:radio:checked').val()){			
			alert ('평점과 리뷰 내용을 모두 입력해주세요');
			return false;
		} else if($('#revContent').val().length > 60){			
			alert ('내용은 최대 60자 까지 가능합니다.');			
			return false;
		}else{
			alert('등록되었습니다.');
		}	
	});

}); 


</script>
<script>
$(document).ready(function(){
	
	console.log('hihi');
	
	//$('#btn_preferDel').addClass('visible_hidden')
	//$('#btn_preferIns').addClass('visible_hidden')
	
	$.ajax({
		url : '<c:url value="/game/preferChk"/>',
		type : 'post',
		data : {
			memIdx : ${loginInfo.memIdx},
			gameIdx : ${gamepage.gameIdx}
		},
		
		success : function(data){
		
			if(data == 'Y'){
				$('#btn_preferIns').removeClass('visible_hidden');
				$('#btn_preferIns').addClass('visible');
				
			} else {

				$('#btn_preferDel').removeClass('visible_hidden');
				$('#btn_preferDel').addClass('visible');				
				
			}
		},
		error : function(request,status,error){
			alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
			/* console.log(request);
			console.log(status);
			console.log(error);		
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
						
			
		},
		complete : function(){	
			
		}		
				
	})
	
});
</script>
<body class="main_body">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<%@ include file="/WEB-INF/views/gameFrame/searchbar.jsp"%>
	
		<div class="ex_wrap">

			<div class="ex_title">
				<h2>${gamepage.gameName}</h2>
				<form action ="/cob/game/preferGame/${gamepage.gameIdx}" method="post">
					<textarea class="rev_none" name="gameIdx">
						${gamepage.gameIdx}
					</textarea>

					<textarea class="rev_none" name="memIdx">
						${loginInfo.memIdx}
					</textarea>
					<input type="submit" value="선호게임 등록" class = "btn_preferIns visible_hidden" id="btn_preferIns">					
				</form>
				<form action ="/cob/game/preferGame2/${gamepage.gameIdx}" method="post">
					<textarea class="rev_none" name="gameIdx">
						${gamepage.gameIdx}
					</textarea>

					<textarea class="rev_none" name="memIdx">
						${loginInfo.memIdx}
					</textarea>
					<input type="submit" value="선호게임 삭제" class = "btn_preferDel visible_hidden" id="btn_preferDel">					
				</form>	
				<input type="button" class="btn_edit" value="edit" id="btn_edit"
					onclick="location.href='<c:url value ='/game/gameEdit/'/>${gamepage.gameIdx}'">
				<input type="button" class="btn_edit" value="delete" id="btn_delete"
					onclick="location.href='<c:url value ='/game/confirmDelete/'/>${gamepage.gameIdx}'">						
			</div>
			<hr>

			<div class="ex_score">
				<h1>${gamepage.avg }</h1>
			</div>

			<div class="ex_list">
				<ul class="ex_left">
					<li>장르 : ${gamepage.gameSort}</li>
					<li>사용연령 : ${gamepage.gameLmtAge}</li>

				</ul>
				<ul class="ex_center">
					<li>게임인원 : ${gamepage.gamePerson}</li>
					<li>플레이타임 : ${gamepage.gameTime}</li>										
				</ul>
				<ul class="ex_right">
					<li>출시일 : ${gamepage.gamePubDate}</li>					
				</ul>
				<ul class="ex_under">
					<li>출판사 : ${gamepage.gamePublisher}</li>
				</ul>				
			</div>

			<div class="ex_img">
				<img src="<c:url value="/uploadfile/uploadgamefile"/>/${gamepage.gamePhoto}" height = "160px" width="160px"/>	
			</div>

		</div>

	<div class="rule_wrap">

		

		<div class="rule_list">

			<input type="radio" id="tab-1" name="show" checked> 
			<input type="radio" id="tab-2" name="show"> 
			<input type="radio" id="tab-3" name="show"> 
			<input type="radio" id="tab-4" name="show">

			<div class="rule_list_tab">
				<label for="tab-1">Intro</label> 
				<label for="tab-2">Rule</label> 
				<label for="tab-3">play</label> 
				<label for="tab-4">Buy</label>
			</div>

			<div class="rule_content">
				<pre class="rule_content_name1">${gamepage.gameIntro}</pre>
				<pre class="rule_content_name2">${gamepage.gameRule}</pre>
				<pre class="rule_content_name3" id="game_play"></pre>
				<pre class="rule_content_name4">
					<input type="button" class="btn_edit" value="구입하기" id="btn_buy"
					>
				</pre>
			</div>
		</div>
		<script>
		 $(document).ready(function(){
			
			$('#btn_buy').on('click',function(){
				
				if ('${loginInfo.memIdx}' == '' ){
					alert('로그인 해주세요');
					return false;		
				} else{
					/* onclick="location.href='<c:url value ='/game/order/'/>${gamepage.gameIdx}'";  */
					location.href='<c:url value ='/game/order/'/>${gamepage.gameIdx}'; 
					
				}
						
				
				
			});
			
		}); 
		
		
		</script>

		<div class="review_item">
			<h1>review</h1>
			<hr>

			<Form method="post" accept-charset="UTF-8">
				<div class="review_wrap" id="rev_form">

					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="revRating" id="revRating" value="5" /> 
						<label for="5-stars" class="star pr-4">★</label> 
						<input type="radio" id="4-stars" name="revRating" id="revRating" value="4" /> 
						<label for="4-stars" class="star">★</label> 
						<input type="radio" id="3-stars" name="revRating" id="revRating" value="3" /> 
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="revRating" id="revRating" value="2" /> 
						<label for="2-stars" class="star">★</label> 
						<input type="radio" id="1-star" name="revRating" id="revRating" value="1" /> 
						<label for="1-star" class="star">★</label>
					</div>


					<div class="review_area">

						<textarea class="review_text" cols="50" rows="1" name="revContent" id="revContent" placeholder="내용을 입력하세요(60자)"></textarea>
						<input type="submit" value="등록" class="review_btn" id="review_btn">
							

					</div>

					<textarea class="rev_none" name="gameIdx">
						${gamepage.gameIdx}
					</textarea>

					<textarea class="rev_none" name="memIdx">
						${loginInfo.memIdx}
					</textarea>
				</div>
			</Form>



			<div class="review_list">

			</div>

			<!-- <div class="paging">
				<ul>
					<li><a href="#">이전</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">다음</a></li>
				</ul>
			</div> -->
			<div class="moving">
				<ul>
					<%-- <li><a
						href="<c:url value ='/game/gamepage/'/>${gamepage.gameIdx+1}"
						id="next">이전</a></li>  --%>
					<li><a href="javascript:history.back()" id="list">목록</a>

					</li>
					<%-- <li><a
						href="<c:url value ='/game/gamepage/'/>${gamepage.gameIdx-1}"
						id="next">다음</a></li> --%>
				</ul>
			</div>
		</div>
	</div>
	<footer>
		<h2 class="visible_hidden">footer입니다 ${gamepage.gamePrice}</h2> 
	</footer>




</body>

</html>