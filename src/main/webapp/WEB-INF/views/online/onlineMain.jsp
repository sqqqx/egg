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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/onlineMain.css"> 
</head>
<body>
    <div class="container-fluid">
        <!--캐러샐-->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active slidePhoto">
                <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_6E6E61E02B8D4E21B92E5143A00F6CB5.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item slidePhoto">
                <img src="https://st4.depositphotos.com/20894472/41692/v/600/depositphotos_416924958-stock-illustration-clayware-crafting-hobby-online-classes.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item slidePhoto">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNT3bHsIQRqBcpkXu2Ca1rskQmXJzt7xIi6w&usqp=CAU" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev iconBox" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon iconPosition" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next iconBox" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon iconPosition" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="row main">
         <!-- 인기 강의 -->
            <div class="col-12 mt-5 class">
            	<div class="row titleBox">
            		<div class="col-2 mt-2 mainTitle">
            			<label><h4>★인기 강의★</h4></label>
            		</div>
            		<div class="col-1 mt-2 mainbutton">
            			<button type="button" class="btn btn-primary" id="tolistLike">더보기</button>
            		</div>		
            	</div>
                <div class="row mediaBox">
                	<c:forEach items="${listLike }" var="recent">
                		<div class="col">
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
        
        
        
        	<!-- 최신강의 -->
            <div class="col-12 mt-5 class">
            	<div class="row titleBox">
            		<div class="col-2 mt-2 mainTitle">
            			<label><h4>★최신 강의★</h4></label>
            		</div>
            		<div class="col-1 mt-2 mainbutton">
            			<button type="button" class="btn btn-primary" id="tolistRecent">더보기</button>
            		</div>		
            	</div>
                <div class="row mediaBox">
                	<c:forEach items="${listRecent }" var="recent">
	                		<div class="col">
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
            
    
            
            <!-- 관리자 추천 강의 -->
            <div class="col-12 mt-5 class">
            	<div class="row titleBox">
            		<div class="col-2 mt-2 mainTitle">
            			<label><h4>★관리자 추천 강의★</h4></label>
            		</div>	
            	</div>
                <div class="row mediaBox">
                	<c:forEach items="${listAdmin }" var="recent">
                		<div class="col">
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
        </div>
        <div class="row footer">
            푸터
        </div>
    </div> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
$("#tolistLike").click(function(){
	location.href="${pageContext.request.contextPath}/online/toLike.do"
})
$("#tolistRecent").click(function(){
	location.href="${pageContext.request.contextPath}/online/toRecent.do"
})
</script>
</body>
</html>