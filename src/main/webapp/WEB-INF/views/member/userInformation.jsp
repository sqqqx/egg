<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/userInformation.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<title>회원정보조회</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	
	<!-- 회원 정보 조회 -->
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
                        <ul><span id="withdrawal">회원탈퇴</span></ul>
                        <!-- <ul><a href="${pagecontext.request.contextPath}/member/withdrawal.do?user_id=${loginSession.user_id}">회원탈퇴</a></ul> -->
                    </li>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="col-8" id="userBox">
                <div class="row" id="title"><p>회원정보조회</p></div>
                <div class="row" id="profileSection01">
                    <div class="col-2">
                        <div id="userPhoto">
                            <img src="/resources/img/myInfo.png">
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary" id="changePhoto">프로필 사진변경</button>
                        </div>
                    </div>
                    <div class="col-7" id="temp1">
                        <li>
                            <ul>ID : ${dto.user_id}</ul>
                            <ul>가입일 : ${dto.signup_date}</ul>
                            <!-- <ul>능력자들과 함께한지 999일 ♥</ul> -->
                        </li>
                    </div>
                </div>
                <div class="row" id="profileSection02">
                    <table>
                        <tr>
                            <th>회원유형</th>
                            <td>
                            	<c:choose>
                            		<c:when test="${dto.type eq 1}">
                            			일반유저
                            		</c:when>
                            		<c:when test="${dto.type eq 2}">
                            			능력자
                            		</c:when>
                            		<c:otherwise>
                            			외계인
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td>${dto.user_nickname}</td>
                        </tr>
                        <tr>
                            <th>휴대전화번호</th>
                            <td>${dto.phone}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${dto.email}</td>
                        </tr>
                        <tr>
                           <th>주소</th> 
                           <td>${dto.address}</td>
                        </tr>
                    </table>
                    <div class="col" id="btnBox">
                        <button type="button" id="editProfileBtn" class="btn btn-success">회원 정보 수정</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	$("#editProfileBtn").on("click", function(){
    		alert("회원 정보 수정");
    	})
    	$("#withdrawal").on("click", function(){
    		if(confirm("회원 탈퇴를 진행 하시겠습니까?")){
    			if(confirm("정말로 씨리어쓸리 회원탈퇴를 하시겠습니까?ㅠㅠㅠ")){
    				$(location).attr("href", "${pagecontext.request.contextPath}/member/withdrawal.do?user_id=${loginSession.user_id}");
    			}
    		}
    	})
    </script>
</body>
</html>