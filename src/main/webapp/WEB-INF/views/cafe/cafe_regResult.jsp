<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${cafeRegResult == 0}">
<script>
	alert('서버의 오류가 생겨 등록에 실패했습니다.\n잠시 후 다시 시도해주세요.');
	history.back();
</script>
</c:if>   
<c:if test="${cafeRegResult == 1}">
<script>
	alert('등록되었습니다.');
	alert('카페 이미지를 등록해주세요.')
	//var idx = '/cafe/cafe_page/{${cafeIdx}}';
	//alert(idx);
	location.href='<c:url value="/cafe/cafe_regImg"/>'; 
</script>
</c:if>  


<c:if test="${cafeModifyResult == 0}">
<script>
	alert('서버의 오류가 생겨 등록에 실패했습니다.\n잠시 후 다시 시도해주세요.');
	history.back();
</script>
</c:if>   
<c:if test="${cafeModifyResult == 1}">
<script>
	alert('수정되었습니다.');
	//var idx = '/cafe/cafe_page/{${cafeIdx}}';
	//alert(idx);
	location.href='<c:url value="/cafe/cafe_page/'+${cafeIdx}+'"/>'; 
</script>
</c:if>