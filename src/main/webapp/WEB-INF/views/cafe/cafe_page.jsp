<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

	<!-- 에어 데이터피커-->
    <script type="text/javascript" src="<c:url value="/js/datepicker.min.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/css/datepicker.min.css"/>" type="text/css">
    <!-- Include korean language -->
    <script src="<c:url value="/js/datepicker.kr.js"/>"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	
	<link rel="stylesheet" href="<c:url value="/css/cafe_page.css"/>" type="text/css">
	<link rel="stylesheet" href="/cob/css/default.css">
	<link rel="icon" href="/cob/images/simple_logo.png">
	<%-- <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %> --%>

<c:if test="${empty loginInfo}">
	<script>
	let loginmemidx = null;
	let cafememidx = ${cafeInfo.memIdx};
	let loginauth = null;
	</script>
</c:if>   
<c:if test="${!empty loginInfo}">
	<script>
	let loginmemidx = ${loginInfo.memIdx};
	let cafememidx = ${cafeInfo.memIdx};	
	let loginauth = '${loginInfo.memAuth}';
	</script>
</c:if>   

<script>

$(document).ready(function(){
	
	let four = 'four';
	let grp = 'grp';
	let page = 1;
	review(page);

	
	// 날짜 선택시 예약버튼 리셋
	$('#date').datepicker({
	    minDate: new Date(), // Now can select only dates, which goes after today
	    onSelect: function() {
	    	login_check(four);
	     }
	})

	// 4인석 버튼 클릭시 
	$('#btn_reservation_4').click(function(){
		login_check(four);
	})
	
	// 8인석 버튼 클릭시
	$('#btn_reservation_8').click(function(){
		login_check(grp);
	})
	
	
	// 리뷰 작성시 빈값 체크
	$('#btn_rev_submit').click(function(){

		var content = $('#rev_textarea').val();
		
		// 점수 입력 확인
		if(!$('#rev_form :input:radio:checked').val()) {   
			alert('점수를 선택해 주세요.');
			return;
		}
		// 내용 입력 확인
		if(!content.trim().length){
			alert('내용을 입력해주세요.');
			$('#rev_textarea').focus();
			return;
		}
		// 폼 서밋
		$('#rev_form').submit();
	});
	

});

// 접속 정보 확인 - 예약버튼 or 예약 리스트
function login_check(table){
	if(cafememidx == loginmemidx){
		reservation_list(table);
	} else if (cafememidx != loginmemidx && loginauth != 'ban'){
		reservation_button(table);
	}
}


// 예약 버튼 동적 생성
function reservation_button(table){

    // 날짜값
    let date = $('#date').val();
    let today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth()+1;
    month = month < 10 ? '0' + month.toString() : month.toString();
    let day = today.getDate();
    let hours = today.getHours();
    let ymd = year+'-'+month+'-'+day;

    if(!date.trim().length){
		alert('날짜를 선택해주세요.');
		$('#date').focus();
		return;
	}

    // DB 조회 : date(날짜), table_num(4인석,8인석) 활용
	$.ajax({
		url: '<c:url value="/cafe/cafe_reserv"/>',
		type: 'get',
		data: {
			reservDate: date,
			cafeIdx: ${cafeInfo.cafeIdx},
			requestTable: table
		},
		dataType: 'json',
		success: function(list){
			//console.log(list);
			// 중복 생성 방지를 위한 자손 삭제
		    $('#person *').remove();
		    // 버튼 색상
	  		var color = table == 'four' ? 'btn-outline-danger' : 'btn-outline-primary';
		    var html = '<table class="reserv_table">'+'\n'+'<tr>'+'\n';
		    loop:
		    for(var i=10; i<20; i++) {
		    	if(i==15){
		            html += '</tr>'+'\n'+'<tr>'+'\n';
		        }
				if(list.length){
					for(var j=0; j<list.length; j++){
						if(date == ymd && i <= hours) {
							html += '<td><button type="button" class="btn btn-secondary rotate-hor-center" disabled="disabled">'+i+'시</button></td>'+'\n';
							continue loop;
						}
						if(i==list[j].reservTime && list[j].reservTable>=list[j].fixedTable) {
							html += '<td><button type="button" class="btn btn-secondary rotate-hor-center" disabled="disabled">'+i+'시</button></td>'+'\n';
							continue loop;
						}
					}
					html += '<td><button type="button" class="btn '+color+' rotate-hor-center" value='+i+' onclick="reservation('+i+', \''+table+'\');">'+i+'시</button></td>'+'\n';
				} else {
					if(date == ymd && i <= hours) {
						html += '<td><button type="button" class="btn btn-secondary rotate-hor-center" disabled="disabled">'+i+'시</button></td>'+'\n';
						continue loop;
					}
					html += '<td><button type="button" class="btn '+color+' rotate-hor-center" value='+i+' onclick="reservation('+i+', \''+table+'\');">'+i+'시</button></td>'+'\n';
				}
			}
		    html += '</tr>' + '\n' + '</table>';
		    $('#person').append(html);	
		}
	});
}


// 예약 리스트 생성
function reservation_list(table){

    // 날짜값
    var date = $('#date').val();

    if(!date.trim().length){
		alert('날짜를 선택해주세요.');
		$('#date').focus();
		return;
	}
        
    // DB 조회 : date(날짜), table_num(4인석,8인석) 활용
	$.ajax({
		url: '<c:url value="/cafe/cafe_reserv_list"/>',
		type: 'post',
		data: {
			reservDate: date,
			cafeIdx: ${cafeInfo.cafeIdx},
			requestTable: table
		},
		dataType: 'json',
		success: function(list){
			console.log(list);
			// 중복 생성 방지를 위한 자손 삭제
		    $('#person *').remove();
		    // 버튼 색상
	  		var color = table == 'four' ? 'btn-outline-danger' : 'btn-outline-primary';

	  		var html = '<table class="table table-striped fade-in" style="text-align: center; vertical-align: none;">'+'\n'+
			            '<tr>'+'\n'+
			            '<th>No</th>'+'\n'+
			            '<th>예약일</th>'+'\n'+
			            '<th>시간</th>'+'\n'+
			            '<th>예약자명</th>'+'\n'+
			            '<th>해당 시간 잔여 테이블</th>'+'\n'+
			            '<th>취소여부</th>'+'\n'+
			            '</tr>';
	  		
	  		console.log('리스트 길이 : '+list.length);
			if(list.length){
			    $.each(list, function(idx, reserv) {
			    	if(reserv.reservTable != 0){
			    	console.log('reserv.reservTable : ' +reserv.reservTable);
			        html += '<tr>'+'\n'+
				            '<td>'+(idx+1)+'</td>'+'\n'+
				            '<td>'+reserv.reservDate+'</td>'+'\n'+
				            '<td>'+reserv.reservTime+'시</td>'+'\n'+
				            '<td>'+reserv.memName+'</td>'+'\n';
				            if(reserv.reservTable >= reserv.fixedTable){
				            	html += '<td><span style="color: red;">'+reserv.reservTable+'</span> / <span style="color: red;">'+reserv.fixedTable+'</span></td>'+'\n';
				            } else {
				            	html += '<td><span style="color: blue;">'+reserv.reservTable+'</span> / <span style="color: red;">'+reserv.fixedTable+'</span></td>'+'\n';
				            }
				    html += '<td><button class="btn '+color+' rotate-hor-center my-2 my-sm-0" onclick="del_reserv('+reserv.reservIdx+','+reserv.stdFee+',\''+reserv.tid+'\');">취소</button></td>'+'\n'+      
				            '</tr>';
			    	}// else {
			    	//	html += '<tr></tr><tr></tr><td colspan="6"><h3>'+date+' 예약이 없습니다.</h3></td>';
			    	//	return true;
			    	//}
			    });
			} else if(!list.length){
				html += '<tr></tr><tr></tr><td colspan="6"><h3>'+date+' 예약이 없습니다.<h3></td>';
			}
			html += '\n' + '</table>';
			$('#person').append(html);
		}
	});
}



// 예약
function reservation(time, table){
	
	if(!loginmemidx){
		alert('로그인 후 사용이 가능합니다.');
		return;
	}
	
    // 날짜값
    var date = $('#date').val();
    if(!date.trim().length){
		alert('날짜를 선택해주세요.');
		$('#date').focus();
		return;
	}
	var person = 'four' == table ? 4 : 8;
	// 전달값 : 카페번호, 날짜, 시간, 인원, 멤버넘버
	if(confirm('예약정보 : '+date+' - '+time+':00 - '+person+'인석\n예약하시겠습니까?\n※당일 취소는 불가하니 주의하세요.')){
		
		// 카카오페이 결제
		$.ajax({
			url: '<c:url value="/cafe/cafe_payReserv"/>',
			type: 'post',
			data: {
				cafeIdx: ${cafeInfo.cafeIdx},
				memIdx: loginmemidx,
				reservDate: date,
				reservTime: time,
				requestTable: table,
				stdFee: ${cafeInfo.stdFee}
			},
			//dataType: 'json',
			success: function(data){
				//console.log('반환값: '+data);
				var popupWidth = 480;
				var popupHeight = 480;
				var popupX = (window.screen.width / 2) - (popupWidth / 2);
				var popupY= (window.screen.height / 2) - (popupHeight / 2);
				var options = 'top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no';
				window.open(data, '카카오페이 결제', options);
			},
			error: function(request,status,error){
				console.log('reservation_pay_erorr');
				//console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		})
		
	} else {
		alert('취소하였습니다.');
	}
 }	
		
/* 결제시 등록으로 변경
//예약값 DB 저장
function set_reservation(date, time, table){
	$.ajax({
		url: '<c:url value="/cafe/cafe_reserv"/>',
		type: 'post',
		data: {
			cafeIdx: ${cafeInfo.cafeIdx},
			memIdx: loginmemidx,
			reservDate: date,
			reservTime: time,
			requestTable: table
		},
		success: function(data){
			if(data = 1){
				alert('예약되었습니다.');
			} else {
				alert('오류가 발생하여 예약되지 않았습니다.\n잠시후 다시 시도해주세요.');
			}
			reservation_button(table);
		},
		error: function(e){
			console.log('reservation_erorr');
		}
	})
}
 */
  
  
// 예약 취소
function del_reserv(idx, stdFee, tid){
	if(confirm('취소하실 경우 복구할 수 없습니다.\n취소하시겠습니까?')){
		$.ajax({
			url: '<c:url value="/cafe/cafe_payCancel"/>',
			type: 'post',
			data: { 
				reservIdx: idx,
				stdFee: stdFee,
				tid: tid
			},
			success: function(result){
				if(result = 1){
					reservation_list('four');
					alert('예약이 취소되었습니다.');
				} else {
					reservation_list('four');
					alert('오류가 발생하여 실패했습니다.\n잠시 후 다시 시도해주세요.');
				}
			},
			error: function(e){
				console.log('del_reserv_erorr');
			}
		})
	} else {
		alert('취소되었습니다.');
	}
}
  
// 리뷰
function review(page){
	$.ajax({
		url: '<c:url value="/cafe/cafe_review"/>',
		type: 'get',
		data: { 
			currentPage : page,
			cafeIdx : ${cafeInfo.cafeIdx}
		},
		dataType: 'json',
		success: function(returnData){
			//console.log(returnData);
			var paging = returnData;
			var data = returnData.cafeReview;
			var html = '';
			var pagehtml = '';
			// 리뷰 출력
			if(data.length){
				$.each(data, function(idx, review) {	
					html += '<div class="media" id="rev_'+review.revIdx+'">'+'\n'+
							'<div class="media-left">'+'\n'+
							'<img src="<c:url value="/uploadfile/member/'+review.memPhoto+'"/>" class="media-object mr-3" style="width:45px; height:45px;">'+'\n'+
							'</div>'+'\n'+
							'<div class="media-body">'+'\n'+
							'<h4 class="media-heading">'+'\n'+review.nickName+'\n'+
							'<small><i class="ml-3">★'+'\n'+review.revRating+'</i></small>'+'\n'+
							'<small><i style="float: right;">'+review.revRegTimestamp+'</i></small></h4>'+'\n'+
							'<p>'+review.revContent+'</p>'+'\n';
					// 작성자와 로그인 아이디가 같으면 수정/삭제 추가
					if(loginmemidx == review.memIdx){
						html += '<ul><li style="float: right; margin-left: 10px;"><a class="mod_del" onclick="rev_del('+review.revIdx+');">삭제</a></li><li style="float: right; margin-left: 10px;"><a class="mod_del" onclick="remove_class('+review.revIdx+');">수정</a></li>'+'\n';
					}
					html += '</div>'+'\n'+'</div>'+'\n';
					// 리뷰 수정 폼  class="modify_rev_form"  
					if(loginmemidx == review.memIdx){
						html +=	'<form method="post" class="modify_rev_form" id="modify_rev_'+review.revIdx+'">'+'\n<hr>'+      
								'<div id="star" class="star-rating space-x-4 mx-auto"> '+'\n'+                  
								'<input type="radio" id="5-stars" name="revRating" value="5" v-model="ratings"/>'+'\n'+
								'<label for="5-stars" class="star pr-4">★</label>'+'\n'+
								'<input type="radio" id="4-stars" name="revRating" value="4" v-model="ratings"/>'+'\n'+
								'<label for="4-stars" class="star">★</label>'+'\n'+
								'<input type="radio" id="3-stars" name="revRating" value="3" v-model="ratings"/>'+'\n'+
								'<label for="3-stars" class="star">★</label>'+'\n'+
								'<input type="radio" id="2-stars" name="revRating" value="2" v-model="ratings"/>'+'\n'+
								'<label for="2-stars" class="star">★</label>'+'\n'+
								'<input type="radio" id="1-star" name="revRating" value="1" v-model="ratings" />'+'\n'+
								'<label for="1-star" class="star">★</label>'+'\n'+
								'</div>'+'\n'+
								'<input type="hidden" name="_method" value="put" id="delete_'+review.revIdx+'">'+'\n'+
								'<input type="hidden" name="revIdx" value="'+review.revIdx+'">'+'\n'+
								'<input type="hidden" name="cafeIdx" value="'+review.cafeIdx+'">'+'\n'+
								'<textarea class="form-control" id="rev_mod_textarea_'+review.revIdx+'" name= "revContent" rows="3"></textarea>'+'\n'+
								'<button class="btn btn-primary" type="button" onclick="add_class('+review.revIdx+');" style="float: right; margin: 10px; 0px;">닫기</button>'+'\n'+
								'<button class="btn btn-primary" type="button" onclick="rev_mod_submit('+review.revIdx+');" style="float: right; margin: 10px; 0px">작성</button>'+'\n'+
								'</form>'+'\n';
					}
					html += '<hr style="clear:both;">';
				});
			}
			if(!data.length){
				html += '<br><h5 style="text-align: center;">현재 등록된 리뷰가 없습니다. 여러분의 리뷰를 기다리고 있습니다!</h5><br><hr>';
			}
			$('.post_wrap').empty();
			$('.post_wrap').append(html);
		
			// 페이징
			pagehtml += '<nav aria-label="Page navigation example">'+'\n'+
						'<ul class="pagination justify-content-center" style="float: none;">'+'\n'+
						//'<li class="page-item disabled">'+'\n'+
						//'<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>'+'\n'+
						'</li>';
			if(paging.totalPage > 0){
				for(var i=1; i<=paging.totalPage; i++){
					pagehtml += '<li class="page-item"><a class="page-link" onclick="review('+i+');">'+i+'</a></li>';
				} 
			}
			//pagehtml += '<li class="page-item">'+'\n'+
			//			'<a class="page-link" href="#">Next</a>'+'\n'+
			//			'</li></ul></nav><br>';
			$('.paging').empty();
			$('.paging').append(pagehtml);
		},
		error : function(){
			alert('실패');
		},
		complete : function(){	
		}
	});
};
    

// 수정시 폼 생성
function remove_class(idx){
	$('#modify_rev_'+idx+'').removeClass('modify_rev_form');
};
// 수정폼 닫기
function add_class(idx){
	$('#modify_rev_'+idx+'').addClass('modify_rev_form');
};

// 삭제 클릭시
function rev_del(idx){
	if(confirm('삭제하시겠습니까?')){
		$('#delete_'+idx+'').attr("value", "delete");
		$('#modify_rev_'+idx+'').submit();
	}
};

// 리뷰 수정시 빈값 체크
function rev_mod_submit(idx){

	var revmodtext = $('#rev_mod_textarea_'+idx+'').val();

	// 점수 입력 확인
	if(!$('#modify_rev_'+idx+' :input:radio:checked').val()) {   
		alert('점수를 선택해 주세요.');
		return;
	}
	// 내용 입력 확인
	if(!revmodtext.trim().length){
		alert('내용을 입력해주세요.');
		$('#rev_mod_textarea_'+idx+'').focus();
		return;
	}
	// 폼 서밋
	$('#modify_rev_'+idx+'').submit();	
}

// 이미지 수정시 미리보기
function file(){
	$.ajax({
		url: '<c:url value="/cafe/fileDel"/>',
		type: 'post',
		data: {
			cafeIdx : ${cafeInfo.cafeIdx},
			memIdx : ${cafeInfo.memIdx}
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
						
					var path = cafe.cafeIdx+'/'+cafe.cafeImg;
					
					html += '<li file='+cafe.cafeImg+'>'+'\n'+
							'<img class="img-thumb" src="<c:url value="/uploadfile/cafe/"/>'+path+'"/>'+'\n'+
							'<button class="delete-btn btn btn-danger" onclick="delimg('+cafeImgIdx+', '+cafeIdx+', \''+cafeName+'\', \''+cafeImg+'\');">X</button>'+'\n'+
							'</li>';
				})
				$('.cvf_uploaded_files').empty();
				$('.cvf_uploaded_files').append(html);
			}
			if(list.length == 0){
				$('.cvf_uploaded_files').empty();
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



    


</head>

<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>

    <div class="cafe_wrap"> 
        <div class="info" id="info">
            <h5 class="info_menu" style="display: inline;">카페 소개</h5>
            <c:if test="${loginInfo.memIdx == cafeInfo.memIdx}">
            	<button type="button" class="btn btn-primary ml-2" style="display: inline; float: right;" data-toggle="modal" data-target="#info_image" onclick="file();">이미지 수정</button>
            	<button type="button" class="btn btn-primary ml-2" style="display: inline; float: right;" data-toggle="modal" data-target="#info_modify">정보 수정</button>
            </c:if>
            <hr class="first_hr">
            <!-- 사진영역 -->
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                <c:forEach var="cafeImg" items="${cafeImg}" varStatus="cnt">
                <c:if test="${cnt.first}">
                	<div class="carousel-item active">
                		<img class="d-block w-100" src='<c:url value="/uploadfile/cafe/"/>${cafeInfo.cafeIdx}/<c:out value="${cafeImg}"/>' alt="${cnt.count}">
                	</div>
                </c:if>
                <c:if test="${!cnt.first}">
                	<div class="carousel-item">
                		<img class="d-block w-100" src='<c:url value="/uploadfile/cafe/"/>${cafeInfo.cafeIdx}/<c:out value="${cafeImg}"/>' alt="${cnt.count}">
                	</div>
                </c:if>
                </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- 기본정보 영역 -->
            <div class="basic_info">
                <h1>${cafeInfo.cafeName}</h1>
                <h5>★ ${Math.round(cafeInfo.cafeRating * 100) / 100}/5</h5>
                <h5>${cafeInfo.cafeAddress}</h5>
                <div class="li_warp">
                    <ul>
                        <li>요금</li>
                        <li>1시간당 ${cafeInfo.stdFeeComma}</li>
                        <li>10분당 ${cafeInfo.tenPerFeeComma}</li>
                        <li>테이블 정보</li>
                        <li>4인석 : ${cafeInfo.fourTable}</li>
                        <li>8인석 : ${cafeInfo.grpTable}</li>
                        <li>영업시간 : ${cafeInfo.cafeTime}</li>
                        <li>연락처 : ${cafeInfo.cafeTel}</li>
                    </ul>
                    <!-- <button class="btn btn-outline-primary my-2 my-sm-0" data-toggle="modal" data-target="#gamelist">보유게임 리스트</button> -->
                </div>
            </div>  
        </div>
        <hr>   
        

        <div class="reservation" id="reservation">
            <h5 class="info_menu">예약</h5>
            <hr class="first_hr">
            <table class="reserv_table">
                <tr>
                    <td><input class="btn btn-outline-success datepicker-here" data-language="kr" type="text" id="date" placeholder="날짜 선택"></td>
                    <td><button type="button" id="btn_reservation_4" class="btn btn-outline-danger">4인석</button></td>
                    <td><button type="button" id="btn_reservation_8" class="btn btn-outline-primary">8인석</button></td>                    
                </tr>
            </table>

            <!-- 예약 버튼 생성위치 -->
            <div id="person"></div>
            </div> 
        <hr>   
        
        
        <div class="review" id="review">
            <h5 class="info_menu">리뷰</h5>
            <hr class="first_hr">

            <div class="post_wrap">
            </div>

            <!-- 페이징 -->
            <div class="paging">
            </div>
			<c:if test="${(!empty loginInfo) && (loginInfo.memIdx != cafeInfo.memIdx) && (loginInfo.memAuth != 'ban')}">
            <form method="post" id="rev_form">              
                <div id="star-rev" class="star-rating-rev space-x-4 mx-auto">                   
                    <input type="radio" id="5-stars-rev" name="revRating" value="5"/>
                    <label for="5-stars-rev" class="star-rev pr-4">★</label>
                    <input type="radio" id="4-stars-rev" name="revRating" value="4"/>
                    <label for="4-stars-rev" class="star-rev">★</label>
                    <input type="radio" id="3-stars-rev" name="revRating" value="3"/>
                    <label for="3-stars-rev" class="star-rev">★</label>
                    <input type="radio" id="2-stars-rev" name="revRating" value="2"/>
                    <label for="2-stars-rev" class="star-rev">★</label>
                    <input type="radio" id="1-star-rev" name="revRating" value="1"/>
                    <label for="1-star-rev" class="star-rev">★</label>
                </div>
				<input type="hidden" name="memIdx" value="${loginInfo.memIdx}">
				<input type="hidden" name="nickName" value="${loginInfo.nickName}">
                <textarea class="form-control" id="rev_textarea" name="revContent" rows="3" wrap="hard"></textarea>
                <button class="btn btn-primary" id="btn_rev_submit" type="button" style="float: right; margin-top: 10px;">작성</button>
            </form>
            </c:if>
        </div>
    </div>


	 <!-- 카페수정 Modal -->
	<c:if test="${loginInfo.memIdx == cafeInfo.memIdx}">
    <div class="modal fade" id="info_modify" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">카페정보 수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                <form action="<c:url value='/cafe/cafe_info'/>" method="post" id="cafeInfo_modify">
            	<input type="hidden" name="cafeIdx" value="${cafeInfo.cafeIdx}">
            	<!-- <input type="hidden" name="_method" value="put"> -->
                <label for="cafeAddress">카페 주소</label>
                <input type="text" name="cafeAddress" class="form-control mb-2" id="cafeAddress" value="${cafeInfo.cafeAddress}" placeholder="카페 주소">

				<label for="cafeTime">영업시간</label>
                <input type="text" name="cafeTime" class="form-control mb-2" id="cafeTime" value="${cafeInfo.cafeTime}" placeholder="00:00~00:00">
				
				<label for="stdFee">시간당 기본 요금</label>
                <input type="number" name="stdFee" class="form-control mb-2" id="stdFee" value="${cafeInfo.stdFee}" placeholder="시간당 기본 요금">
				
				<label for="tenPerFee">10분당 추가 요금</label>
                <input type="number" name="tenPerFee" class="form-control mb-2" id="tenPerFee" value="${cafeInfo.tenPerFee}" placeholder="10분당 추가 요금">
				
				<label for="fourTable">4인석 수</label>
                <input type="number" name="fourTable" class="form-control mb-2" id="fourTable" value="${cafeInfo.fourTable}" placeholder="4인석 수">
				
				<label for="grpTable">8인석 수</label>
                <input type="number" name="grpTable" class="form-control mb-2" id="grpTable" value="${cafeInfo.grpTable}" placeholder="8인석 수">
				
				<label for="cafeTel">카페 전화번호</label>
                <input type="text" name="cafeTel" class="form-control mb-2" id="cafeTel" pattern="^\d{3}-\d{3,4}-\d{4}$" value="${cafeInfo.cafeTel}" placeholder="000-0000-0000" required>
				<!--                 
				<label for="cafeThumbnail">썸네일 미리보기</label>
				<input type="file" name="cafeThumbnail" id="cafeThumbnail">	
				<div id="thumbnail" class="form-control mb-2">
				</div>
				        				
 				<label for="cafeImg">이미지 미리보기</label>
				<input type="file" multiple="multiple" name="cafeImg" id="cafeImg">
				<div id="preview" class="form-control mb-2">
				</div>
 				-->
			    <button type="button" id="btn_cafe_info_modify_submit" class="btn btn-primary col text-center mb-2">등록</button>
            </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="info_image" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">카페 이미 수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                
                <form action="<c:url value='/cafe/cafe_regImg'/>" method="post" enctype="multipart/form-data" id="regCafeImg">
                	<input type="hidden" name="_method" value="put">
                	<input type="hidden" name="cafeIdx" value="${cafeInfo.cafeIdx}">
            		<input type="hidden" name="memIdx" value="${cafeInfo.memIdx}">
            		
            		<label for="thumbnail_modify">썸네일 수정</label>
            		<input type="file" id="thumbnail_modify" name="cafeThumbnailFile" id="cafeThumbnailFile">
            		<br><br>
                	<label for="img_modify">이미지 수정</label>
					<input type="file" id="img_modify" name="cafeImgFile" multiple="multiple" class="mb-2" />
					<br><br>
               	 <input type="submit" class="btn btn-primary col text-center mb-2" value="등록" />
            	</form>
            	<div class ="form-group">
	                <br>
	                <label for="img_del text-muted">이미지 삭제</label>
	                <div class="thumnail form-control mb-2" id="img_del"> 
	                	<ul class="cvf_uploaded_files"></ul>
                	</div>
            	</div>
            	<!-- <button class="btn btn-secondary col text-center" value="취소" /></button> -->
            	<hr>

            </div>
            <div class="modal-footer">
            </div>
        </div>
        </div>
    </div>
    
    </c:if>


    <!-- 보드게임 리스트 Modal -->
    
    <div class="modal fade" id="gamelist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">보드게임 리스트</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
            
                보드게임리스트가 출력됩니다

            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
        </div>
    </div>
    

    <div>
        <ul style="position: fixed; top: 40%; right: 5%;">
            <li><a href="#info"><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; margin: 5px;">카페 소개</button></a></li>
            <li><a href="#reservation"><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; margin: 5px;">예약</button></a></li>
            <li><a href="#review"><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; margin: 5px;">리뷰</button></a></li>
        </ul>
    </div>

<script>

//정보 입력시 빈값 체크
$('#btn_cafe_img_submit').click(function(){

	// 폼 서밋
	$('#cafeImg_modify').submit();	
});
//정보 입력시 빈값 체크
$('#btn_cafe_info_modify_submit').click(function(){
	
	var cafeAddress = $('#cafeAddress').val();
	var cafeTime = $('#cafeTime').val();
	var stdFee = $('#stdFee').val();
	var tenPerFee = $('#tenPerFee').val();
	var fourTable = $('#fourTable').val();
	var grpTable = $('#grpTable').val();
	var cafeTel = $('#cafeTel').val();
	
	var timePattren = /^\d{2}:\d{2}~\d{2}:\d{2}/;
	var telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
	
	// 입력 확인
	if(!cafeAddress.trim().length) { 
		alert('주소을 입력해주세요.');
		$('#cafeAddress').focus();
		return;
	}
	if(!cafeTime.trim().length) {  
		alert('운영시간을 입력해주세요.');
		$('#cafeTime').focus();
		return;
	}
	if(!timePattren.test(cafeTime.trim())){
		alert('형식에 맞게 입력해주세요. (00:00~00:00)');
		$('#cafeTime').focus();
		return;
	}
	if(!stdFee.trim().length) {  
		alert('이용요금을 입력해주세요.');
		$('#stdFee').focus();
		return;
	}
	if(!tenPerFee.trim().length) { 
		alert('추가요금을 입력해주세요.');
		$('#tenPerFee').focus();
		return;
	}
	if(!fourTable.trim().length) { 
		alert('보유하고 있는 4인석을 입력해주세요.');
		$('#fourTable').focus();
		return;
	}
	if(!grpTable.trim().length) { 
		alert('보유하고 있는 8인석을 입력해주세요.');
		$('#grpTable').focus();
		return;
	}
	if(!cafeTel.trim().length) {
		alert('전화번호을 입력해주세요.');
		$('#cafeTel').focus();
		return;
	}
	if(!telPattern.test(cafeTel.trim())){
		alert('형식에 맞게 입력해주세요. (000-0000-0000)');
		$('#cafeTel').focus();
		return;
	}
	// 폼 서밋
	$('#cafeInfo_modify').submit();	
});


</script>

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

</body>

</html>


