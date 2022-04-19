<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- css and image -->
<link rel="stylesheet" href="/cob/css/postReg.css">
<link rel="stylesheet" href="/cob/css/default.css">
<link rel="icon" href="/cob/images/simple_logo.png">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<link href="/js/summernote-ko-KR.js">
<title>Come on, Board : 게시글 등록</title>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder: '내용을 입력해주세요',
		    minHeight: 500,             // 최소 높이
		    maxHeight: null,            // 최대 높이
		    focus: true,                // 에디터 로딩후 포커스를 맞출지 여부
		    lang: "ko-KR",				// 한글 설정
		    /* callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
			            sendFile(files[i], this);
					}
		        }
			} */
		});
		/* function sendFile(files, el) {
			var form_data = new FormData();
			form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '/uploadSummernoteImageFile',
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	          		$(el).summernote('editor.insertImage', img_name);
	          		console.log('성공');
	        	},
	        	error: function(){
	        		console.log('에러');
	        	}
	      	});
	    }
		 */
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<div class="Wrapper">
		<div id="content">
			<div class="WritingWrap">
				<div class="WritingHeader">
					<h2 class="title">게시판 글쓰기</h2>
					<input id="subBtn" type="button" value="등록" class="upload_contents" form="postForm" onclick="goWrite(this.form)" />
				</div>
				<div class="write_contents">
					<form id="postForm" method="post">
						<div class="articlecate">
							<select name="postSort" placeholder="카테고리" style="width: 100px; height: 30px">
								<option value="잡담">잡담</option>
								<option value="질문">질문</option>
								<option value="후기">후기</option>
								<option value="게임TIP">게임TIP</option>
								<option value="지역">지역</option>
								<option value="기타">기타</option>
								<option value="공지">공지</option>
							</select>
						</div>
						<input type="text" name="postTitle" class="postTitle" placeholder="제목" /> <br>
						<textarea id="summernote" name="postContent"></textarea>
						<input type="hidden" name="memIdx" style="width: 20%;" placeholder="멤버 idx" value="${loginInfo.memIdx }" /><br> 
						<input type="hidden" name="postWriter" style="width: 20%;" placeholder="작성자" readonly value="${loginInfo.nickName }" /><br>
						<!-- <input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function goWrite(frm) {
			var postTitle = frm.postTitle.value;
			var postWriter = frm.postWriter.value;
			var postContent = frm.postContent.value;
			
			if (postTitle.trim() == ''){
				alert("제목을 입력해주세요");
				return false;
			}

			if (postContent.trim() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
	</script>
</body>
</html>