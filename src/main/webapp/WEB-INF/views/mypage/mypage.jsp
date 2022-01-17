<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        <div class="row box_mp">
            <div class="col-4 menu_mp myInfo">
                <div>
                    <img src="https://cdn-icons.flaticon.com/png/512/1144/premium/1144709.png?token=exp=1642398436~hmac=b04c1ca7b28d624347f9e2cd2919def2">
                </div>
                <div>
                    <span>내 정보</span>
                </div>
                
            </div>
            <div class="col-4 menu_mp msgBox">
                <div>
                    <img src="https://cdn-icons.flaticon.com/png/512/873/premium/873360.png?token=exp=1642399525~hmac=0a47f97ee39f9b56d2e68766e4383061">
                </div>
                <div>
                    <span>쪽지함</span>
                </div>
            </div>
            <div class="col-4 menu_mp likeList">
                <div>
                    <img src="https://cdn-icons.flaticon.com/png/512/210/premium/210545.png?token=exp=1642399464~hmac=f1ed8de357260c254be738050442d303">
                </div>
                <div>
                    <span>찜한 게시글</span>
                </div>
            </div>
            <div class="col-4 menu_mp postList">
                <div>
                    <img src="https://cdn-icons.flaticon.com/png/512/1043/premium/1043838.png?token=exp=1642399557~hmac=94246838ea6a91694422b3ceaaa3b835">
                </div>
                <div>
                    <span>내가 쓴 글</span>
                </div>
            </div>
            <div class="col-4 menu_mp orderNPayment">
                <div>
                    <img src="https://cdn-icons.flaticon.com/png/512/1062/premium/1062962.png?token=exp=1642399669~hmac=4036428830835d267485180eb137d4e1">
                </div>
                <div>
                    <span>주문 결제 조회</span>
                </div>
            </div>
            <div class="col-4 menu_mp delivery">
                <div>
                    <img src="https://cdn-icons-png.flaticon.com/512/609/609361.png">
                </div>
                <div>
                    <span>배송 조회</span>
                </div>
            </div>
        </div>

    </div>
</body>
</html>