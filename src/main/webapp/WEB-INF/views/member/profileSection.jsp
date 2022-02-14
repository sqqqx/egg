<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/userInformation.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<link rel="stylesheet" href="/resources/css/profileSection.css">
<title>프로필사진 및 회원메뉴</title>
</head>
<body>
	<div class="col-2 userBox">
	<div id="profileBox">
    	<div id="profilePhoto">
        	<c:if test="${dto.profile_path == 'myInfo.png'}">
           		<img src="${pagecontext.request.contextPath}/resources/img/${dto.profile_path}">
           	</c:if>
           	<c:if test="${dto.profile_path != 'myInfo.png'}">
           		<img src="${pagecontext.request.contextPath}/profilePhotos/${dto.profile_path}">
           	</c:if>
       </div>
       <div id="profileInfo">
              ${loginSession.user_nickname}님
          </div>
          </div>
          <div id="userTab">
              <ul>
              	<c:if test="${loginSession.type !=0}">
                  <li><span id="toModifyPw" class="userTab">비밀번호 수정</span></li>
                </c:if>
                  <li><span id="toUserInfomation">회원정보 조회</span></li>
                <c:if test="${loginSession.type !=0}">
                  <li><span id="toViewMessage" class="userTab">쪽지함</span></li>
                  <li>
                  	<span>
                  		<a href="${pagecontext.request.contextPath}/offlinePost/toLikePost?currentPage=1&type=1">찜한 게시글</a>
					</span>
				  </li>
                  <li>
                  	<span>
                  		<a href="${pagecontext.request.contextPath}/offlinePost/toMyPost?currentPage=1">내가 쓴 글</a>
                  	</span>
                  </li>
                  <li>
                  	<span>
                  		<a href="${pagecontext.request.contextPath}/order/toMyOrder?currentPage=1">주문 결제 조회</a>
                  	</span>
                  </li>
                  <li>
                  	<span>
                  		<a href="${pagecontext.request.contextPath}/cart/selectCartForMe.do?user_id=${loginSession.user_id}">장바구니</a>
                  	</span>
                  </li>
                  <li><span id="withdrawal" class="userTab">회원탈퇴</span></li>
                  </c:if>
              </ul>
          </div>
      </div>
	<script>
		// 회원탈퇴
		$("#withdrawal").on("click", function(){
			if(confirm("회원 탈퇴를 진행 하시겠습니까?")){
				if(confirm("정말로 씨리어쓸리 회원탈퇴를 하시겠습니까?ㅠㅠㅠ")){
					$(location).attr("href", "${pagecontext.request.contextPath}/member/withdrawal.do?user_id=${loginSession.user_id}");
				}
			}
		})
		
		// 비밀번호 수정
		$("#toModifyPw").on("click", function(){
			let openUrl = "${pagecontext.request.contextPath}/member/toModifyPw?user_id=${loginSession.user_id}";
			let name = "비밀번호 수정";
			let option = "width=600, height=500, top=300";
			
			window.open(openUrl, name, option);
		})
		
		// 쪽지함
		$("#toViewMessage").on("click", function(){
				$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=received&user_id=${loginSession.user_id}&currentPage=1");
				
		})
		
		//유저정보로 이동
		$("#toUserInfomation").on("click", function(){
			$(location).attr("href", "${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}");
		})
	</script>
	
</body>
</html>