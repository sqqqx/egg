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
            	<h2>123abcABC!@#$가나다</h2>
            </div>
       </div>
</body>
</html>