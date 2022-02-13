<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 적용 문구 -->
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online</title>
<style>
	*{margin:0;}
body{
    width:1800px;
    height: auto;
    margin:auto;
}
	h2{text-align:center;}
	
	.class{
   height: auto;
   width:1800px;
}

.mediaBox{
	height:auto;
	width:100%;
	 float:left;
	 margin:auto;
	 background-color:#6DCEF520;
}
.content{
	height:400px;
	width:420px;
	margin:12px;
	background-color:white;
	padding-right:0;
	padding-left:0;
	
}
.mediaPhoto{
   height: 75%;
   width:100%;
   margin-right:0;
   margin-left:0;
   overflow: hidden;
}
.photo{
	width:100%;
	height:100%;
	padding-left:0;
	padding-right:0;
	transform:scale(1.0);    
    transition: transform .5s;
}
.photo:hover{
   transform:scale(1.1);            /* 이미지 확대 */
   transition: transform .5s; 	/*  시간 설정  */
}
.mediaText{
	display:table;
   height: 25%;
   width:100%;
   padding-left:10px;
   text-decoration-line: none;
   text-align:left;
   vertical-align: middle;
}
.mediaText>span{
	display:table-cell;
	font-size: large;
	vertical-align: middle;
}
a{
	text-decoration-line: none;
	color:black;
}

#view{
	background-color: #00ADEE;
	width:42px;
	height:20px;
	text-align: center;
	margin:auto;
	padding-left:0;
	padding-right:0;
	color:white;
}
</style>
</head>
<body>
		<div class="row mt-3 littleTitle">
			<div id="view">VIEW</div>
			<h2> 조회수 순 강의 </h2>
		</div> 
        <div class="row main">
         <!-- 인기 강의 -->
            <div class="col-12 mt-5 class">
                <div class="row mediaBox">
                	<c:forEach items="${listView }" var="view">
                		<div class="col-3 content">
	                			<a href="${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no=${view.POST_NO}">
			                		<div class="row mediaPhoto">
			                			<img class="photo" src="${pageContext.request.contextPath}/onlinePostThumbNail/${view.SYSTEM_NAME }">
			                		</div>
			                		<div class="row mediaText">
			             				<span>${view.TITLE }</span>
			                		</div>
		                		</a>
	                		</div>
                	</c:forEach>
                </div>
            </div>             

</body>
</html>