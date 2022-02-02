<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필사진 및 회원메뉴</title>
<link rel="stylesheet" href="/resources/css/profileSection.css">
</head>
<body>
	<div class="col-2 userBox">
	<div id="profileBox">
    	<div id="profilePhoto">
        	<img src="${pagecontext.request.contextpath}/profilePhotos/${dto.profile_path}">
       </div>
       <div id="profileInfo">
              ${loginSession.user_nickname}님
          </div>
          </div>
          <div id="userTab">
              <li>
                  <ul><span id="toModifyPw" class="userTab">비밀번호 수정</span></ul>
                  <ul><a href="${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}">회원정보 조회</a></ul>
                  <ul><span id="toViewMessage" class="userTab">쪽지함</span></ul>
                  <ul>찜한 게시글</ul>
                  <ul>내가 쓴 글</ul>
                  <ul>주문 결제 조회</ul>
                  <ul>배송 조회</ul>
                  <ul><span id="withdrawal" class="userTab">회원탈퇴</span></ul>
              </li>
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
		
	</script>
	
</body>
</html>