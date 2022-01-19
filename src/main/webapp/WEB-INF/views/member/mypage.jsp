<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mypage.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<title>마이페이지</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	<!-- 마이 페이지 -->
    <div class="container">
        <div class="row header_mp">
            <div class="col-12">My Page</div>
            <div class="col-12">User님 환영합니다.</div>
        </div>
        <c:if test="${dto.type eq 2}">
        	<div class="row expert_box">
	            <div class="col-10 row activity_box">
	                <div class="col-8">
	                    <p>내 포인트 : 800p</p>
	                    <p>총 게시글 : 0 개</p>
	                </div>
	                <div class="col-3">
	                    <button type="button" class="btn btn-outline-dark">충전내역</button>
	                </div>
	            </div>
	            <div class="col-2">
	                <button type="button" class="btn btn-dark" id="toProfileBtn">프로필 바로가기</button>
	            </div>
       		</div>
        </c:if>
        
        <!-- 능력자 회원 등록이 안되어있어서 임시로 박스 띄워주기. 능력자 회원 생성 시 아래 expert_box 삭제 -->
        	<div class="row expert_box">
	            <div class="col-10 row activity_box">
	                <div class="col-8">
	                    <p>내 포인트 : 800p</p>
	                    <p>총 게시글 : 0 개</p>
	                </div>
	                <div class="col-3">
	                    <p><button type="button">충전내역</button></p>
	                </div>
	            </div>
	            <div class="col-2">
	                <button type="button" id="toProfileBtn" class="btn btn-dark">프로필 바로가기</button>
	            </div>
       		</div>
        

        <div class="row box_mp">
            <div class="col-4 menu_mp myInfo">
                <div>
<<<<<<< HEAD
                	<a href="${pagecontext.request.contextPath}/member/toMyInfo">
                		<img src="/resources/img/myInfo.png">
                	</a>
=======
                    <img src="/resources/img/myInfo.png">
>>>>>>> e029e4299cecb740d003cab8818abadd68b33d0f
                </div>
                <div>
                	<a href="${pagecontext.request.contextPath}/member/toMyInfo"><span>내 정보</span></a>
                </div>
                
            </div>
            <div class="col-4 menu_mp msgBox">
                <div>
                    <img src="/resources/img/message.png">
                </div>
                <div>
                    <span>쪽지함</span>
                </div>
            </div>
            <div class="col-4 menu_mp likeList">
                <div>
                    <img src="/resources/img/like.png">
                </div>
                <div>
                    <span>찜한 게시글</span>
                </div>
            </div>
            <div class="col-4 menu_mp postList">
                <div>
                    <img src="/resources/img/Post.png">
                </div>
                <div>
                    <span>내가 쓴 글</span>
                </div>
            </div>
            <div class="col-4 menu_mp orderNPayment">
                <div>
                    <img src="/resources/img/payment.png">
                </div>
                <div>
                    <span>주문 결제 조회</span>
                </div>
            </div>
            <div class="col-4 menu_mp delivery">
                <div>
<<<<<<< HEAD
                    <img src="/resources/img/delivery.png">
=======
                    <img src="/resources/img/baesong.png">
>>>>>>> e029e4299cecb740d003cab8818abadd68b33d0f
                </div>
                <div>
                    <span>배송 조회</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>