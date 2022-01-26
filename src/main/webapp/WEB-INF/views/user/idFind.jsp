<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	.btnBox > div {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container">
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
                <button type="button" class="btn btn-dark" id="btn_phone">인증전송</button>
            </div>
        </div>
        
        <div class="row mb-3">
            <div class="col-10">
                <input id="phoneCheck" class="form-control" type="text" >
            </div>
            <div class="col-2">
                <button type="button" id="btn_phoneCk" class="btn btn-dark">인증확인</button>
            </div>
        </div>
        <input type="hidden" id="phoneDoubleChk">
        <div class="d-none">
            <input type="text" id="phone" name="phone">
        </div>
        
        <div id="idView">
        	<label>아이디</label>
        </div>
        
        <div class="row my-5 btnBox">
        <div class="col">
            <button class="btn btn-secondary btn-lg clsBtn" type="button" id="backBtn">뒤로 가기</button>
        </div>
    	</div>
    </div>
    
    
        
        <script>
     	// 문자인증
        let code2 = "";
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
        				alert("휴대폰 번호가 올바르지 않습니다.");
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
      			$("#phoneCheck").attr("disabled",true);
      			alert("인증번호가 일치합니다.감사합니다.");
      			let phone = $("#phone").val();
      			$.ajax({
      				url : "${pageContext.request.contextPath}/member/toIdFind.do"
      				, type : "post"
      				, data : {phone : phone}
      			}).done(function(rs){
      				$("#idView").html(rs);
      			}).fail(function(e){
      				console.log(e);
      			});
      			
      		}else if($("#phoneCheck").val() != code2){
      			$(this).attr("autofocus",true);
      			alert("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
      		}
      	})
      	
      	// 뒤로가기 버튼
	    $("#backBtn").click(function(){
	    	location.href="${pageContext.request.contextPath}/toLogin.do"
	    })
        </script>
</body>
</html>