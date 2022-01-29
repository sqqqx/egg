<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/admin/memberManagement.css">
    <title>관리자 홈</title>

</head>

<body>
 	<%@include file="/WEB-INF/views/header.jsp" %>
       <div class="main-Wrapper d-flex justify-content-center pt-5">
             <!--사이드 바-->
            <div class="cls-sideBar">
                <%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            </div>
            <!-- 본문 -->
            <div>
            	<h3>11</h3>
            	<ul>
            		<li>신고상세 디자인</li>
            		<li><del>2중 테이블</del></li>
            		<li>주문-상품 테이블 추가</li>
            		<li>신고관리 -> 댓글 DB,Mapper수정</li>
            		<li><del>중복 쿼리</del></li> 
            		<li>날짜 시간처리</li>
            		<li></li>
            	</ul>
            	<h3>??</h3>
            	<ul>
            		<li>구매 성공 이멜</li>
            		<li>신고 대상 블라인드</li>
            		<li>고수 증명파일</li>
            		<li>환불 재고+1</li>
            		<li></li>
            		<li></li>
            	</ul>
            	<h2>TEST</h2>
            	<span id="tmp"></span>
            </div>
       </div>
       
       <script>
       		/* $(document).ready(function() {
       			ws.onmessage = function(e) {
                	console.log(e.data);
                	msgObj = JSON.parse(e.data);
                	console.log("msgObj333 : " + msgObj);
                	$("#tmp").empty();
                	$("#tmp").append(msgObj);
                }
       		}); */
       </script>
</body>
</html>