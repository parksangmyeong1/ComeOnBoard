<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty loginInfo}">
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Come on, Board: my page</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		//내 기본 정보 가져오기
		$.ajax({
			url : '<c:url value="/member/"/>'+'${loginInfo.memIdx}',
			type : 'get',
			data : { memIdx : '${loginInfo.memIdx}'},
			async: false,
			success : function(data){
				if (data != null) {
					var preferGameList = data['preferGame'];
					var html ='';
					for(var i=0; i < preferGameList.length; i++){
						html += '<button class="btn_game" data-game="'+preferGameList[i].gameIdx+'">'+preferGameList[i].gameName+'</button>';
					}
					$('#Info_nickName').html(data.nickName);
					$('#Info_memGender').html(data.memGender);
					$('#Info_memBirth').html(data.memBirth);
					$('#Info_preferAddr').html(data.preferAddr);
				} 	$('#area_game').html(html);
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		
		//게임 정보로 이동하기
		$('.btn_game').off('click').on('click', function(){
			var gameIdx = $(this).attr('data-game');

			location.href = '<c:url value="/game/gamepage/"/>'+gameIdx;
		});
		
		/* 정보 불러올때 같이 가져옴
		//내 선호게임 리스트 가져오기
		$.ajax({
			url : '<c:url value="/members/"/>'+${loginInfo.memIdx}+'/game',
			type : 'get',
			success : function(data) {
				if (data.length>0) {
					//console.log(data);
				} 
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		}); */

		// 친구 리스트 불러오기 
		var friendList = getFriendList();
		
		// 친구  삭제하기 
		$('#btn_delete_friend').on('click', function(){
			if(confirm('정말 삭제하시겠습니까?')){
				var frIdx = $(this).attr('data-friend');
				var deleteUrl = '<c:url value="/friends/"/>'+frIdx;

				$.ajax({
					url : deleteUrl,
					type : 'delete',
					data : {
						memIdx : '${loginInfo.memIdx}',
						frIdx : frIdx
						},
					success : function(data) {
						if (data>0) {
							alert('친구 삭제가 완료되었습니다.');
							$('#area_friend_info').addClass('display_none');
							getFriendList();
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
		
		// 친구 목록으로 이동
		$('#extra_friend_view').on('click',function(){
			var url = '<c:url value="/members/"/>'+'${loginInfo.memIdx}'+"/friends";
			$('#form_memIdx').attr("action", url);
			$('#form_memIdx').submit();
		});
		
		// 프로필 사진 변경 화면 띄우기
		$('#btn_update_photo').on('click', function(){
			$('#area_update_photo').removeClass('display_none');
			
			// 기본 사진으로 변경
			$('#btn_memPhoto_default').on('click', function(){
				var loginInfo = '${loginInfo}';
				$.ajax({

					url : '<c:url value="/member/deleteMemPhoto"/>',
					type : 'post',
					data : loginInfo,
					success : function(data) {
						if (data > 0) {
							alert('정상적으로 변경 되었습니다.');
							location.reload();
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});	
			});
			
			// 프로필 사진 변경
			$('#btn_updateMemphoto').on('click', function(){
				var newMemPhoto = $('#input_memberphoto').prop('files')[0];
				if(newMemPhoto==null){
					alert('사진을 선택해주세요.');
				}else{
					var formData = new FormData();
					formData.append('newMemPhoto', newMemPhoto);
					var photoPath = '<c:url value="/uploadfile/member"/>'
					
					$.ajax({
						url : '<c:url value="/member/updateMemPhoto"/>',
						type : 'post',
						data : formData,
						processData : false,
						contentType : false,
						cache : false,
						enctype : 'multipart/form-data',
						success : function(data) {
							if (data != null) {
								alert('정상적으로 변경  되었습니다.');
								$('#area_update_photo').addClass('display_none');
								location.reload();
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
		});  // 프로필 사진 관리 end
		
		// 비밀번호 변경
		$('#btn_update_password').on('click', function(){
			var pwCheck = false;
			var pwEqCheck = false;
			$('#area_update_password').removeClass('display_none');
			$('#oldPassword').focusin(function(){
				$('#msg_oldPw').html(''); 
			});
			$('#oldPassword').focusout(function(){
				$.ajax({
					url : '<c:url value="/member/pwCheck"/>',
					type : 'post',
					data : {
						memId : '${loginInfo.memId}',
						memPassword : $('#oldPassword').val()
					},
					success : function(data) {
						if (data) {
							$('#msg_oldPw').html('비밀번호가 일치합니다.');
							$('#msg_oldPw').addClass('color_blue');
							$('#msg_oldPw').removeClass('color_grey');
							$('#msg_oldPw').removeClass('color_red');
							pwCheck = true;
						} else {
							$('#msg_oldPw').html('비밀번호가 일치하지 않습니다.<br>다시 입력해주세요.');
							$('#msg_oldPw').addClass('color_red');
							$('#msg_oldPw').removeClass('color_grey');
							$('#msg_oldPw').removeClass('color_blue');
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});	
			});
			
			// ----------------------------------------------------------
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
			$('#memRePw').focusin(function(){
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
					$('#msg_repw').removeClass('color_red');
					pwEqCheck = true;
				} else {
					$('#msg_repw').removeClass('display_none');
					$('#msg_repw').html('비밀번호가 일치하지 않습니다.');
					$('#msg_repw').addClass('color_red');
					$('#msg_repw').removeClass('color_grey');
					$('#msg_repw').removeClass('color_blue');
					pWEqCheck = false;
				}
				
			});
			
			// ----------------------------------------------------------
			$('#btn_updatePassword').on('click', function(){
				if(pwCheck){
					if(pwEqCheck){
						var oldPw = $('#oldPassword').val();
						var newPw = $('#memPassword').val();
						
						if(oldPw == newPw){
							alert('기존 비밀번호와 같은 비밀번호로 변경할 수 없습니다.');
						} else {
							$.ajax({
								url : '<c:url value="/member/updatePw"/>',
								type : 'post',
								data : {
									memId : '${loginInfo.memId}',
									memPassword : $('#memPassword').val()
								},
								success : function(data) {
									if (data>0) {
										alert('비밀번호가 변경되었습니다.');
										$('#area_update_password').addClass('display_none');
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
					} else {
						alert('새로운 비밀번호가 일치한지 확인해주세요.');
					}
	
				} else {
					alert('기존 비밀번호를 먼저 확인해주세요.');
				}
			});
			
		});
		
		
		// 아이디 탈퇴
		$('#btn_deletMember').on('click', function(){
			var memIdx = ${loginInfo.memIdx}
			var chk_delete = confirm('정말 삭제하시겠습니까?');
			if(chk_delete){
				$.ajax({
					url : '<c:url value="/member/delete"/>',
					type : 'post',
					data : {
						memIdx : memIdx
					},
					success : function(data) {
						if (data > 0) {
							alert('정상적으로 탈퇴 처리 되었습니다.');
							location.href ='<c:url value="/"/>';
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
		
		// 정보 수정
		$('#btn_update_profile').click(function(){
				$.ajax({
					url: '<c:url value="/members/login/"/>'+'${loginInfo.memIdx}',
					type : 'get',
					dataType: 'json',
					success : function(myInfo) {
						if (myInfo != null) {
							$('#nickName').val(myInfo.nickName);
							$('#memEmail').val(myInfo.memEmail);
							$('#preferAddr').val(myInfo.preferAddr);
							$('#memTel').val(myInfo.memTel);
							var memBirth = myInfo.memBirth;
							if(memBirth != null){
								var memBirthArray = memBirth.split('-');
								var year = memBirthArray[0];
								$('#year').val(year);
								var month = memBirthArray[1];
								$('#month').val(month);
								var day = memBirthArray[2];
								$('#day').val(day);
							}
							$('.genderSelect').val(myInfo.memGender).attr("selected", "selected");
						
						} else {
							alert('다시 시도해주세요.');
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});
				


			$('#update_my_info').removeClass('display_none');
		
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
			
		});
			
			
			 $('#btn_updateMember').click(function(){
				var memIdx = '${loginInfo.memIdx}'
				var nickName = $('#nickName').val();
				var updateYear = $('#year').val();
				var updateMonth = $('#month').val();
				var updateDay = $('#day').val();
				var memGender = $('#memGender').val();
				var memEmail = $('#memEmail').val();
				var memTel = $('#memTel').val();
				var preferAddr = $('#preferAddr').val();
				var updateRequest = { 
						memIdx : memIdx,
						nickName : nickName,
						year : updateYear,
						month : updateMonth,
						day : updateDay,
						memGender : memGender,
						memEmail : memEmail,
						memTel : memTel,
						preferAddr : preferAddr
				}
			
				$.ajax({
					url: '<c:url value="/member/updateMember"/>',
					type : 'post',
					data : JSON.stringify(updateRequest),
					contentType : 'application/json',
					dataType: 'json',
					success : function(profile) {
						if (profile != null) {
							alert('정보가 변경되었습니다.');
							
							$('#Info_nickName').html(profile.nickName);
							$('#Info_memBirth').html(profile.memBirth);
							$('#Info_memGender').html(profile.memGender);
							$('#Info_memEmail').html(profile.memEmail);
							$('#Info_preferAddr').html(profile.preferAddr);
							$('#update_my_info').addClass('display_none');
						
						} else {
							alert('다시 시도해주세요.');
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					}
			});
			return false;

		});
		
		// 멤버의 권한을 카페로 변경
	 	$('#btn_change_auth_cafe').on('click', function(){
	 		$.ajax({
	 			url: '<c:url value="/member/"/>'+'${loginInfo.memIdx}'+'/auth',
	 			type: 'put',
	 			data: {'memAuth' : 'cafe'},
	 			async: false,
	 			success: function(data){
	 				if(data>0){
	 					alert('카페회원으로 변경되었습니다.');
	 					location.reload();
	 				}
	 			},
	 			error : function(request, status, error) {
					alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
					console.log(request);
					console.log(status);
					console.log(error);
				}
	 		});
	 		
	 	});
		$('#btn_send_msg').click(function(){
			location.href = '/cob/member/msgpage';
		});
		$('.btn_close').click(function(){

			$(this).parent().addClass('display_none');
		});
	});
</script>
</head>
<style>

    @keyframes gradient {
        0% {
        background-position: 0% 50%;
        }
        50% {
        background-position: 100% 50%;
        }
        100% {
        background-position: 0% 50%;
        }
    }

    .MultiBar a {
        color: white;
    }
    body {
        background-color :rgb(245, 246, 247);
    }
    ul {
        list-style: none;
    }
    header {
        position: relative;
        z-index: 20;
        min-width: 980px;
        width: 100%;
        height: 140px;
        background-color: rgb(66, 133, 244);
        text-align: center;
    }
    .MultiBar {
        display: inline-block;
        height: 30px;
        width: 100%;
        max-width: 1280px;
        padding: 12px 0px 5px;
    } 

    .area_gnb {
        font-size: 12px;
        width: 500px;
        height: 30px;
        float: right;
        color: white;
    }

    .area_gnb>li {
        float: right;
        width: 75px;
    }

    .container {
        display: inline-block;
        height: 93px;
        width: 100%;
        max-width: 1280px;
        position: relative;
    }

    .logo {
        position: absolute;
        left: 50%;
        width: 180px;
        margin-left: -90px;
    }


    .main_naviwrap {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-width: 1280px;
        height: 80px;
        margin-top: -98px;
        padding-bottom: 10px;
    }
    .main_nav {
        padding-top: 45px;
    }
    .main_nav>.left_ul {
        float: left;
        overflow: hidden;
    }
    .main_nav>.right_ul {
        float: right;
        overflow: hidden;
    }

    .main_nav>ul>li {
        color: white;
        width: 85px;
        float: left;
    }

    .content {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-width: 1280px;
    }

    footer {
        width: 100%;
        height: 100px;
        background-color: grey;
    }

    .content_wrap {
        width: 100%;
        height: 100%;
        overflow:hidden;
    }

    #menu_wrap {
        margin-top: 50px;
    }
    .content_menu {
        display: inline-block;
        width: 880px;
        height: 650px;
        overflow: hidden;
    }

    .content_menu>ul>li {
        display: block;
        float: left;
        width: 50%;
        height: 320px;
    }

    .content_menu a {
        position: relative;
        width: 420px;
        height: 300px;
        display: block;
        margin: 0 0 20px 20px;
        text-align: center;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
        
    }

    .content_menu img{
        margin-top: 80px;
        margin-bottom: 30px;
        width: 100px;
    }

    .area_select_menu_big:hover{
        background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
        background-size: 400% 400%;
        color: white;
        animation: gradient 2s ease infinite;
    }

    .menu_wrap {
        margin: 0 auto;
        height: 100%;
        width: 1000px;
        padding: 50px;
    }

    .menu_wrap ul {
        height: 1360px;
    }

    .menu_wrap li {
        width: 500px;
        height: 350px;
        float: left;
    }
    .mypage_menu {
        position: relative;
        width: 420px;
        height: 270px;
        display: block;
        margin: 0 0 20px 20px;
        text-align: center;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
        padding: 20px;        
    }

    .mypage_menu h2 {
        font-size: 20px;
        margin-bottom: 30px;
    }

    #profile_frame {
        margin-left: 20px;
        width: 120px;
        height: 120px;
        border-radius: 50%;
        overflow:hidden;
        display: block;
        float: left;
    }

    .photo {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .member_profile {
        float:right;
        display: block;
        width : 250px;
        height: 120px;
        text-align: left;
    }

    .member_profile td {
        width: 120px;
        height: 25px;
    }

    .area_update_profile {
        float: right;
        margin-top: 10px;
        margin-right: 15px;
      
    }

    button {
        width: 90px;
        height: 40px;
        border: none;
        background-color: rgb(66, 133, 244);
        border-radius: 10%;
        color: white;
    }

    .message_table {
        margin-left: 10px;
    }

    .message_table td {
        text-align: left;
        width: 100px;
    }

    .message_text {
        width: 300px !important;
    } 

    .area_select_menu,
    .select {
        margin: 0 20px;
        float: left;
        width: 160px;
        height: 160px;
        border-radius: 10%;
        line-height: 160px;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
    }
    
   	.area_select_menu_big {
        margin: 0 40px;
        float: left;
        width: 320px;
        height: 160px;
        border-radius: 10%;
        line-height: 160px;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
    	background-color: white;
    	color: black;
    	font-size: 16px;
    }

    .area_select_menu:hover,
    .select:hover {
        background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
        background-size: 400% 400%;
        color: white;
        animation: gradient 2s ease infinite;       
    }
    
    #reserve_cafe {
        text-align: left;
    }

    #cafeName {
        width: 170px;
    }

    #cafeLoc {
        width: 70px;
    }
    
    #cafeStartTime {
        width: 100px;
    }

    #reserve_cafe button {
        width: 80px;
        height: 30px;
    }

    #friends {
        text-align: left;
    }
    .friend_nickname {
        width: 250px;
        padding-left: 20px;
        font-weight: 500;
        font-size: 18px;
    }

    .friend_photo {
        width : 100%;
        height: 100%;
    }

    .friend_profile_frame {
        width: 45px;
        height: 45px;
        border-radius: 70%;
        overflow:hidden;
        display: block;
        float: left;      
    }

    #friends button{
        width: 90px;
        height: 40px;
    }

    .extra_view {
        margin-top: 3px;
        margin-right: 10px;
        float: right;
        background-color: rgb(251,188,5);
        color: black;
    }

    #area_friend_info {
        position: absolute;
        width: 400px;
        height: 400px;
        background-color: rgb(245, 246, 247);
        border-radius: 10px;
        z-index: 50;
    }
    
   #area_friend_info table{
		display: block;
        width: 300px;
		margin: 15px auto;
    }

    .area_friend button {
        margin-top: 10px;
    }

    .col1 {
        color: rgb(66, 133, 244);
        width: 100px;
        height: 30px;
        line-height: 30px;
        background-color: white;
        border-radius: 5px;
        border:rgb(66, 133, 244) 1px solid;
    }

    .col2 {
        width: 160px;
        height: 30px;
    }

    #friend_info_profile_frame {
        margin: 15px auto;
        width: 100px;
        height: 100px;
        border-radius: 70%;
        overflow:hidden;
        display: block;      
    }

    #update_my_info {
        width: 800px;
        height: auto;
        position: absolute;
        border-radius: 10px;
        background-color: #eee;
        z-index: 50;
        padding-top: 50px;
        padding-bottom: 50px;
    }

    .display_none {
        display: none;
    }
    
    #update_profile:hover {
        cursor: pointer;
    }

    .block {
        height: auto;
        display: block;
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

    .form_update_profile {
        margin: 0 auto;
        text-align: left;
        position: relative;
        display: block;
        width: 400px;
        height: auto;
    }

    .form_create_id h2 {
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
    
    .area_update_profile {
    	width: 400px;
    	height: 60px;
    }
    #area_update_photo {
    	width: 400px;
        height: auto;
        position: absolute;
        border-radius: 10px;
        background-color: #eee;
        z-index: 50;
        padding-top: 50px;
        padding-bottom: 50px;
    } 
    
    #frame_update_photo {
        margin:0 auto;
        width: 200px;
        height: 200px;
        border-radius: 50%;
        overflow:hidden;
        display: block;
    }
    
    #btn_photo {
	    display: block;
	    margin: 15px auto;
	    background-color: rgb(251,188,5);
	    width: 280px;
	    height: 48px;
	    font-size: 16px;
	    border: none;
	    margin-bottom: 10px;
	    border-radius: 10px;
	    text-align: center;
	    line-height: 48px;
   	}
   	
   	#input_memberphoto {
   		display: none;
   	}
    
    button:hover {
    	cursor: pointer;
    }
    
    #area_update_password {
    	width: 400px;
        height: auto;
        position: absolute;
        border-radius: 10px;
        background-color: #eee;
        z-index: 50;
        padding-top: 50px;
        padding-bottom: 50px;

    }
    
    #area_update_password input {
    	width: 300px;
    	height: 30px;
    	border: none;
    }
    #area_update_password form {
		width: 300px;
		margin: 0 auto;
    }
    #area_update_password div {
		width: 300px;
		height: 100%;
		text-align: left;
    }
    
    .friend_photo {
    	width: 100%;
    	height: 100%;
    }
    
    #table_friend {
    	text-align: left;
    }
    
    #table_friend td{
    	border-bottom: 1px solid #aaa;
    }
    .btn_game {
    	width: 100px;
    	height: 150px;
    	font-size: 20px;
    	color: black;
    	background-color: white;
    	border : rgb(52, 168, 83) 1px solid;
    	margin: 15px;
    }
    
    #btn_change_auth_cafe {
	    margin: 10px;
	    background-color: rgb(52, 168, 83);
    	float: left;
    }
</style>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
   <div class="content">
        <div class="menu_wrap">
                <ul>
                    <li>
                        <div class="mypage_menu">
                            <h2>내 정보</h2>
                            <div id="profile_frame">
                                <img id="memberphoto" class="photo" src="<c:url value='/uploadfile/member/'/>${loginInfo.memPhoto}">
                            </div>
                            <div id="test"class="member_profile">
                                <table>
                                    <tr>
                                        <td>별 명</td>
                                        <td id="Info_nickName"></td>
                                    </tr>
                                    <tr> 
                                        <td>성 별</td>
                                        <td id="Info_memGender"></td>              
                                    </tr>
                                    <tr>
                                        <td>생년월일</td>
                                        <td id="Info_memBirth"></td>
                                    </tr>
                                    <tr> 
                                        <td>선호 지역</td>
                                        <td id="Info_preferAddr" class="my_info"></td>                   
                                    </tr>
                                </table>
                            </div>
                            <div class="area_update_profile">
                	            <button id="btn_update_photo">사진 변경</button>
                            	<button id="btn_update_password">비밀번호 변경</button>
                                <button id="btn_update_profile">정보 수정</button>
                                <button id="btn_deletMember">탈퇴</button>
                                <c:if test="${loginInfo.memAuth ne 'cafe'}">
                               	 <button id="btn_change_auth_cafe" type="button">카페 회원으로 전환</button>
                                </c:if>
                            </div>
                            <div id="area_update_photo" class="display_none">
                            	<div id="frame_update_photo">
                            		 <img id="update_memberphoto" class="photo" src="<c:url value='/uploadfile/member/'/>${loginInfo.memPhoto}">
                            	</div>
                            		<label id="btn_photo" for="input_memberphoto">사진 업로드</label>
		                        	<input type="file" id="input_memberphoto" name="memPhoto" onchange="readURL(this);">                
		                        <button id="btn_memPhoto_default" type="button">기본사진으로</button>
		                        <button id="btn_updateMemphoto" type="button">수정하기</button>
		                        <button class="btn_close">창닫기</button>
                            </div>
                            <div id="area_update_password" class="display_none">
                            	<form>
                            		<h2>비밀번호 변경</h2>
                            		<div class="input_area">
                                        <p>기존 비밀번호</p>
                                        <input type=password id="oldPassword">
                                        <span id="msg_oldPw" class="msg"></span>
                                    </div>
                                    <div class="input_area">
                                        <p>변경할 비밀번호</p>
                                        <input type=password id="memPassword">
                                        <span id="msg_pw" class="msg color_grey"> 영문, 숫자, 특수문자 조합, 8-12자리</span>
                                    </div>
                                    <div class="input_area">
                                        <p>변경할 비밀번호 확인</p>
                                        <input type=password id="memRePw">
                                        <span id="msg_repw" class="msg color_grey"></span>
                                    </div>
                            		
                            	</form>
                                <button id="btn_updatePassword" type="button">변경하기</button>
                                <button class="btn_close">창닫기</button>
                            </div>
                            <div id="update_my_info" class="display_none">
                                    <form class="form_update_profile" method="post">
                                        <h2>내 정보 수정</h2>

                                        <div class="input_area">
                                            <p>닉네임</p>
                                            <input type="text" id="nickName" class="input_row">
                                        </div>
                        
                                        <div class="input_area">
                                            <p>생년월일</p>
                                            <input class="input_num" id="year" name="year" type="number" placeholder="년"><input class="input_num" type="number" id="month" name="month" placeholder="월"><input class="input_num" type="number" id="day" name="day" placeholder="일">
                                        </div>
                        
                                        <div class="input_area">
                                            <p>성별</p>
                                            <select class="genderSelect" id="memGender">
                                                <option value="남자">남자</option>
                                                <option value="여자">여자</option>
                                            </select>
                                        </div>
                        
                                        <div class="input_area">
                                            <p>본인 확인 이메일</p>
                                            <input type="text" id="memEmail" class="input_row" value="">
                                        </div>
                        
                                        <div id="phoneNum_input" class="input_area">
                                            <p>휴대전화</p>
                                            <input type="text" id="memTel" class="input_phoneNum" value="">
                                            <button>인증번호 받기</button>
                                            <input type="text" class="input_row" placeholder="인증번호 입력">
                                        </div>
                        
                                        <div id="address_area" class="input_area">
						                   <p>선호 지역(주소 선택시 구까지 자동 입력)</p>
						                   <input type="text" id="postCode" name="postCode" class="input_address" placeholder="우편 번호" readonly>
						                   <button id="btn_address" type="button">우편 번호</button>
						                   <input type="text" id="addr" name="addr" class="input_row" placeholder="주소" readonly>
						                   <input type="text" id="preferAddr" class="input_row" placeholder="선호 지역" readonly>
						                 </div>
                                    </form>
                                    <button id="btn_updateMember" type="button">수정하기</button>
                                    <button class="btn_close">창닫기</button>
                            </div>

                        </div>
                    </li>
                    <c:if test="${loginInfo.memAuth eq 'cafe'}">
						<li>
                        <div class="mypage_menu">
                            <h2>카페 관리</h2>
                            <div>
                            	<div onclick="" class="select">카페 등록</div>
                            	<div onclick="" class="select">카페 관리</div>
                            </div>
                            
                        </div>
                    </li>
					</c:if>
                    
                    <li>
                        <div id="area_friend" class="mypage_menu">
                            <h2>친구 관리</h2>
                            <div id="area_friend_info" class="display_none">
                                <div id="friend_info_profile_frame">
                                </div>
                                <table>
                                    <tr>
                                        <td class="col1">닉네임</td>
                                        <td id="friend_nickName" class="col2"></td>
                                    </tr>
                                    <tr>
                                        <td class="col1">생 일</td>
                                        <td id="friend_memBirth" class="col2"></td>
                                    </tr>
                                    <tr>
                                        <td class="col1">성 별</td>
                                        <td id="friend_memGender" class="col2"></td>
                                    </tr>
                                    <tr>
                                        <td class="col1">선호게임</td>
                                        <td id="friend_preferGame" class="col2"></td>
                                    </tr>
                                    <tr>
                                        <td class="col1">선호지역</td>
                                        <td id="friend_preferAddr" class="col2"></td>
                                    </tr>
                    
                                </table>
                                <button id="btn_send_msg">쪽지보내기</button>
                                <button id="btn_delete_friend" class="display_none">친구 삭제</button>
                                <button class="btn_close">창닫기</button>
                            </div>
                            <table id="table_friend">
                            </table>
                            <button id="extra_friend_view" class="extra_view">더 보기</button>
                            
                            
                        </div>
                    </li>
                    
                    <li>
                        <div class="mypage_menu">
                                                        
                            <h2>내 게임</h2>
 							<div id="area_game">
 							</div>
 							<button id="extra_game_view" class="extra_view" onclick="location.href='<c:url value="/game/gamelist/"/>'">더 보기</button>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>구입한 게임 목록</h2>
                            	 <a id="my_post" href="<c:url value='/game/gameorderlist/${loginInfo.memIdx}'/>" class="area_select_menu_big"><div>결제 정보 보기</div></a>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>모임 관리</h2>
                            <a id="make_group" href="#" class="area_select_menu_big"><div>내 모임 관리</div></a>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>내 글 관리</h2>
                            	 <a id="my_post" href="<c:url value='/post/searchList1?memIdx=${loginInfo.memIdx}'/>" class="area_select_menu_big"><div>내가 쓴 글</div></a>
                        </div>
                    </li>

                    <li>
                        <div class="mypage_menu">
                            <h2>예약 관리</h2>
                           		<button type="button" class="area_select_menu_big" onclick="myReservation()">내 예약 관리</button> 
                    
                        </div>
                   	</li>

                    
                </ul>
        <form id="form_memIdx" method="post"><input name="memIdx" type="hidden" value="${loginInfo.memIdx}"></form>
        </div>

    </div>

</body>
<script> 
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('update_memberphoto').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('update_memberphoto').src = "";
	  }
	}
</script>
<script>
	//친구 리스트 불러오기
	function getFriendList(){
		var friendList = null;
		var url = '<c:url value="/members/"/>'+'${loginInfo.memIdx}'+"/friends/follow";
		$.ajax({
			url: url,
			type : 'get',
			data : {memIdx : '${loginInfo.memIdx}'},
			dataType: 'json',
			async: false,
			success : function(data) {
				console.log(data);
				friendList = data;
				$('#table_friend').empty();
				$.each(data, function(index, item){
					if(index > 2) {return false};
					var html = '<tr>';
                    html += '<td class="friend_memPhoto">'
                    html += '<div class="friend_profile_frame">'
                    html += '<img class="friend_photo" src="<c:url value="/uploadfile/member/"/>'+item.memPhoto+'">'
                    html += '</div>'
                   	html += '</td>'
                   	html += '<td class="friend_nickname">'+item.nickName+'</td>'
                   	html += '<td><button class="btn_read_friend" data-friend="'+item.memIdx+'">정보 보기</button></td>'
                   	html += '</tr>'
                   		
                   	$('#table_friend').append(html);
					});	
				
				

			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
		
		$('.btn_read_friend').on('click', function(){
			$('#area_friend_info').removeClass('display_none');
			var frIdx = $(this).attr('data-friend');
			
			var friend = friendList.find((friend) => {
				return friend.memIdx == frIdx;
			});
			
			var memPhoto = friend.memPhoto;
			$('#friend_info_profile_frame').html('<img class="photo" src="<c:url value="/uploadfile/member/"/>'+friend.memPhoto+'">')
			$('#friend_nickName').html(friend.nickName);
			$('#friend_memBirth').html(friend.memBirth);
			$('#friend_memGender').html(friend.memGender);
			if(friend.preferGame.length>0){
				$('#friend_preferGame').html(friend.preferGame[0].gameName);	
			}
			$('#friend_preferAddr').html(friend.preferAddr);
			$('#btn_delete_friend').attr('data-friend', frIdx);		
			$('#btn_delete_friend').removeClass('display_none');
			$('#btn_reg_friend').addClass('display_none');
			$('#btn_send_msg').attr('data-friend', frIdx);
		});
		
		
		
		return friendList;
	}
	

</script>
<script>
function myReservation(){
	var reserv_url = '<c:url value="/cafe/cafe_reserv_myList"/>';
		var popupWidth = 1000;
		var popupHeight = 600;
		var popupX = (window.screen.width /2) - (popupWidth /2);
		var popupY= (window.screen.height /2) - (popupHeight /2);
		var options = 'top='+popupY+', left='+popupX+', width='+popupWidth+', height='+popupHeight+', status=no, menubar=no, toolbar=no, resizable=no';
		window.open(reserv_url, '내 예약정보', options);	
}
</script>
</html>