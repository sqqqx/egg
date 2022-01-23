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
<link rel="stylesheet" href="/resources/css/profileSection.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보조회</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	
	<!-- 회원 정보 조회 -->
    <div class="container-fluid" id="myInfo">
        <div class="row">
        	<!-- 좌측 프로필 부분 -->
            <%@include file="/WEB-INF/views/member/profileSection.jsp" %>
            
            <div class="col-1"></div>
            
            <!-- 우측 회원정보조회 부분 -->
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
                            <form id="userInfoForm">
                                <tr>
                                    <th>회원유형</th>
                                    <td id="viewType">
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
                                    <td id="viewUser_nickname">${dto.user_nickname}</td>
                                    <td id="editUser_nickname">
                                        <input type="text" placeholder="수정할 닉네임을 입력해주세요." id="inputUser_nickname" name="user_nickname" value="${dto.user_nickname}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대전화번호</th>
                                    <td id="viewPhone">${dto.phone}</td>
                                    <td id="editPhone">
                                        <input type="text" placeholder="수정할 전화번호를 입력해주세요." id="inputPhone" name="phone" value="${dto.phone}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="viewEmail">${dto.email}</td>
                                    <td id="editEmail">
                                        <input type="text" placeholder="수정할 이메일을 입력해주세요." id="inputEmail" name="email" value="${dto.email}">
                                    </td>
                                </tr>
                                <tr>
                                   <th>주소</th> 
                                   <td id="viewAddress">${dto.address}</td>
                                   <td id="editAddress">
                                       <div class="row">
                                            <input type="text" id="edited_postcode" placeholder="우편번호" class="col-5">
                                            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-warning col-2">
                                        </div>
                                        <div class="row">
                                            <input type="text" id="edited_roadAddress" placeholder="도로명주소" class="col-5">
                                            <input type="text" id="edited_jibunAddress" placeholder="지번주소" class="col-5">
                                            <span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="row">
                                            <input type="text" id="edited_detailAddress" placeholder="상세주소" class="col-5">
                                            <input type="text" id="edited_extraAddress" placeholder="참고항목" class="col-5">
                                        </div>
                                        <input type="text" id="inputAddress" name="address" hidden/>
                                   </td>
                                </tr>
                                <input type="text" value="abc123" name="user_id" hidden/>	<!-- 임시로 id값 "abc123"입력 -->
                            </form>
                    	</table>
                    
                    <div class="col" id="btnBox">
                        <button type="button" id="usertypeConvertBtn" class="btn btn-success">능력자로 전환하기</button>
                        <button type="button" id="editProfileBtn" class="btn btn-warning">회원 정보 수정</button>
                    </div>
                    <div class="col" id="editBtnBox">
                    	<button type="button" id="cancelBtn" class="btn btn-secondary">취소</button>
                    	<button type="button" id="confirmBtn" class="btn btn-primary">수정완료</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	// 회원정보수정 버튼 선택
	    $("#editProfileBtn").on("click", function(){
	        console.log("회원정보수정");
	        convertModify();
	    })
	    
	    // 회원정보수정 후 취소 버튼
	    $("#cancelBtn").on("click", function(){
	    	console.log("회원정보수정 취소");
	       	convertView();
	    })
	    
	    // 회원정보수정 후 수정 버튼
	    // ajax로 비동기 통신을 할 때 type: "post"방식으로 넘겨주려면 넘겨줄 값을 data: 여기에 serialize()된 변수를 써줘야 한다.
	    // ajax로 key-value값으로 된 데이터를 받을 수 있는데 jackson으로는 객체를 받을 수 있다.
	    $("#confirmBtn").on("click", function(){
	    	// 주소 하나의 인풋창으로 합치기
	    	let editedAddress = $("#edited_postcode").val() + " " + $("#edited_roadAddress").val() + " "
            + $("#edited_jibunAddress").val() + " " + $("#edited_detailAddress").val() + " "
            + $("#edited_extraAddress").val();
	    	$("#inputAddress").val(editedAddress);
	    	let data = $("#userInfoForm").serialize();
			console.log("userInfoForm.serialize(): " + data);
			
		    $.ajax({
		    	// <form>태그 안에 수정사항을 직렬화 하여 변수에 담기
		    	url: "${pagecontext.request.contextPath}/member/modify.do",
		    	type: "post",
		    	data: data
		    	}).done(function(rs){
		    		if(rs !== null){	// 변경 성공 시 회원정보칸에 수정된 정보 넣어주기 및 버튼 바꾸기. String이 아닌 DTO로 받아주기
		    			// 수정사항을 담은 dto 객체를 전달 받기
		    			console.log("회원정보 수정 성공 : " + rs);
		    			console.log(rs.user_nickname);
		    			console.log(rs.phone);
		    			console.log(rs.email);
		    			console.log(rs.address);
		    			// 기존 input창에 수정된 dto정보로 대체
		    			$("#viewUser_nickname").html(rs.user_nickname);
		    			$("#viewPhone").html(rs.phone);
		    			$("#viewEmail").html(rs.email);
		    			$("#viewAddress").html(rs.address);
		    			// 기존 input창 출력
		    			console.log("수정닉네임 - " + $("#viewUser_nickname").html());
		    			console.log("수정폰 - " + $("#viewPhone").html());
		    			console.log("수정이메일 - " + $("#viewEmail").html());
		    			console.log("수정주소 - " + $("#viewAddress").html());
		    			convertView();
		    		} else {
		    			console.log(rs);
		    			alert("회원정보 수정 실패");
		    		}
		    	}).fail(function(e){
						console.log(e);    	
		    	})
	    })
	    
    	// 회원정보수정 화면 및 버튼 전환
    	let convertModify = function(){
	    	$("table td:nth-child(2)").css("display", "none");
	        $("table td:last-child").css("display", "block");
	        $("#btnBox").css("display", "none");
	        $("#editBtnBox").css("display", "inline-block");
	    }
    	
    	// 회원정보조회 화면 및 버튼 전환
    	let convertView = function(){
    		$("table td:nth-child(2)").css("display", "block");
	        $("table td:last-child:not(#viewType)").css("display", "none");
	        $("#btnBox").css("display", "block");
	        $("#editBtnBox").css("display", "none");
    	}
    	
    	// 다음 API
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('edited_postcode').value = data.zonecode;
                    document.getElementById("edited_roadAddress").value = roadAddr;
                    document.getElementById("edited_jibunAddress").value = data.jibunAddress;
                    
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("edited_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("edited_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>
</body>
</html>