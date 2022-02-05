<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 적용 문구 -->
<%@include file="/WEB-INF/views/offHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offline</title>
<style>
	*{margin:0;}
	body{
		margin:0 auto;
		width:1800px;
    	height: 1000px;
	}
	table{width:1400px; margin:auto;}
	.category{height:400px;}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th colspan="4">1:1 고수 찾기
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="category">
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=1">	
						<img src="">프로그래밍
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=2">	
						<img src="">카테고리2
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=3">	
						<img src="">카테고리3
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=4">	
						<img src="">카테고리4
					</a>
				</td>
			</tr>
			<tr class="category">
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=5">	
						<img src="">카테고리5
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=6">	
						<img src="">카테고리6
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=7">	
						<img src="">카테고리7
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toList.do?category_no=8">	
						<img src="">카테고리8
					</a>
				</td>
			</tr>
		</tbody>
	</table>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	
</script>
</body>
</html>