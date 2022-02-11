<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>SignUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        *{margin: 0;}
        body{
            background-color: lightgray;
        }
        .container{
            background-color: white;
            margin-top:20px;
            border-radius: 10px;
            width:900px;
            padding:80px;
        }
        #id_regex{
        	font-size: 11px;
        	margin-top:0px;
        }
        #pw_regex{
        	font-size: 11px;
        	margin-top:0px;
        }
        #pwcheck_regex{
        	font-size: 11px;
        	margin-top:0px;
        }
        .photoBox>div{
            text-align: center;
        }
        img{
            width:300px;
            height: 300px;;
        }
        .btnBox>div{
            text-align: center;
        }
        #submitBtn{
            float: right;
        }
        #backBtn{
            float: left;
        }
    </style>
</head>
<body>
	<form id="formSignup" action="${pageContext.request.contextPath}/member/signup.do" method="post">
    <div class="container">
        <div class="row mb-3 photoBox">
            <div class="col">
               <img src="/resources/img/logo.png">
            </div>
        </div>
        <div class="row mb-2">
            <div class="col">
                <label> 아이디(4~16자 이내)</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="id" name="id">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-dark" id="btn_idcheck">중복검사</button>
            </div>
        </div>
        <div id="id_regex"></div>
       	<br>
       	<input type="text" class="form-control" id="user_id" name="user_id" hidden>

        <div class="row mb-2">
            <div class="col">
                <label> 비밀번호(8자 이상 20자 이하의 영문, 숫자, 특수문자를 조합)</label>
            </div>
        </div>
        <div class="row mb-1">
            <div class="col-10">
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력">
            </div>
        </div>
        <div id="pw_regex"></div>
        <div class="row">
            <div class="col-10">
                <input type="password" class="form-control" id="checkPw" placeholder="비밀번호 확인">
            </div>
        </div>
        <!-- 비밀번호 일치시 초록글씨, 불일치시 빨간글씨-->
        <div id="pwcheck_regex"></div>
		<br>
        <div class="row mb-2">
            <div class="col">
                <label> 닉네임(4~12자 이내)</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="nickname" name="nickname">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-dark" id="btn_nickname">중복검사</button>
            </div>
        </div>
        <input type="text" class="form-control" id="user_nickname" name="user_nickname" hidden>
        
        <div id="nickname_regex"></div>
        <div class="row mb-2">
            <div class="col">
                <label> 이메일</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="em" name="em">
            </div>
            <div class="col-2">
                <button id="btn_email" type="button" class="btn btn-dark">중복검사</button>
            </div>
        </div>
        
        <div class="row mb-3" id="emailCkBox" style="display:none;">
        	<div class="col-10" id="emailCheckInput">
                <input id="emailCheck" class="form-control" type="text" >
            </div>
            <div class="col-2" id="emailSendBox">
                <button type="button" class="btn btn-dark" id="mail_check_button">인증전송</button>
            </div>
            <div class="col-2" id="emailCheckBox" style="display:none;">
                <button type="button" class="btn btn-dark" id="btn_emailCk" >인증확인</button>
            </div>
        </div>
        <input type="hidden" id="emailDoubleChk">
        <input type="text" class="form-control" id="email" name="email" hidden>
        <div id="email_regex"></div>
        <div class="row mb-2">
            <div class="col">
                <label> 휴대전화</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-4">
                <select class="form-select" aria-label="Default select example" id="phone1" required>
                    <option selected>010</option>
                    <option value="1">011</option>
                    <option value="2">016</option>
                    <option value="2">017</option>
                    <option value="3">018</option>
                </select>
            </div>
            <div class="col-3">
                <input type="text" class="form-control" id="phone2" maxlength="4">
            </div>
            <div class="col-3">
                <input type="text" class="form-control" id="phone3" maxlength="4">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-dark" id="btn_phoneCheck">중복확인</button>
            </div>
        </div>
        
        <div class="row mb-3" style="display:none;" id="phoneCkBox">
            <div class="col-10">
                <input id="phoneCheck" class="form-control" type="text" >
            </div>
            <div class="col-2" id="btn_phoneBox">
                <button type="button" class="btn btn-dark" id="btn_phone">인증전송</button>
            </div>
            <div class="col-2" style="display:none;" id="btn_phoneCkBox">
                <button type="button" id="btn_phoneCk" class="btn btn-dark">인증확인</button>
            </div>
        </div>
        <input type="hidden" id="phoneDoubleChk">
        <!--휴대전화번호 병합하여 저장할 곳( 회원가입 버튼 클릭시 이곳으로 phone1+phone2+phon3 value값 더해서 입력할것)-->
        <div class="d-none">
            <input type="text" id="phone" name="phone">
        </div>
        
        <div class="row">
        	<div class="col-2">
        		<input type="checkbox" class="form-check-input" name="emailCheckBox2" id="emailCheckBox2">이메일 인증
        	</div>
        	<div class="col-3">
        		<input type="checkbox" class="form-check-input" name="phoneCheckBox2" id="phoneCheckBox2">휴대전화 인증
        	</div>
        </div>
		

        <div class="row mb-2">
            <div class="col">
                <label> 주소</label>
            </div>
        </div>
         <!--주소 영역-->
         <div class="row" id="daum-postcode">
            <div class="col-12 col-md-6 my-2">
                <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호"
                    readonly>
            </div>
            <div class="col-12 col-md-6 my-2">
                <div id="wrap-findPostcode"><input type="button" onclick="sample4_execDaumPostcode()"
                        value="우편번호 찾기" class="btn btn-dark btnPost"></div>
            </div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_roadAddress"
                     placeholder="도로명주소" readonly></div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_jibunAddress"
                    placeholder="지번주소" readonly></div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_detailAddress"
                     placeholder="상세주소"></div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_extraAddress"
                     placeholder="참고항목" readonly></div>
            <!--주소 병합하여 저장할 곳-->
            <div class="col-12 d-none">
                <input type="text" id="user_address" name="address">
            </div>
        </div>

        <!--버튼 영역-->
        <div class="row my-5 btnBox">
            <div class="col-6">
                <button class="btn btn-dark btn-lg clsBtn" type="button" id="submitBtn">가입 완료</button>
            </div>
            <div class="col-6">
                <button class="btn btn-secondary btn-lg clsBtn" type="button" id="backBtn">뒤로 가기</button>
            </div>
        </div>
    </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    // 엔터 이벤트
    
    // 아이디 중복 엔터
    $("#id").on("keypress", function(e){
    	if(e.keyCode == "13"){
    		$('#btn_idcheck').click();
    	}
    });
    
    // 닉네임 중복 엔터
    $("#nickname").on("keypress", function(e){
    	if(e.keyCode == "13"){
    		$("#btn_nickname").click();
    	}
    });
    
    // 이메일 중복 엔터
    $("#em").on("keypress", function(e){
    	if(e.keyCode == "13"){
    		$("#btn_email").click();
    	}
    });
    
    // 휴대전화 인증 엔터
    $("#phone3").on("keypress", function(e){
    	if(e.keyCode == "13"){
    		$("#btn_phone").click();
    	}
    });
    
    // 휴대전화 인증확인 엔터
    $("#phoneCheck").on("keypress", function(e){
    	if(e.keyCode == "13"){
    		$("#btn_phoneCk").click();
    	}
    });
    
    // 인증 체크박스    
//     $(document).ready(function(){
//     	$(document).on('change', 'input[name=emailCheckBox2]', function(){
//             if($("#emailCheckBox2")) {
            	
//             }
//         });
//     });
    
    $(document).ready(function(){
    $("#emailCheckBox2").change(function(){
        if($("#emailCheckBox2").is(":checked")){
            $("#emailCkBox").css("display", "flex");
        }else{
        	$("#emailCkBox").css("display", "none");
        }
    });
    
    $("#phoneCheckBox2").change(function(){
        if($("#phoneCheckBox2").is(":checked")){
            $("#phoneCkBox").css("display", "flex");
        }else{
        	$("#phoneCkBox").css("display", "none");
        }
    });
    
	});
    
    
    
    // 이메일 인증
    let code = "";
    
    $("#mail_check_button").click(function(){
    	let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    	if($("#em").val() != "") {
    		if(regExp.test($("#em").val())) {
    			if($("#email").val() != "") {
    				let email = $("#email").val();
                	
                	$.ajax({
                        type:"GET",
                        url:"${pageContext.request.contextPath}/member/mailCheck?email=" + email,
                        success:function(data){
                        	alert("인증번호를 전송했습니다. \n이메일을 확인해주세요.");
                        	$("#emailSendBox").hide();
                        	$("#emailCheckBox").css("display", "block");
                        	code = data;
                        }
                    })
    			} else {
    				alert("이메일 중복검사후 인증을 진행해주세요.");	
    			}
    		}else {
    			alert("이메일을 양식에 맞게 입력해주세요.");
    		}
    	}else {
    		alert("이메일을 입력해주세요.");
    	}
	})
	
	$("#btn_emailCk").click(function(){
  		if($("#emailCheck").val() != "") {
  			if($("#emailCheck").val() == code){
	  			$("#emailDoubleChk").val("true");
	  			$("#emailCkeck").attr("disabled",true);
	  			alert("인증번호가 일치합니다.감사합니다.");
	  		}else if($("#emailCheck").val() != code){
	  			$("#emailDoubleChk").val("false");
	  			$(this).attr("autofocus",true);
	  			alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
	  		}
  		}
  	})
    
    // 문자인증
    let code2 = "";
    $("#btn_phone").click(function(){
    	if($("#phone").val() != ""){
        	let phone = $("#phone").val();
        	$.ajax({
        		type:"GET",
        		url:"${pageContext.request.contextPath}/member/phoneCheck?phone=" + phone, 
        		cache : false,
        		success:function(data){
        				if(data == "error"){
            				alert("휴대폰 번호가 올바르지 않습니다.")
            			}else{
            				$("#btn_phoneBox").hide();
            				$("#btn_phoneCkBox").css("display", "block");
            				alert("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
            				code2 = data;
            			}
        			}
        	})
    	}else {
    		alert("전화번호 중복확인 후 진행해주세요.");
    	}
    })
    
  	//휴대폰 인증번호 대조
  	$("#btn_phoneCk").click(function(){
  		if($("#phoneCheck").val() != "") {
  			if($("#phoneCheck").val() == code2){
	  			$("#phoneDoubleChk").val("true");
	  			$("#phoneCheck").attr("disabled",true);
	  			alert("인증번호가 일치합니다.감사합니다.");
	  		}else if($("#phoneCheck").val() != code2){
	  			$("#phoneDoubleChk").val("false");
	  			$(this).attr("autofocus",true);
	  			alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
	  		}
  		}
  	})

    // 유효성검사
    // ID 정규식
    $("#id").on("keyup", function(){
    	$("#user_id").val("");
    	let regExp = /^[a-z0-9]{4,16}$/;
    	if($("#id").val() != ""){
    		if(regExp.test($("#id").val())){
            	$("#id_regex").html("중복검사를 해주세요").css("color", "green");
            }else if(!regExp.test($("#id").val())){
               	$("#id_regex").html("4자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합").css("color", "red");
            }
    	}else if($("#id").val() == ""){
			$("#id_regex").empty();
		}
    })
    
    // PW 정규식
    $("#password").on("keyup", function(){
    	let regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    	if($("#password").val() != ""){
    		if(regExp.test($("#password").val())){
            	$("#pw_regex").html("적절합니다.").css("color", "green");
            }else if(!regExp.test($("#user_id").val())){
               	$("#pw_regex").html("적절하지 않습니다.").css("color", "red");
            }
    	}else if($("#password").val() == ""){
			$("#pw_regex").empty();
		}
    	if($("#checkPw").val() != "") {
	    	if($("#password").val() == ($("#checkPw").val())){
	    		$("#pwcheck_regex").html("비밀번호가 일치합니다.").css("color", "green");
	    	}else if($("#password").val() != ($("#checkPw").val())){
	    		$("#pwcheck_regex").html("비밀번호가 일치하지 않습니다.").css("color", "red");
	    	}
    	}else if($("#password").val() == ""){
			$("#pw_regex").empty();
		}
    })
    
    $("#checkPw").on("keyup", function(){
    	if($("#checkPw").val() != "") {
    		if($("#password").val() == ($("#checkPw").val())){
        		$("#pwcheck_regex").html("비밀번호가 일치합니다.").css("color", "green");
        	}else if($("#password").val() != ($("#checkPw").val())){
        		$("#pwcheck_regex").html("비밀번호가 일치하지 않습니다.").css("color", "red");
        	}
    	}else if($("#checkPw").val() == ""){
			$("#pwcheck_regex").empty();
		}
    })
    
    // 닉네임 정규식
    $("#nickname").on("keyup", function(){
    	$("#user_nickname").val("");
		let regExp = /^[가-힣a-zA-Z0-9]{4,12}$/;
		if($("#nickname").val() != "") {
			if(regExp.test($("#nickname").val())){
				$("#nickname_regex").html("중복검사 버튼을 눌러주세요").css("color", "green");
			} else if(!regExp.test($("#nickname").val())){
				$("#nickname_regex").html("양식에 맞게 입력해주세요.").css("color", "red");
			}
		}else if($("#nickname").val() == ""){
			$("#nickname_regex").empty();
		}
	})
    
    // 이메일 정규식
    $("#em").on("keyup", function(){
    	$("#emailCheckBox").hide();
    	$("#emailSendBox").css("display", "block");
    	$("#email").val("");
		let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if($("#em").val() != "") {
			if(regExp.test($("#em").val())){
				$("#email_regex").html("중복검사 버튼을 눌러주세요").css("color", "green");
			} else if(!regExp.test($("#email").val())){
				$("#email_regex").html("이메일 양식에 맞게 입력해주세요 예)XXXX@XXXXX.XXX").css("color", "red");
			}
		}else if($("#em").val() == ""){
			$("#email_regex").empty();
		}
	})
    
    // 휴대전화 정규식
	$("#phone2").on("keyup", function(){
		$("#btn_phoneCkBox").hide();
		$("#btn_phoneBox").css("display", "block");
		$("#phone").val("");
		if( !( (event.keyCode >= 48 && event.keyCode<=57) || (event.keyCode >= 96 && event.keyCode <= 105)
			|| event.keyCode==8 || event.keyCode==9 || event.keyCode==13 || event.keyCode==144) ){
				$("#phone2").val("");
				alert("숫자만 입력해주세요.");
			event.returnValue=false;
		}
    })
    
    $("#phone3").on("keyup", function(){
    	$("#btn_phoneCkBox").hide();
		$("#btn_phoneBox").css("display", "block");
    	$("#phone").val("");
		if( !( (event.keyCode >= 48 && event.keyCode<=57) || (event.keyCode >= 96 && event.keyCode <= 105)
			|| event.keyCode==8 || event.keyCode==9 || event.keyCode==13 || event.keyCode==144) ){
			$("#phone3").val("");
				alert("숫자만 입력해주세요.");
			event.returnValue=false;
		}
    })
	
    // 아이디 중복확인
    $("#btn_idcheck").on("click", function(){
    	let regExp = /^[a-z0-9]{4,16}$/;
    	if(regExp.test($("#id").val())){
		let id = $("#id").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/toIdCheck.do"
			, type : "post"
			, data : {id : id}
		}).done(function(rs){
			console.log(rs);
			if(rs == "available"){
				alert("사용할 수 있는 아이디입니다.");
				$("#user_id").val($("#id").val());
			}else if(rs == "unavailable"){
				alert("사용할 수 없는 아이디입니다.");
			}
		}).fail(function(e){
			console.log(e);
		});
    	} else {
    		alert("양식에 맞게 입력해주세요.");
    		return;
    	}
	})
	
	// 닉네임 중복확인
    $("#btn_nickname").on("click", function(){
    	let regExp = /^[가-힣a-zA-Z0-9]{4,12}$/;
    	if(regExp.test($("#nickname").val())){
		let nickname = $("#nickname").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/member/toNicknameCheck.do"
			, type : "post"
			, data : {nickname : nickname}
		}).done(function(rs){
			console.log(rs);
			if($("#nickname").val() != "") {
				if(rs == "available"){
					alert("사용할 수 있는 닉네임입니다.");
					$("#user_nickname").val($("#nickname").val());
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
    	}else {
    		alert("양식에 맞게 입력해주세요.");
    		return;
    	}
	})
    
	
	// 이메일 중복확인
    $("#btn_email").on("click", function(){
    	let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    	if(regExp.test($("#em").val())){
		let email = $("#em").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/member/toEmailCheck.do"
			, type : "post"
			, data : {email : email}
		}).done(function(rs){
			console.log(rs);
			if(rs == "available"){
				alert("사용할 수 있는 이메일입니다.");
				$("#email").val($("#em").val());
				$("#emailCheckBox").hide();
            	$("#emailSendBox").css("display", "block");
			}else if(rs == "unavailable"){
				alert("사용할 수 없는 이메일입니다.");
			}
		}).fail(function(e){
			console.log(e);
		});
    	} else {
    		alert("양식에 맞게 입력해주세요.");
    		return;
    	}
	})
	
	// 핸드폰 중복확인
    $("#btn_phoneCheck").on("click", function(){
    	if($("#phone2").val() != "" && $("#phone3").val() != ""){
		let phone = $("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/member/toPhoneCheck.do"
			, type : "post"
			, data : {phone : phone}
		}).done(function(rs){
			console.log(rs);
				if(rs == "available"){
					$("#phone").val($("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val());
					$("#btn_phoneCkBox").hide();
    				$("#btn_phoneBox").css("display", "block");
					alert("사용할 수 있는 전화번호입니다.");
				}else if(rs == "unavailable"){
					alert("사용할 수 없는 휴대전화번호 입니다.");
				}
		}).fail(function(e){
			console.log(e);
		});
    	}else {
    		alert("양식에 맞게 입력해주세요.");
    		return;
    	}
	})
	
	
	// 회원가입 버튼 클릭시
	$("#submitBtn").click(function(){
		user_address.value = sample4_postcode.value + " " + sample4_roadAddress.value
		 + " " + sample4_jibunAddress.value + " " + sample4_detailAddress.value + " " + sample4_extraAddress.value
		
		 if($("#user_id").val() == ""){
	            alert("아이디 입력 및 중복검사를 해주세요.");
	            $("#id").focus();
	            return
	         }else if($("#password").val() == ""){   
	            alert("비밀번호를 입력해주세요.");
	            $("#password").focus();
	            return
	         }else if($("#pwcheck_regex").html() != "비밀번호가 일치합니다." && $("#pw_regex").html() == "적절하지 않습니다."){
	            alert("비밀번호를 형식에 맞게 입력해주세요.");
	            $("#password").val("");
	            $("#password").focus();
	            return
	         }else if($("#nickname").val() == ""){
	            alert("닉네임을 입력해주세요.");
	            $("#nickname").focus();
	            return
	         }else if($("#user_nickname").val() == ""){
	            alert("닉네임 중복검사를 해주세요.");
	            $("#nickname").focus();
	            return
	         }else if($("#phone").val() == ""){
		        alert("휴대전화 중복확인을 해주세요");
		        $("#phone2").focus();
		        return
		     }else if($("#phoneDoubleChk").val() == "" && $("#emailDoubleChk").val() == ""){
	            alert("휴대전화 혹은 이메일 인증절차를 진행해주세요.");
	            return
	         }else if($("#phoneDoubleChk").val() == "false" && $("#emailDoubleChk").val() == "false"){
		        alert("휴대전화 혹은 이메일 인증번호를 다시 입렵해주세요.");
		        return
		     }else if($("#em").val() == ""){
	            alert("이메일을 입력해주세요.");
	            $("#em").focus();
	            return
	         }else if($("#email").val() == ""){
	            alert("이메일 중복검사를 해주세요.");
	            $("#em").focus();
	            return
	         }else if($("#sample4_postcode").val() == ""){
	            alert("우편번호 찾기를 진행해주세요.");
	            $("#postCode").focus();
	            return
	         }
		
		
		$("#formSignup").submit();
		alert("회원가입이 완료되었습니다. \n 앞으로 많은 이용 부탁드립니다. \n 감사합니다.");
	})
	
	// 뒤로가기 버튼
    $("#backBtn").click(function(){
    	location.href="${pageContext.request.contextPath}/toLogin.do"
    })
         // 다음 우편번호 API
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if (roadAddr !== '') {
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }
                    var guideTextBox = document.getElementById("guide");
                }
            }).open();
        }
    </script>
</body>
</html>