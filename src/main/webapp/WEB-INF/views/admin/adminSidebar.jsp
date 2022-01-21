<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
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
</body>
</html>