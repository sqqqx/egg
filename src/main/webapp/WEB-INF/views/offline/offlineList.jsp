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
				<td>${list.post_no }</td>
				<td>${list.title }</td>
				<td>${list.user_nickname }</td>
				<td>${list.written_date }</td>
				<td>${list.view_count }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="container">
		<form action="${pageContext.request.contextPath}/offlinePost/getPostbySearch?currentIdx=1&parent_group=${parent_group}&expert_id=${expert_id}" method="post" id="searchForm">
			<div class="row search">
				<div class="col-3" id="textBox">
					<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" value="${searchKeyword }" aria-label="Text input with dropdown button">			
				</div>
				<div class="col-1" id="selectBox">
					<select class="form-select" id="searchOption" name="searchOption">
					    <option value="title" ${searchOption == "title" ? 'selected="selected"' : ''}>제목</option>
						<option value="content" ${searchOption == "content" ? 'selected="selected"' : ''}>내용</option>
						<option value="user_nickname" ${searchOption == "user_nickname" ? 'selected="selected"' : ''}>작성자</option>		
					 </select>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${navi.needPrev eq true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/offlinePost/toList.do?currentPage=${navi.firstIdx-1}
									&parent_group=${parent_group}&expert_id=${expert_id}">Previous</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${navi.firstIdx}" end="${navi.lastIdx}">
							<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/offlinePost/toList.do?currentPage=${i}
											&parent_group=${parent_group}&expert_id=${expert_id}">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${navi.needNext eq true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/offlinePost/toList.do?currentPage=${navi.firstIdx-1}
									&parent_group=${parent_group}&expert_id=${expert_id}">Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
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
	// 검색
	$("#searchKeyword").on("keydown", function(key) {
		if(key.keyCode == 13) {
			$("#searchForm").submit();
		}
	})
</script>
</body>
</html>