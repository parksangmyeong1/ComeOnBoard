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

    .main_body{
        background-color: #f7f7f7;
    }

    ul {
        list-style: none;
    }

  
    .game_list{
        
        width: 50%;
        max-width: 980px;
        height: 70;
        margin: 15px auto 0px auto;
        padding: 12px 5px;
        min-height: 70px;
        
        border: 2px solid #000;
    }
   
    

.game_item{
    display: block;
    clear: both;
    border-bottom: 2px solid #000;
    /* padding-top: 10px; */
    height: 70px;
    margin-top: 15px;
}

.game_item>ul>li{
	float:left;
}
#address{
	clear:both;
}
#orderDate{
	clear:both;
}
.game_item>ul>li>h3>a:hover{
    color: rgb(66, 133, 244);
}


a{
    text-decoration: none;
    color: black;
}

#etc{
	display :none
}
#btn_order{
	background-color: rgb(251, 188, 006); 
	border : none;
	font-size : 15px;
	
}
#btn_order:hover{
	color: rgb(66, 133, 244); 
}

.hidden{
	visibility : hidden
}
</style>
<body>

    <%@ include file="/WEB-INF/views/frame/header.jsp" %>
	
	
    <div class="game_list">

        <c:forEach items="${orderlist}" var="orderlist" >
        <div class="game_item">
            
            
            
            <ul>
                <li><h3>게임명 : <a href="<c:url value ='/game/gamepage/'/>${orderlist.gameIdx}" >${orderlist.gameName} / </a></h3></li>
                <li><h3>결제금액 : ${orderlist.gamePrice}원 / </h3></li>
                <li><h3>구매자 : ${orderlist.memName}</h3></li>
                <li id="orderDate"><h3>구매날짜 : ${orderlist.orderDate}</h3></li>
                <li id="address"><h3>주소 : ${orderlist.shipAddress}</h3></li>
            </ul>
            
            <div class="hidden">
                <h1>${orderlist.memIdx }</h1>
            </div>
			
          
        </div> 

	</c:forEach>
    </div>
   	

</body>
</html>