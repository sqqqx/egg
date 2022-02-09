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
	h1{text-align:center; padding-top:20px;}
	.container{margin-left:0;}
	.search{padding-top:10px;}
	#textBox{padding-right:0;}
	#selectBox{padding-left:0;}
</style>
</head>
<body>
	<div class="title">
		<h1>${parent_group}</h1>
	</div>
	<!-- 여기 아래에다가 테이블 만들어주시면 됩니다 헤헤;;; ^^;;;; -->
	<!-- 내가 만든다  -->
	<div class="my-2 Category">
		<c:forEach items="${ExpertCategory}" var="ex">
			<button type="button" class="btn btn-dark btn-lg toList" value="${ex.PARENT_GROUP }">${ex.PARENT_GROUP }</button>
		</c:forEach>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>게시글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.POST_NO }</td>
				<td>${list.TITLE }</td>
				<td>${list.USER_NICKNAME }</td>
				<td>${list.WRITTEN_DATE }</td>
				<td>${list.VIEW_COUNT }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="container">
		<div class="row search">
			<div class="col-3" id="textBox">
				<input type="text" class="form-control" aria-label="Text input with dropdown button">			
			</div>
			<div class="col-1" id="selectBox">
				<select class="form-select">
				    <option>제목</option>
					<option>내용</option>
					<option>작성자</option>		
				 </select>
			</div>
		</div>
		<div class="row">
			페이징부분
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(".toList").click(function(e){
		let text = e.target.value;
		let id = '${loginSession.user_id}'
		console.log(text)
		location.href="${pageContext.request.contextPath}/offlinePost/toList.do?parent_group="+text+"&expert_id="+id;
	})
</script>
</body>
</html>