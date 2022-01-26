<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	.btnBox>div{
    	text-align: center;
    }
    #completeBtn{
        float: right;
    }
    #backBtn{
        float: left;
    }
</style>
</head>
<body>
	<h2 style="text-align:center;">비밀번호 찾기</h2>
	<div class="container">
		<div id="idBox">
			<div class="row mb-2">
	            <div class="col">
	                <label>비밀번호 찾으실 아이디를 입력해주세요.</label>
	            </div>
	        </div>
	        <div class="row mb-3">
	            <div class="col-10">
	                <input type="text" class="form-control" id="id" name="id">
	            </div>
	            <div class="col-2">
	                <button type="button" class="btn btn-dark" id="btn_idcheck">ID확인</button>
	            </div>
	        </div>
	        <div id="id_regex"></div>
        </div>
        
        
        <div id="phoneBox" style="display:none;">
        	<div class="row mb-2">
	            <div class="col">
	                <label>휴대전화 인증을 진행해주세요.</label>
	            </div>
	        </div>
			<div class="row mb-3" >
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
	                <button type="button" class="btn btn-dark" id="btn_phone">인증전송</button>
	            </div>
	        </div>
	        
	        <div class="row mb-3">
	            <div class="col-10">
	                <input id="phoneCheck" class="form-control" type="text" > <!--disabled required>  -->
	            </div>
	            <div class="col-2">
	                <button type="button" id="btn_phoneCk" class="btn btn-dark">인증확인</button>
	            </div>
	        </div>
	        <input type="hidden" id="phoneDoubleChk">
	        <!--휴대전화번호 병합하여 저장할 곳( 회원가입 버튼 클릭시 이곳으로 phone1+phone2+phon3 value값 더해서 입력할것)-->
	        <div class="d-none">
	            <input type="text" id="phone" name="phone">
	        </div>
        </div>
        <form id="pwForm" action="${pageContext.request.contextPath}/member/toPwfind.do" method="post">
        <input type="text" class="form-control" id="user_id" name="user_id" hidden>
        <div id="pwBox" style="display:none;">
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
		</div>
		</form>
	</div>
	
	<div class="row my-5 btnBox">
        <div class="col-6" id="completeBtnBox">
            <button class="btn btn-dark btn-lg clsBtn" type="button" id="completeBtn" style="display:none;" disabled>변경 완료</button>
        </div>
        <div class="col-6">
            <button class="btn btn-secondary btn-lg clsBtn" type="button" id="backBtn">뒤로 가기</button>
        </div>
    </div>

	<script>
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
				alert("해당하는 아이디가 없습니다. \n다시한번 확인해주세요.");
			}else if(rs == "unavailable"){
				$("#user_id").val($("#id").val());
				$("#idBox").hide();
				$("#phoneBox").css("display", "block");
			}
		}).fail(function(e){
			console.log(e);
		});
    	} else {
    		alert("양식에 맞게 입력해주세요.");
    		return;
    	}
	})

	// 문자인증
    let code2 = "1111";
    $("#btn_phone").click(function(){
    	$("#phone").val($("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val());
    	let phone = $("#phone").val();
    	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
    	$.ajax({
    		type:"GET",
    		url:"${pageContext.request.contextPath}/member/phoneCheck?phone=" + phone, 
    		cache : false,
    		success:function(data){
    			if(data == "error"){
    				alert("휴대폰 번호가 올바르지 않습니다.")
    			}else{
    				$("#phoneCheck").attr("disabled",false);
    				alert("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
    				code2 = data;
    			}
    		}
    	})
    })
    
  	//휴대폰 인증번호 대조
  	$("#btn_phoneCk").click(function(){
  		if($("#phoneCheck").val() == code2){
  			alert("인증번호가 일치합니다.비밀번호를 교체해주세요.");
  			$("#phoneBox").hide();
			$("#pwBox").css("display", "block");
			$("#completeBtn").css("display", "block");
  		}else if($("#phoneCheck").val() != code2){
  			alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
  		}
  	})
  	
  	$("#completeBtn").click(function(){
  		if($("#password").val() == ""){   
        	alert("비밀번호를 입력해주세요.");
         	$("#password").focus();
         	return
        }else if($("#pwcheck_regex").html() != "비밀번호가 일치합니다." && $("#pw_regex").html() == "적절하지 않습니다."){
            alert("비밀번호를 형식에 맞게 입력해주세요.");
            $("#password").val("");
            $("#password").focus();
            return
        }
  		$("#pwForm").submit();
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
	    		$("#completeBtn").attr("disabled",false);
	    	}else if($("#password").val() != ($("#checkPw").val())){
	    		$("#pwcheck_regex").html("비밀번호가 일치하지 않습니다.").css("color", "red");
	    		$("#completeBtn").attr("disabled",true);
	    	}
    	}else if($("#password").val() == ""){
			$("#pw_regex").empty();
		}
    })
    
    $("#checkPw").on("keyup", function(){
    	if($("#checkPw").val() != "") {
    		if($("#password").val() == ($("#checkPw").val())){
        		$("#pwcheck_regex").html("비밀번호가 일치합니다.").css("color", "green");
        		$("#completeBtn").attr("disabled",false);
        	}else if($("#password").val() != ($("#checkPw").val())){
        		$("#pwcheck_regex").html("비밀번호가 일치하지 않습니다.").css("color", "red");
        		$("#completeBtn").attr("disabled",true);
        	}
    	}else if($("#checkPw").val() == ""){
			$("#pwcheck_regex").empty();
			$("#completeBtn").attr("disabled",true);
		}
    })
    
    // 뒤로가기 버튼
    $("#backBtn").click(function(){
    	location.href="${pageContext.request.contextPath}/toLogin.do"
    })
  	
  	
	</script>
</body>
</html>