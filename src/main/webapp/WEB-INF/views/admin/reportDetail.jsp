<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>신고 상세</title>
<style>
    div {
    	border: 1px solid black;
        box-sizing: border-box;
    }
    .container {
        width: 500px;
        height: 600px;
    }
    .row {
        width: 100%;
    }
    .col {
        width: 100%;
        height: 100%;
    }
    .container > .row:nth-child(1) {
    	height: 20%;
    }
    .container > .row:nth-child(2) {
    	height: 10%;
    }
    .container > .row:nth-child(3) {
    	height: 10%;
    }
    .container > .row:nth-child(4) {
    	height: 10%;
    }
    .container > .row:nth-child(5) {
    	height: 20%;
    }
    .container > .row:nth-child(6) {
    	height: 20%;
    }
    .container > .row:nth-child(1) > .col {
		text-align: center;
	}
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                신고 상세 페이지
            </div>
        </div>
        
        <div class="row">
        	<div class="col-3">
        		<span>신고자</span>
        	</div>
        	<div class="col-9">
        		<span>${map.USER_NICKNAME}</span>
        	</div>
        </div>
        
        <div class="row">
        	<div class="col-3">
        		<span>신고유형</span>
        	</div>
        	<c:choose>
            	<c:when test="${map.TYPE eq 1}">
            		<div class="col-3">
		                게시글
		            </div>
            	</c:when>
            	<c:when test="${map.TYPE eq 2}">
            		<div class="col-3">
		                댓글
		            </div>
            	</c:when>
            	<c:when test="${map.TYPE eq 3}">
            		<div class="col-3">
		                쪽지
		            </div>
            	</c:when>
            </c:choose>
        	<div class="col-3">
        		<span>신고내용</span>
        	</div>
        	<div class="col-3">
        		<span>${map.I_REPORT_CONTENT}</span>
        	</div>
        </div>
        
        <div class="row">
        	<div class="col-3">
        		<span>신고일</span>
        	</div>
        	<div class="col-9">
        		<span>${map.REPORT_DATE}</span>
        	</div>
        </div>
        
        <div class="row">
            <div class="col-12">
                신고 사유
            </div>
            <div class="col-12">
                <p>${map.REPORT_CONTENT}</p>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12">
                신고 대상 내용
            </div>
            <div class="col-12">
                <p>${map.CONTENT}</p>
            </div>
        </div>
    </div>
</body>
</html>