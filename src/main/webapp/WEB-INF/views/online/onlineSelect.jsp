<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 적용 문구 -->
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin:0;}
body{
    width:1800px;
    height: auto;
    margin:0 auto;
}
	h2{text-align:center; padding-top:20px;}
	
	.class{
   height: auto;
   width:1800px;
}

.mediaBox{
	height:auto;
	width:100%;
	 float:left;
	 margin:auto;
	 background-color:#f0f2ed;
}
.content{
	height:500px;
	width:420px;
	border:1px solid black;
	border-radius:10px;
	margin:10px;
	background-color:white;
	padding-right:0;
	padding-left:0;
	
}
.mediaPhoto{
   height: 75%;
   width:100%;
   border-radius:10px;
   margin-right:0;
   margin-left:0;
}
.photo{
	width:100%;
	height:100%;
	padding-left:0;
	padding-right:0;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	filter: brightness(70%);
}
.photo:hover{
  filter: brightness(100%);
}
.mediaText{
	display:table;
   height: 25%;
   width:100%;
   padding-left:10px;
   text-decoration-line: none;
   text-align:center;
   vertical-align: middle;
}
.mediaText>span{
	display:table-cell;
	font-size: x-large;
	vertical-align: middle;
}
a{
	text-decoration-line: none;
	color:black;
}
</style>
</head>
<body>
        <h2>검색결과 : ${search} </h2>
        <div class="row main">
         <!-- 최신 강의 -->
            <div class="col-12 mt-5 class">
                <div class="row mediaBox">
                	<c:forEach items="${listRecent }" var="recent">
                		<div class="col-3 content">
	                			<a href="${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no=${recent.POST_NO}">
			                		<div class="row mediaPhoto">
			                			<img class="photo" src="${pageContext.request.contextPath}/onlinePostThumbNail/${recent.SYSTEM_NAME }">
			                		</div>
			                		<div class="row mediaText">
			             				<span>${recent.TITLE }</span>
			                		</div>
		                		</a>
	                		</div>
                	</c:forEach>
                </div>
            </div>             
 
</body>
</html>