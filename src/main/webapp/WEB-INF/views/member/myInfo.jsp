<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/myInfo.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<link rel="stylesheet" href="/resources/css/profileSection.css">
<title>내 정보</title>
</head>
<body>
    <!-- 내 정보 -->
    <div class="container-fluid" id="myInfo">
        <div class="row">
            <%@include file="/WEB-INF/views/member/profileSection.jsp" %>
            <div class="col-1"></div>
            <div class="col-8 activityBox">
                <div id="banner">
                    <!-- <p>오늘도 능력자들과 함께 즐거운 하루 되세요!</p> -->
                    <img src="/resources/img/myInfo_banner_temp.png">
                </div>
                <div id="recentClass">
                    최근시청 강의
                </div>
                <div id="likedPost">
                    찜한 게시글
                </div>
                <div id="paymentLog">
                    주문결제내역
                </div>
            </div>
        </div>
    </div>
</body>
</html>