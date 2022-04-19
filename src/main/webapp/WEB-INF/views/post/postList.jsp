<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Come on, Board : 게시판</title>
<c:if test="${ param.deleteResult eq 1 }">
	<script>
		alert('해당 게시물이 삭제되었습니다.');
	</script>
</c:if>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>
<link rel="stylesheet" href="/cob/css/postList.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e743b6daa20e101e0afb710dae9965b3&libraries=services,clusterer,drawing"></script>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<div id="container">
        <div class="Wrapper">
            <!-- sidebar -->
            <div class="sidebar">
                <div class="floating-banner">
                    <ul class="tabs">
                        <li class="shortcut_title">
                            <a href="#">단축키<img src="/cob/images/shortkey.png"></a>
                        </li>
                    </ul>
                    <ul class="tab-contents-container">
                        <div class="tab-contents" id="tab1-contents">
                            <ul class="shortcut_keys">
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/1.png"/>회사소개</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/2.png"/>모임</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/3.png"/>게시판</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/4.png"/>자유게시판</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/5.png"/>잡담게시판</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/6.png"/>카페</a></li>
                                <li><a href="#"><img src="https://img.icons8.com/color/48/000000/7.png"/>게임</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
            <div id="content">
                <!-- contents -->
                <div class="contents">
                    <div class="board_header">
                        <h2><a href="<c:url value='/post/postList' />">COB 게시판</a></h2>
                    </div>
                    <div class="board_nav">
                        <div class="nav_left">
                            <a class="home" href="<c:url value='/post/postList' />">
                                <img src="https://img.icons8.com/material-outlined/24/000000/home-page.png"/>
                            </a>
                            <a href="<c:url value='/post/postList' />" style="margin-right:5px;">전체</a>
                        </div>
                        <div class="nav_right">
                            <li><a href="<c:url value='/post/searchList?postSort=잡담&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#003f7f" >잡담</a></li>
                            <li><a href="<c:url value='/post/searchList?postSort=질문&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#007fff" >질문</a></li>
                            <li><a href="<c:url value='/post/searchList?postSort=후기&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#00bf5f" >후기</a></li>
                            <li><a href="<c:url value='/post/searchList?postSort=게임TIP&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#4f007c" >게임TIP</a></li>
                            <li><a href="<c:url value='/post/searchList?postSort=지역&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#ffaaaa" >지역</a></li>	
                            <li><a href="<c:url value='/post/searchList?postSort=기타&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#000000" >기타</a></li>
                            <li><a href="<c:url value='/post/searchList?postSort=공지&nowPage=1&cntPerPage=${paging.cntPerPage}'/>" style="color:#ff0000" >공지</a></li>
                            <li onclick="viewBlog()" style="color:#4fda00; cursor:pointer;">블로그 리뷰</li>
                        </div>
                        <div>
                            <select id="cntPerPage" name="sel" onchange="selChange()" class="dataPerPage">
								<option value="20"
									<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
								<option value="25"
									<c:if test="${paging.cntPerPage == 25}">selected</c:if>>25줄 보기</option>
								<option value="30"
									<c:if test="${paging.cntPerPage == 30}">selected</c:if>>30줄 보기</option>	
							</select>
                        </div>
                        <script>
							function selChange() {
								var select = $('#cntPerPage option:selected').val();
									location.href="/cob/post/searchList?postSort=${postSort}&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${paging.nowPage}&cntPerPage="+select;
							}
						</script>
                        
                        <div class="check_box">
                            <input type="checkbox" id="notice_hidden">
                            <span class="icon"></span>
                            <label for="notice_hidden">공지 숨기기</label>
                        </div>
                    </div>
                    <div>
                        <table id="list">
                            <thead style="height: 35px;">	
                                <tr>
                                    <th scope="col" class="m_no">
                                        <span>카테고리</span>
                                    </th>	
                                    <th scope="col" class="title">
                                    	<span>제목</span>
                                    </th>
                                    <th scope="col">
                                        <span>작성자</span>
                                    </th>																
                                    <th scope="col">		
                                        <span>작성일</span>
                                    </th>																
                                    <th scope="col" class="m_no">		
                                        <span>조회수</span>		
                                    </th>														
                                    <th scope="col" class="m_no">				
                                        <span>좋아요</span>			
                                    </th>						
                                </tr>	
                            </thead>
                            <div id="kakaoMap">
                            
                            </div>
                            <script>
								function viewBlog(){
									$("#kakaoMap").load("<c:url value='/post/api'/>");
									$('#list').addClass('display-none');
									$('.search_wrap').addClass('display-none');
									$('.page_nation').addClass('display-none');
									$('#cntPerPage').addClass('display-none');
									$('.check_box').addClass('display-none');
							    }                           
                            </script>
                            <tbody>
								<c:forEach items="${postList}" var="post">
									<tr>
										<td id="postSort"><a href="<c:url value='/post/postList/${post.postSort}'/>">${post.postSort}</a></td>
										<td><a style="float: left; margin-left:20px;" id="title" onClick="addViews(${post.postIdx})" href="<c:url value='/post/postDetail?postIdx=${post.postIdx}'/>">${post.postTitle}</a></td>
										<td>${post.postWriter}</td>
										<td><fmt:formatDate value="${post.postRegDate}" type="date" pattern="yyyy.MM.dd" /></td>
										<td>${post.views}</td>
										<td class="postLike">${post.postLike}</td>
									</tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- search_bar -->
                <div class="search_wrap">
                    <div class="search_bar">
                        <input id="keyword" name="keyword" type="text" placeholder="검색어 입력">
                        <button onclick="btn_search()" class="search_btn"><img style="width:20px; height:20px;" id="search_img" src="/cob/images/search.png"></button>
                    </div>
                    <div class="search_categori">
                        <span>	
                            <select id="searchType" name="searchType"> 
                                <option value="both">제목+내용</option>
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="nickName">닉네임</option>		
                            </select>
                        </span>
                    </div>
                    <script>
                    	function btn_search(){
                    		location.href="/cob/post/searchList?postSort=${postSort}&searchType="+ $('#searchType').val() +"&keyword=" + $('#keyword').val();
                    	}
                    </script>
                    <!-- 글쓰기 페이지로 보내기 -->
                    <c:if test="${ !empty loginInfo }">
	                    <a href="<c:url value='/post/write'/>" class="btn_write">글쓰기</a>
	                </c:if>
                </div>
                <c:if test="${empty postSort && empty memIdx}">
                	<div class="page_nation" style="text-align: center;">		
						<c:if test="${paging.startPage != 1 }">
							<a class="arrow prev" href="<c:url value='/post/searchList?postSort=${ postSort }&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b class="active">${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="<c:url value='/post/searchList?postSort=${ postSort }&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a class="arrow next" href="<c:url value='/post/searchList?postSort=${ postSort }&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div>
                </c:if>
                <c:if test="${ !empty postSort }">
                	<div class="page_nation" style="text-align: center;">		
						<c:if test="${paging.startPage != 1 }">
							<a class="arrow prev" href="<c:url value='/post/searchList?postSort=${ postSort }&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b class="active">${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="<c:url value='/post/searchList?postSort=${ postSort }&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a class="arrow next" href="<c:url value='/post/searchList?postSort=${ postSort }&searchType=${searchType.searchType}&keyword=${searchType.keyword}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div>
                </c:if>
                <c:if test="${!empty memIdx }">
                	<div class="page_nation" style="text-align: center;">		
						<c:if test="${paging.startPage != 1 }">
							<a class="arrow prev" href="<c:url value='/post/searchList1?memIdx=${memIdx}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b class="active">${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="<c:url value='/post/searchList1?memIdx=${memIdx}&nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a class="arrow next" href="<c:url value='/post/searchList1?memIdx=${memIdx}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div>
                </c:if>
            </div>
        </div>
    </div>
    <script>
	 // 조회수 증가
	 function addViews(postIdx){
		 $.ajax({
				url : '<c:url value="/views/addViews"/>',    			
				type : "get",
				data : {postIdx : postIdx},
				async : false,
				success : function(){
				},
				error : function(){
					alert("오류발생");
				}
			});
	 	}
    </script>
</body>
</html> 