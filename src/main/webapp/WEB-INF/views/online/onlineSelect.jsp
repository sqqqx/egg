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
<link rel="stylesheet" href="/resources/css/onlineMain.css"> 
</head>
<body>
    <div class="container-fluid">
        
        <div class="row main">
         <!-- 인기 강의 -->
            <div class="col-12 mt-5 class">
            	<div class="row titleBox">
            		<div class="col-2 mt-2 mainTitle">
            			<label><h4>★인기 강의★</h4></label>
            		</div>
            		<div class="col-1 mt-2 mainbutton">
            			<button type="button" class="btn btn-primary">더보기</button>
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
            			<button type="button" class="btn btn-primary">더보기</button>
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

</body>
</html>