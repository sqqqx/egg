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
@font-face {
    font-family: 'BMHANNAAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h2{
	text-align:center;
	font-family: 'BMHANNAAir';
	font-size:xx-large;
}
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
	 margin-bottom:30px;
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
	height:50px;
}
.titleBox{
	height:70px;
	padding-top:5px;
	font-family: 'BMHANNAAir';
	font-size:large
}
.seeBox{
	height:30px;
	text-align: left;
	color:gray;
}
a{
	text-decoration-line: none;
	color:black;
	margin-left:0;
	margin-right:0;
}
</style>
</head>
<body>
		<div class="row mt-3 littleTitle">
			<h2> ${category} </h2>
		</div> 
        <div class="row main">
         <!-- 카테고리별 강의 -->
            <div class="col-12 mt-5 class">
                <div class="row mediaBox">
                	<c:forEach items="${listCat }" var="cat">
                		<div class="col-3 content">
	                			<a href="${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no=${cat.POST_NO}">
			                		<div class="row mediaPhoto">
			                			<img class="photo" src="${pageContext.request.contextPath}/onlinePostThumbNail/${cat.SYSTEM_NAME }">
			                		</div>
			                		<div class="row mediaText">
			             				<div class="row titleBox">
			             					<b>${cat.TITLE }</b>
			             				</div>
			             				<div class="row seeBox">
			             					<div class="col">
			             						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
												  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
												  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
												</svg>	
												${cat.VIEW_COUNT }
			             					</div>
			             				</div>	
			                		</div>
		                		</a>
	                		</div>
                	</c:forEach>
                </div>
            </div>             

</body>
</html>