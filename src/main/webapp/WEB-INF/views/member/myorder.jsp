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
<title>주문 결제 조회</title>
	<style>
		*{margin:0;}
		body{
		    width:1800px;
		    height: 1000px;
		    margin:0 auto;
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
		
	<!-- 주문 결제 조회 -->
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
        				<h1>결제내역조회</h1>
        			</div>
        			${list }
        		</div>
        		
        		<%-- 주문 검색 --%>
        		<form action="${pageContext.request.contextPath}/order/toMyOrder?currentPage=1" method="post" class="d-flex justify-content-end" id="searchForm">
        			<div class="row">
	        			<div class="col-5 px-0">
							<select class="form-select" aria-label="Default select example"
								name="searchOption" id="searchOption">
								<option value="o.order_no"
									${searchOption == "o.order_no" ? 'selected="selected"' : ''}>주문 번호</option>
								<option value="p.name"
									${searchOption == "p.name" ? 'selected="selected"' : ''}>상품명</option>
							</select>
						</div>
	        			<div class="col-7 px-0 d-flex justify-content-end">
	        				<input type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" value="${searchKeyword}" placeholder="검색">
	        			</div>
	        		</div>
        		</form>
        		
        		<%-- 결제 내역 테이블 --%>
        		<div class="row">
        			<div class="col">
        				<table class="table">
						  <thead>
						    <tr>
						    	<th>주문번호</th>
						    	<th><%-- 상품 이미지--%></th> 
						    	<th>상품명</th>
						    	<th>수량</th>
						    	<th>금액</th>
						    	<th>주문일</th>
						    	<th><%-- 결제 취소 버튼 --%></th> 
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
						  		<c:when test="${empty list}">
						  			<tr>
						  				<td colspan="7">주문 내역이 존재하지 않습니다.</td>
						  			</tr>
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${list}" var="map">
						  				<tr class="cls-tr">
									    	<td>${map.ORDER_NO}</td>
									    	<td>
									    		<img src="/resources/img/${map.IMAGE_PATH}">
									    	</td>
									    	<td>${map.NAME}</td>
									    	<td>${map.QUANTITY}</td>
									    	<td>₩ ${map.COST}</td>
									    	<td>${map.ORDER_TIME}</td>
									    	<c:choose>
									    		<c:when test="${map.STATUS eq 'cancled'}">
									    			<td>취소 완료</td>
									    		</c:when>
									    		<c:otherwise>
									    			<td><button type="button" class="btn btn-outline-dark btnCancelOrder" id="${map.ORDER_NO}">주문 취소</button></td>
									    		</c:otherwise>
									    	</c:choose>
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
												href="${pageContext.request.contextPath}/order/toMyOrder?currentPage=${map.firstIdx-1}">Previous</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/order/toMyOrder?currentPage=${map.firstIdx-1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">Previous</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:forEach var="i" begin="${navi.firstIdx}" end="${navi.lastIdx}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/order/toMyOrder?currentPage=${i}">${i}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/order/toMyOrder?currentPage=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${map.needNext eq true}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/order/toMyOrder?currentPage=${map.firstIdx+1}">Next</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/order/toMyOrder?currentPage=${map.firstIdx+1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">Next</a>
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
    	<%-- 주문 취소 버튼 --%>
    	$(".btnCancelOrder").on("click", function(e) {
    		const order_no = e.target.id;
    		if(confirm("주문을 취소하겠습니까?")) {
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/payment/refund.do",
					data: {merchant_uid: order_no}
				}).done(function(rs){
					console.log(rs);
					if(rs == "success") {
						alert("주문 취소 성공");
						location.href = "${pageContext.request.contextPath}/order/toMyOrder?currentPage=1";
					}
					alert("주문 취소 실패");
				}).fail(function(e){
					console.log(e);
				});
				return;
			} 
    	});
    </script>
</body>
</html>