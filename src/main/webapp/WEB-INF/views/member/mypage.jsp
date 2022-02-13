<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/mypage.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<title>마이페이지</title>
</head>
<body>	
	<!-- 마이 페이지 -->
    <div class="container">
        <div class="row header_mp">
            <div class="col-12">My Page</div>
            <div class="col-12">${dto.user_nickname}님 환영합니다.</div>
        </div>
        <c:if test="${loginSession.type == 2}">
        	<div class="row expert_box">
	            <div class="col-10 row activity_box">
	                <div class="col-8">
	                    <p>내 포인트 : ${point} P</p>
	                    <p>총 게시글 : 0 개</p>
	                </div>
	                <div class="col-3">
	                    <button type="button" class="btn btn-outline-dark" id="toViewPointBtn">충전내역</button>
	                </div>
	            </div>
	            <div class="col-1">
	                <button type="button" class="btn btn-dark" id="toProfileBtn">프로필 바로가기</button>
	            </div>
       		</div>
        </c:if>
        
		<!-- MyProfile box -->
        <div class="row box_mp">
            <div class="col-4 menu_mp myInfo">
                <div>
                	<a href="${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}">
                		<img src="/resources/img/myInfo.png">
                	</a>
                </div>
                <div><span id="toMyInfo">내 정보</span></div>
                
            </div>
            <div class="col-4 menu_mp msgBox">
                <div>
                	<a href="${pagecontext.request.contextPath}/message/toViewMessage?type=received&user_id=${loginSession.user_id}&currentPage=1">
                		<img src="/resources/img/message.png">
                	</a>
                </div>
                <div><span id="toViewMessage">쪽지함</span></div>
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
                	<a href="${pagecontext.request.contextPath}/order/toMyOrder?currentPage=1">
                		<img src="/resources/img/payment.png">
                	</a>
                </div>
                <div>
                    <span>주문 결제 조회</span>
                </div>
            </div>
            <div class="col-4 menu_mp delivery">
                <div>
                	<a href="${pagecontext.request.contextPath}/cart/selectCartForMe.do?user_id=${loginSession.user_id}">
                		<img src="/resources/img/cart.png">
                	</a>
                </div>
                <div>
                    <span id="toCart">장바구니</span>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	// 충전내역버튼
    	$("#toViewPointBtn").on("click", function(){
    		let openUrl = "${pagecontext.request.contextPath}/pointlog/toViewPoint?user_id=${loginSession.user_id}";
			let name = "포인트 내역 조회";
			let option = "width=600, height=500, top=300";
			
			window.open(openUrl, name, option);
    	})
    	
    	// 프로필 바로가기
    	$("#toProfileBtn").on("click", function(){
    		$(location).attr("href", "${pagecontext.request.contextPath}/member/toViewExpertInfo?expert_id=${loginSession.user_id}");
    	})
    	
    
    	// 내정보
    	$("#toMyInfo").on("click", function(){
    		$(location).attr("href", "${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}");
    	})
    
		// 쪽지함
		$("#toViewMessage").on("click", function(){
			$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=received&user_id=${loginSession.user_id}&currentPage=1");
		})
		
		// 장바구니
		$("#toCart").on("click", function(){
			$(location).attr("href", "${pagecontext.request.contextPath}/cart/selectCartForMe.do?user_id=${loginSession.user_id}");
		})
    </script>
</body>
</html>