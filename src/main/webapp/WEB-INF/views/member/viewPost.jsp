<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/profileSection.css">
<title>내가 쓴 글</title>
	<style>
		*{margin:0;}
		@font-face{
		    font-family: 'BMHANNAAir';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		body{
		    width:1800px;
		    height: 1000px;
		    margin:0 auto;
		    font-family: 'BMHANNAAir';
		}
		table, p{
	   		text-align:center;
	   }
	   .cls-tr img {
	   		width: 50px;
	   		height: 50px;
	   }
	   .cls-tr td {
	   		vertical-align: middle;
	   }
	</style>
</head>
<body>
		
	<!-- 내가 쓴 글 -->
    <div class="container-fluid" id="myInfo">
    	<!-- 좌측 프로필 부분 -->
        <div class="row">
        	<%@include file="/WEB-INF/views/member/profileSection.jsp" %>
        	
        	<%-- 좌측 공백 --%>
        	<div class="col-1"></div>
        	
        	<%-- 본문 시작 --%>
        	<div class="col-8">
        		<%-- 상단 타이틀 --%>  
        		<div class="row">
        			<div class="col d-flex justify-content-center pt-3">
        				<h1>내가 쓴 글</h1>
        			</div>
        		</div>
        		
        		<%-- 검색 --%>
        		<form action="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=1" method="post" class="d-flex justify-content-end" id="searchForm">
        			<div class="row">
	        			<div class="col-5 px-0">
							<select class="form-select" aria-label="Default select example"
								name="searchOption" id="searchOption">
								<option value="title"
									${searchOption == "title" ? 'selected="selected"' : ''}>제목</option>
								<option value="content"
									${searchOption == "content" ? 'selected="selected"' : ''}>내용</option>
							</select>
						</div>
	        			<div class="col-7 px-0 d-flex justify-content-end">
	        				<input type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" value="${searchKeyword}" placeholder="검색">
	        			</div>
	        		</div>
        		</form>
        		
        		<%-- 작성 글 테이블 --%>
        		<div class="row">
        			<div class="col">
        				<table class="table">
						  <thead>
						    <tr>
						    	<th>번호</th>
						    	<th>제목</th> 
						    	<th>조회수</th>
						    	<th>작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
						  		<c:when test="${empty list}">
						  			<tr>
						  				<td colspan="4">글 작성 내역이 존재하지 않습니다.</td>
						  			</tr>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${list}" var="dto">
						  				<tr class="cls-tr">
									    	<td>${dto.post_no}</td>
									    	<td>${dto.title}</td>
									    	<td>${dto.view_count}</td>
									    	<td>${dto.written_date}</td>
									    </tr>
						  			</c:forEach>
						  		</c:otherwise>
						  	</c:choose>
						  </tbody>
						</table>  
        			</div>
        		</div>
        		
        		<%-- 페이징 --%>
        		<div class="row">
        			<div class="col d-flex justify-content-center">
        				<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${map.needPrev eq true}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=${map.firstIdx-1}">Previous</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=${map.firstIdx-1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">Previous</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:forEach var="i" begin="${navi.firstIdx}" end="${navi.lastIdx}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=${i}">${i}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${map.needNext eq true}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=${map.firstIdx+1}">Next</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toMyPost?currentPage=${map.firstIdx+1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">Next</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</ul>
						</nav>
        			</div>
        		</div>
        		
        	</div>
        </div>
    </div>
    
    <script>
    	<%-- 이동 --%>
    	$(".cls-tr").on("click", function(e) {
    		let post_no = $(this).children()[0]
    		post_no=post_no.innerHTML;
    		location.href = "${pageContext.request.contextPath}/offlinePost/toStudentPostDetail.do?post_no="+post_no;
    	});
    	
    </script>
</body>
</html>