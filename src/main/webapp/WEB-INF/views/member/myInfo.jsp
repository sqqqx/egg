<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/myInfo.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<title>내 정보</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
    <!-- 내 정보 -->
    <div class="container-fluid" id="myInfo">
        <div class="row">
            <div class="col-2 userBox">
                <div id="profileBox">
                    <div id="profilePhoto">
                        <img src="/resources/img/myInfo.png">
                    </div>
                    <div id="profileInfo">
						${loginSession.user_nickname}님
                    </div>
                </div>
                <div id="userTab">
                    <li>
                        <ul>비밀번호 수정</ul>
                        <ul><a href="${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}">회원정보 조회</a></ul>
                        <ul>쪽지함</ul>
                        <ul>찜한 게시글</ul>
                        <ul>내가 쓴 글</ul>
                        <ul>주문 결제 조회</ul>
                        <ul>배송 조회</ul>
                        <ul>회원탈퇴</ul>
                    </li>
                </div>
            </div>
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