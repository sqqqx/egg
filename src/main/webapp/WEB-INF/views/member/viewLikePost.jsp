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
<title>찜한 게시글</title>
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
	   .cls-tr {
	   		cursor: pointer;
	   }
	   .cls-tr img {
	   		width: 50px;
	   		height: 50px;
	   }
	   .cls-tr td {
	   		vertical-align: middle;
	   }
	   .cls-tr p {
	   		margin: 0;
	   }
	   .cls-tr > td:nth-child(1) {
	   		width: 10%;
	   }
	   .cls-tr > td:nth-child(2) {
	   		width: 20%;
	   }
	   .cls-tr > td:nth-child(3) {
	   		width: 60%;
	   }
	   .cls-tr > td:nth-child(4) {
	   		width: 10%;
	   }
	   .cls-productName > p {
	   		font-style: italic;
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
        				<h1>찜한 게시글</h1>
        			</div>
        		</div>
        		
        		<%-- 검색 --%>
        		<form action="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=1&type=${type}" method="post" class="" id="searchForm">
        			<div class="row">
        				<div class="col-4 d-flex justify-content-start">
							<button type="button" class="btn btn-outline-dark cls-type"
								id="typeOnline" value="1">온라인</button>
							<button type="button" class="btn btn-outline-dark cls-type"
								id="typeOffline" value="2">오프라인</button>
							<button type="button" class="btn btn-outline-dark cls-type"
								id="typeProduct" value="3">상품</button>
        				</div>
        				<div class="col-4"></div>
	        			<div class="col-4 px-0 d-flex justify-content-end">
	        				<select class="form-select" aria-label="Default select example"
								name="searchOption" id="searchOption">
								<option value="title"
									${searchOption == "title" ? 'selected="selected"' : ''}>제목</option>
								<option value="content"
									${searchOption == "content" ? 'selected="selected"' : ''}>내용</option>
							</select>
	        				<input type="text" class="form-control" id="searchKeyword"
								name="searchKeyword" value="${searchKeyword}" placeholder="검색">
	        			</div>
	        		</div>
        		</form>
        		
        		<%-- 작성 글 테이블 --%>
        		<div class="row">
        			<c:choose>
        				<%-- 상품 --%>
        				<c:when test="${type eq 3}">
        					<div class="col">
		        				<table class="table">
								  <thead>
								    <tr>
								    	<th><%-- 체크박스 --%></th>
								    	<th><%-- 이미지 --%></th> 
								    	<th><%-- 이름+가격 --%></th>
								    	<th><%--장바구니,삭제 버튼--%></th>
								    </tr>
								  </thead>
								  <tbody>
								  	<c:choose>
								  		<c:when test="${empty list}">
								  			<tr>
								  				<td colspan="4">등록된 글이 없습니다.</td>
								  			</tr>
								  		</c:when>
								  		<c:otherwise>
								  			<c:forEach items="${list}" var="map">
								  				<tr class="cls-tr" id="${map.TYPE}">
											    	<td>${map.PRODUCT_NO}</td>
											    	<td><img src="/resources/img/${map.IMAGE_PATH}"></td>
											    	<td class="cls-productName">
											    		<p>${map.NAME}</p>
											    		<p>₩ ${map.PRICE}</p>
											    	</td>
											    	<td style="width: 150px">
											    		<button type="button" class="btn btn-outline-dark btnToCart" id="${map.PRODUCT_NO}">장바구니 담기</button>
														<br><button type="button" class="btn btn-outline-dark btnDelete" id="${map.PRODUCT_NO}" style="width: 127.63px;">삭제</button>
											    	</td>
											    </tr>
								  			</c:forEach>
								  		</c:otherwise>
								  	</c:choose>
								  </tbody>
								</table>  
		        			</div>
        				</c:when>
        				<%-- 온/오프라인 게시글 --%>
        				<c:otherwise>
        					<div class="col">
		        				<table class="table">
								  <thead>
								    <tr>
								    	<th>번호</th>
								    	<th>제목</th> 
								    	<th>조회수</th>
								    	<th>삭제</th>
								    </tr>
								  </thead>
								  <tbody>
								  	<c:choose>
								  		<c:when test="${empty list}">
								  			<tr>
								  				<td colspan="4">등록된 글이 없습니다.</td>
								  			</tr>
								  		</c:when>
								  		<c:otherwise>
								  			<c:forEach items="${list}" var="map">
								  				<tr class="cls-tr" id="${map.TYPE}">
											    	<td>${map.POST_NO}</td>
											    	<td>${map.TITLE}</td>
											    	<td>${map.VIEW_COUNT}</td>
											    	<td>
											    	   <button type="button" class="btn btn-outline-dark btnDelete" id="${map.PRODUCT_NO}" style="width: 127.63px;">삭제</button>
											    	</td>
											    </tr>
								  			</c:forEach>
								  		</c:otherwise>
								  	</c:choose>
								  </tbody>
								</table>  
		        			</div>
        				</c:otherwise>
        			</c:choose>
        		</div>
        		
        		<%-- 페이징 --%>
        		<div class="row">
        			<div class="col d-flex justify-content-center">
        				<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${navi.needPrev eq true}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=${map.firstIdx-1}&type=${type}">Previous</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=${map.firstIdx-1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&type=${type}">Previous</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:forEach var="i" begin="${navi.firstIdx}" end="${navi.lastIdx}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=${i}&type=${type}">${i}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&type=${type}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${map.needNext eq true}">
									<c:choose>
										<c:when test="${empty searchOption && empty searchKeyword}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=${map.firstIdx+1}&type=${type}">Next</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=${map.firstIdx+1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&type=${type}">Next</a>
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
    	<%-- 장바구니 담기 --%>
    	$(".btnToCart").on("click", function(e) {
    		let num = e.target.id;
            let id = '${loginSession.user_id}';
            let quantity = 1;

           $.ajax({
                url: "${pageContext.request.contextPath}/cart/insertCart.do?product_no=" + num + "&user_id=" + id + "&quantity=" + quantity,
                type: "get"
            }).done(function (data) {
                if (data == 1) {
                    let con = confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까??");
                    if (con == true) {
                        location.href = "${pageContext.request.contextPath}/cart/selectCart.do?user_id=" + id;
                    }
                } else if (data == -1) {
                    let con = confirm("장바구니에 중복된 상품이 있습니다. 장바구니로 이동하시겠습니까??");
                    if (con == true) {
                        location.href = "${pageContext.request.contextPath}/cart/selectCart.do?user_id=" + id;
                    }
                }
            }).fail(function (e) {
                console.log(e);
            })
    	});
    	<%-- 삭제 --%>
    	$(".btnDelete").on("click", function(e) {
    		const user_id = "${loginSession.user_id}";
    		let post_no = $(e.target).parents(".cls-tr").children().eq(0).html();
    		let type = $(e.target).parents(".cls-tr").attr("id");
    		$.ajax({
                url: "${pageContext.request.contextPath}/like/minus.do?post_no=" + post_no + "&user_id=" + user_id + "&type=" + type,
                type: "get"
            }).done(function (data) {
                if (data == "available") {
                    location.href = "${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=1&type="+type;
                    return;
                } 
                alert("삭제 실패");
            }).fail(function (e) {
                console.log(e);
            })
    	});
    	<%-- 이동 --%>
    	$(".cls-tr > td:nth-child(2),td:nth-child(3)").on("click", function(e) {
    		const post_no = $(e.target).parents(".cls-tr").children().eq(0).html();
    		const type = $(e.target).parents(".cls-tr").attr("id");
    		console.log(post_no);
    		console.log(type);
    		if(type == 1) {
    			location.href = "${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no="+post_no;
    			return;
    		}
    		if(type == 2) {
    			location.href = "${pageContext.request.contextPath}/offlinePost/toPostDetail.do?post_no="+post_no;
    			return;
    		}
    		if(type == 3) {
    			location.href = "${pageContext.request.contextPath}/product/toProductDetail.do?product_no="+post_no;
    			return;
    		}
    	});
    	<%--글 유형 선택--%>
        $(".cls-type").on("click", function (e) {
            const type = e.target.value;
            location.href = "${pageContext.request.contextPath}/offlinePost/toLikePost?currentPage=1&type=" + type;
        });
        <%--유형 버튼 변경--%>
        $(document).ready(function () {
            switch (${type}) {
               case 3 :
            $("#typeProduct").attr("class", "btn btn-dark");
            break;
               case 1 :
            $("#typeOnline").attr("class", "btn btn-dark");
            break;
               case 2 :
            $("#typeOffline").attr("class", "btn btn-dark");
            break;
        }
       });
    </script>
</body>
</html>