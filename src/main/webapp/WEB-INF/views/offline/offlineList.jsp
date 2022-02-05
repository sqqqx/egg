<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 적용 문구 -->
<%@include file="/WEB-INF/views/offHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0;}
	body{
		margin:0 auto;
		width:1800px;
    	height: 1000px;
	}
	.title{height:100px; border:1px solid blue;}
	h1{text-align:center;}
</style>
</head>
<body>
	<div class="title">
		<h1>${Clist.parent_group}</h1>
	</div>
	
	<!-- 여기 아래에다가 테이블 만들어주시면 됩니다 헤헤;;; ^^;;;; -->
</body>
</html>