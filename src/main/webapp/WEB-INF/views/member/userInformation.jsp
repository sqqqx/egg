<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/userInformation.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<link rel="stylesheet" href="/resources/css/profileSection.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보조회</title>
</head>
<body>
		
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
                        	<c:if test="${dto.profile_path == 'myInfo.png'}">
                        		<img src="${pagecontext.request.contextPath}/resources/img/${dto.profile_path}">
                        	</c:if>
                        	<c:if test="${dto.profile_path != 'myInfo.png'}">
                        		<img src="${pagecontext.request.contextPath}/profilePhotos/${dto.profile_path}">
                        	</c:if>
                        </div>
                        <div>
                        	<form action="${pagecontext.request.contextPath}/member/modifyPP.do" method="post" enctype="multipart/form-data" id="modifyProfilePhotoForm">
                        		<button type="button" class="btn btn-info" id="showPhotoBtnBox">프로필 사진 변경</button>
                                    <div id="photoBtnBox">
                                        <button type="button" class="btn btn-info photoBtn" id="changePhotoBtn">선택</button>
                                        <button type="button" class="btn btn-warning photoBtn" id="defaultPhotoBtn">기본</button>
                                        <button type="button" class="btn btn-secondary photoBtn" id="cancelPhotoBtn">취소</button>
                                        <button type="button" class="btn btn-success photoBtn" id="confirmPhotoBtn">확인</button>
                                    </div>
                            	<input type="file" id="searchPhoto" name="photo" accept="image/*" hidden>
                            	<input type="text" name="user_id" value="${loginSession.user_id}" hidden>
                        	</form>
                            
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
                	<form id="userInfoForm">
                		<table>
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
                                                능력자(진)
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <th>닉네임</th>
                                    <td id="viewUser_nickname">${dto.user_nickname}</td>
                                    <td id="editUser_nickname">
                                        <input type="text" placeholder="수정할 닉네임을 입력해주세요." id="inputUser_nickname" name="nickname" value="${dto.user_nickname}">
                                        <button type="button" class="btn btn-success" id="nicknameCheckBtn" disabled>중복검사</button>
                                        <div id="nickname_regex"></div>
                                        <input type="text" placeholder="수정할 닉네임을 입력해주세요." id="user_nickname" name="user_nickname" value="${dto.user_nickname}" hidden>
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대전화번호</th>
                                    <td id="viewPhone">${dto.phone}</td>
                                    <td id="editPhone">
                                    	<div id="inputPhoneBox">
                                            <!--<input type="text" placeholder="수정할 전화번호를 입력해주세요." id="inputPhone" value="${dto.phone}">-->
                                            <select class="inputPhone" aria-label="Default select example" id="phone1" required>
                                                <option selected>010</option>
                                                <option value="1">011</option>
                                                <option value="2">016</option>
                                                <option value="2">017</option>
                                                <option value="3">018</option>
                                            </select>
                                            <input type="text" class="inputPhone" id="phone2" maxlength="4">
                                            <input type="text" class="inputPhone" id="phone3" maxlength="4">
                                        </div>
                                        <button type="button" class="btn btn-success" id="phoneCheckBtn">인증요청</button>
                                        <div class="verification">
                                            <input type="text" placeholder="인증번호를 입력해 주세요." id="verification">
                                            <button type="button" class="btn btn-dark" id="verificationBtn" disabled>본인확인</button>
                                        </div>
                                        <input type="text" placeholder="수정할 전화번호를 입력해주세요." id="phone" name="phone" value="${dto.phone}" hidden>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="viewEmail">${dto.email}</td>
                                    <td id="editEmail">
                                        <input type="text" placeholder="수정할 이메일을 입력해주세요." id="inputEmail" value="${dto.email}">
                                        <button type="button" class="btn btn-success" id="emailCheckBtn" disabled>중복검사</button>
                                        <div id="email_regex"></div>
                                        <input type="text" placeholder="수정할 이메일을 입력해주세요." id="email" name="email" value="${dto.email}" hidden>
                                    </td>
                                </tr>
                                <tr>
                                   <th>주소</th> 
                                   <td id="viewAddress">${dto.address}</td>
                                   <td id="editAddress">
                                       <div class="row">
                                            <input type="text" id="edited_postcode" placeholder="우편번호" class="col-5">
                                            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-warning col-2" id="postcodeBtn">
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
                                        <input type="text" id="inputAddress" name="address" value="${dto.address}"/>
                                   </td>
                                </tr>
                                <input type="text" value="${loginSession.user_id}" name="user_id" hidden/>
                    		</table>
                    	</form>
                    
                    <div class="col" id="btnBox">
                    	<c:choose>
                            <c:when test="${dto.type eq 1}">
                                <button type="button" id="usertypeConvertBtn" class="btn btn-success">능력자로 전환하기</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" id="viewExpertBtn" class="btn btn-primary">능력자 정보 확인</button>
                            </c:otherwise>
                        </c:choose>
                        
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
    	/* 능력자 관련 */
    	// 능력자 전환 버튼
    	$("#usertypeConvertBtn").on("click", function(){
    		$(location).attr("href", "${pagecontext.request.contextPath}/member/toConvertExpert");
    	})
    	
    	// 능력자 정보 확인
    	$("#viewExpertBtn").on("click", function(){
    		$(location).attr("href", "${pagecontext.request.contextPath}/member/toViewExpertInfo?expert_id=${loginSession.user_id}");
    	})
    	
    	
    
    
    	/* 프로필사진 변경*/
    	// 프로필사진 변경 버튼
    	$("#showPhotoBtnBox").on("click", function(){
    		$("#showPhotoBtnBox").css("display", "none");
    		$("#photoBtnBox").css("display", "inline-block");
    	})
    	
    	// 사진선택
        $("#changePhotoBtn").on("click", function(){
            $("#searchPhoto").click();
        })
        $("#searchPhoto").on("change", function (e) {
        	
            //Get count of selected files
            var countFiles = $(this)[0].files.length

            var imgPath = $(this).val();
            var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
            var userPhoto = $("#userPhoto");
            userPhoto.empty();

            // 확장자 유효성 검사
            if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("<img />", {
                            "src": e.target.result,
                                "class": "thumb-image"
                        }).appendTo(userPhoto);
                    }
                    reader.readAsDataURL($(e.target)[0].files[0]);
                

                } else {
                    alert("현재 사용하고 계신 브라우저에서 FileReader를 지원하지 않습니다.");
                }
            } else {
                alert("gif, png, jpg, jpeg 파일만 선택가능합니다.");
            }
            
        });        
        
        // 기본 프로필사진 선택
        $("#defaultPhotoBtn").on("click", function(){
        	
			if(confirm("기본 프로필 사진으로 변경하시겠습니까?")){
    			if("${dto.profile_path}" === "myInfo.png"){	// 이미 기본 프로필 사진일 떄
    				alert("이미 기본 프로필 사진입니다.");
    				return;
    			}
    			
    			// 기본사진으로 미리보기 화면 변경
    			// 전에 이미지 비우고 
    			let userPhoto = $("#userPhoto");
    			userPhoto.empty();
    			// 기본 이미지로 미리보기에 띄우기
                $("<img />", {
                    "src": "/resources/img/myInfo.png",
                    "class": "thumb-image"
                }).appendTo(userPhoto);
    			$(location).attr("href", "${pagecontext.request.contextPath}/member/defaultPP.do?user_id=${loginSession.user_id}");
    		}
        })
        
    	
    	// 프로필사진 변경취소 버튼
    	$("#cancelPhotoBtn").on("click", function(){
    		$("#showPhotoBtnBox").css("display", "inline-block");
    		$("#photoBtnBox").css("display", "none");
    		
    		// 기본사진으로 미리보기 화면 변경
			// 전에 이미지 비우고 
			let userPhoto = $("#userPhoto");
			userPhoto.empty();
			// 기본 이미지로 미리보기에 띄우기
            $("<img />", {
                "src": "${pagecontext.request.contextPath}/profilePhotos/${dto.profile_path}",
                "class": "thumb-image"
            }).appendTo(userPhoto);
			$("#searchPhoto").val("");
    	})
    	
    	// 프로필사진 변경 확인 버튼
    	$("#confirmPhotoBtn").on("click", function(){
    		$("#modifyProfilePhotoForm").submit();
    	})
    
    	/* 회원정보 수정 */
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
	    
	    // 닉네임 정규식 및 중복검사
	    // 닉네임 정규식 검사(정규식이 맞으면 버튼 활성화)
	    $("#inputUser_nickname").on("keyup", function(){
	    	// 닉네임 수정 시 input창 내용 삭제
	    	$("#user_nickname").val("");
			let regExp = /^[가-힣a-zA-Z0-9]{4,12}$/;
			if($("#inputUser_nickname").val() != "") {
				if(regExp.test($("#inputUser_nickname").val())){
					$("#nickname_regex").html("중복검사 버튼을 눌러주세요").css("color", "green");
					$("#nicknameCheckBtn").attr("disabled", false);
				} else if(!regExp.test($("#inputUser_nickname").val())){
					$("#nickname_regex").html("양식에 맞게 입력해주세요.").css("color", "red");
					$("#nicknameCheckBtn").attr("disabled", true);
				} 
			}
		})
		// 닉네임 중복검사(중복검사가 확인이 되면 input태그에 값 채워넣기)
		$("#nicknameCheckBtn").on("click", function(){
			let nickname = $("#inputUser_nickname").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/toNicknameCheck.do"
				, type : "post"
				, data : {nickname : nickname}
			}).done(function(rs){
				console.log(rs);
				if($("#nickname").val() != "") {
					if(rs == "available"){
						alert("사용할 수 있는 닉네임입니다.");
						$("#user_nickname").val($("#inputUser_nickname").val());
					}else if(rs == "unavailable"){
						alert("사용할 수 없는 닉네임입니다.");
					}
				}else {
					alert("닉네임을 입력해주세요");
					return;
				}
			}).fail(function(e){
				console.log(e);
			});
		})
    	
    	// 전화번호 정규식 및 중복검사
		// 전화번호 정규식 검사
    	$("#phone2").on("keyup", function(){
			if( !( (event.keyCode >= 48 && event.keyCode<=57) || (event.keyCode >= 96 && event.keyCode <= 105)
				|| event.keyCode==8 ) ){
					$("#phone2").val("");
					alert("숫자만 입력해주세요.");
				event.returnValue=false;
			}
			$(".verification").css("display", "none");
			$("#phone").val("");
	   })
	   
	   $("#phone3").on("keyup", function(){
			if( !( (event.keyCode >= 48 && event.keyCode<=57) || (event.keyCode >= 96 && event.keyCode <= 105)
				|| event.keyCode==8 ) ){
				$("#phone3").val("");
					alert("숫자만 입력해주세요.");
				event.returnValue=false;
			}
			$(".verification").css("display", "none");
			$("#phone").val("");
		})
		
		let code2 = "";	// 전화번호 인증코드
		// 전화번호 중복검사(중복검사가 확인이 되면 input태그에 값 채워넣기)
		$("#phoneCheckBtn").on("click", function(){
			$("#verificationBtn").attr("disabled", true);
			let phoneReg = /[0-9]{4}/;
            if(phoneReg.test($("#phone2").val()) && phoneReg.test($("#phone3").val())){
                alert("인증요청합니다.");
                let phone = $("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val();
    	    	$.ajax({
    	    		type:"GET",
    	    		url:"${pageContext.request.contextPath}/member/phoneCheck?phone=" + phone, 
    	    		cache : false,
    	    		success:function(data){
    	    			if(data === "duplication"){	// 전화번호 중복 발생
    	    				alert("이미 등록되어 있는 전화번호 입니다. 다시 입력해주세요.");
    	    				$("#phone2").val("");
    	    				$("#phone3").val("");
    	    			} else{
    	    				$("#phoneCheck").attr("disabled",false);
    	    				alert("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
    	    				code2 = data;
    	    				$("#verificationBtn").attr("disabled",false);
    	    				$(".verification").css("display", "inline-block");
    	    			}
    	    		}
    	    	})
            } else {
                alert("전화번호 다시 입력해주세요");
            }
		})
		
		//휴대폰 인증번호 대조
	  	$("#verificationBtn").on("click", function(){
	  		if($("#verification").val() == code2){
	  			$("#phone").val($("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val());
	  			$("#verificationBtn").attr("disabled",true);
	  			alert("인증번호가 일치합니다.감사합니다.");
	  		}else if($("#phoneCheck").val() != code2){
	  			$(this).attr("autofocus",true);
	  			alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
	  		}
	  	})
    	
    	
    	// 이메일 정규식 및 중복검사
    	// 이메일 정규식 검사
    	$("#inputEmail").on("keyup", function(){
    		$("#email").val("");
			let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if($("#inputEmail").val() != "") {
				if(regExp.test($("#inputEmail").val())){
					$("#email_regex").html("중복검사 버튼을 눌러주세요").css("color", "green");
					$("#emailCheckBtn").attr("disabled", false);
				} else if(!regExp.test($("#inputEmail").val())){
					$("#email_regex").html("이메일 양식에 맞게 입력해주세요 예)XXXX@XXXXX.XXX").css("color", "red");
					$("#emailCheckBtn").attr("disabled", true);
				}
			}else if($("#inputEmail").val() == ""){
				$("#email_regex").empty();
			}
		})
    	
    	// 이메일 중복검사(중복검사가 확인이 되면 input 태그에 값 채워넣기)
	    $("#emailCheckBtn").on("click", function(){
			let email = $("#inputEmail").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/member/toEmailCheck.do"
				, type : "post"
				, data : {email : email}
			}).done(function(rs){
				console.log(rs);
				if(rs == "available"){
					alert("사용할 수 있는 이메일입니다.");
					$("#email").val($("#inputEmail").val());
				}else if(rs == "unavailable"){
					alert("사용할 수 없는 이메일입니다.");
				}
			}).fail(function(e){
				console.log(e);
			});
		})
		
		// 우편번호 버튼
		$("#postcodeBtn").on("click", function(){
			console.log("우편번호 버튼 클릭");
			$("#inputAddress").val("");
		})
		
		// 상세주소 입력 시 주소창에 채우기
		$("#edited_detailAddress").on("keyup", function(){
			let editedAddress = $("#edited_postcode").val() + " " + $("#edited_roadAddress").val() + " "
            + $("#edited_jibunAddress").val() + " " + $("#edited_detailAddress").val() + " "
            + $("#edited_extraAddress").val();
	    	$("#inputAddress").val(editedAddress);
		})
		
    	
	    // 회원정보수정 후 수정 버튼
	    // ajax로 비동기 통신을 할 때 type: "post"방식으로 넘겨주려면 넘겨줄 값을 data: 여기에 serialize()된 변수를 써줘야 한다.
	    // ajax로 key-value값으로 된 데이터를 받을 수 있는데 jackson으로는 객체를 받을 수 있다.
	    $("#confirmBtn").on("click", function(){
	    	console.log("회원정보수정버튼 클릭 후 주소: " + $("#inputAddress").val());
	    	// 유효성 검사(닉네임, 전화번호, 이메일, 주소 빈값검사)
	    	if($("#user_nickname").val() === "") {
	    		alert("닉네임 중복검사를 실행해주세요");
	    		return ;
	    	} else if($("#phone").val() === "") {
	    		alert("전화번호 중복검사를 실행해주세요");
	    		return ;
	    	} else if($("#email").val() === "") {
	    		alert("이메일 중복검사를 실행해주세요");
	    		return ;
	    	} else if($("#inputAddress").val() === "" && $("#edited_detailAddress").val() === "") {
	    		alert("주소를 상세히 입력해 주세요");
	    		return ;
	    	}
	    	// 주소 입력
    		
	    	let data = $("#userInfoForm").serialize();
			console.log("userInfoForm.serialize(): " + data);
			
		    $.ajax({
		    	// <form>태그 안에 수정사항을 직렬화 하여 변수에 담기
		    	url: "${pagecontext.request.contextPath}/member/modify.do",
		    	type: "post",
		    	data: data
		    	}).done(function(rs){
		    		if(rs !== null){	// 변경 성공 시 회원정보칸에 수정된 정보 넣어주기 및 버튼 바꾸기. String이 아닌 DTO로 받아주기
		    			// 기존 input창에 수정된 dto정보로 대체
		    			$("#viewUser_nickname").html(rs.user_nickname);
		    			$("#viewPhone").html(rs.phone);
		    			$("#viewEmail").html(rs.email);
		    			$("#viewAddress").html(rs.address);
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
	        
	        let temp = "${dto.phone}";
	        $("#phone2").val(temp.substring(3,7));
	        $("#phone3").val(temp.substring(7));
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