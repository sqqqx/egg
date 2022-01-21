<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cls-sideBar</title>
<style>
	/*** 관리자 메인 영역 ***/
	.main-Wrapper > div:nth-child(1) {
		width: 15%;
		float: left;
	}
	.main-Wrapper > div:nth-child(2) {
		width: 85%;
		float: left;
	}
	
	/* 사이드 바 */
    .cls-sideBar ul {
        list-style: none;
    }
    .cls-sideBar li {
    	padding-bottom: 20px;
    }
    .cls-sideBar ul a {
        text-decoration: none;
        color: black;
        font-weight: bold;
        padding: 20px;
    }
    
    /* TEST */
    /* body {
	  margin: 0;
	  font-family: "Lato", sans-serif;
	}
	
	.cls-sideBar {
	  margin: 0;
	  padding: 0;
	  width: 200px;
	  background-color: #f1f1f1;
	  position: fixed;
	  height: 100%;
	  overflow: auto;
	}
	
	.cls-sideBar a {
	  display: block;
	  color: black;
	  padding: 16px;
	  text-decoration: none;
	}
	 
	.cls-sideBar a.active {
	  background-color: #04AA6D;
	  color: white;
	}
	
	.cls-sideBar a:hover:not(.active) {
	  background-color: #555;
	  color: white;
	}
	
	div.content {
	  margin-left: 200px;
	  padding: 1px 16px;
	  height: 1000px;
	}
	
	@media screen and (max-width: 700px) {
	  .cls-sideBar {
	    width: 100%;
	    height: auto;
	    position: relative;
	  }
	  .cls-sideBar a {float: left;}
	  div.content {margin-left: 0;}
	}
	
	@media screen and (max-width: 400px) {
	  .cls-sideBar a {
	    text-align: center;
	    float: none;
	  }
	} */
    
</style>
</head>
<body>
	<ul>
      <li><a href="${pageContext.request.contextPath}/admin/toAdminMain">관리자 홈</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/toMemberManagement">회원 관리</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/toPostManagement">게시글 관리</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/toReportManagement">신고 관리</a></li>
      <li>~~side menu1</li>
      <li>~~side menu2</li>
      <li>~~side menu3</li>
  	</ul>
  	
  	<!-- <a class="active" href="#home">Home</a>
	<a href="#news">News</a>
	<a href="#contact">Contact</a>
	<a href="#about">About</a> -->
	  	
</body>
</html>