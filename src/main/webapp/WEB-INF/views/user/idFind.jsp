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
	@font-face{
    font-family: 'BMHANNAAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{background-color:#6DCEF520;font-family: 'BMHANNAAir';}
	.container{background-color: white; height:540px;}
	h2{margin:40px;}
	.btnBox > div {
		text-align: center;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h2 style="text-align:center;">아이디 찾기</h2>
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
                <button type="button" class="btn btn-dark" id="btn_phone">인증전송</button>
            </div>
        </div>
        
        <div class="row mb-3" id="phoneCkBox" style="display:none;">
            <div class="col-10">
                <input id="phoneCheck" class="form-control" type="text" >
            </div>
            <div class="col-2">
                <button type="button" id="btn_phoneCk" class="btn btn-dark">인증확인</button>
            </div>
        </div>
        
        <div class="d-none">
            <input type="text" id="phone" name="phone">
        </div>
        
        <div class="row mb-2">
            <div class="col">
                <label> 이메일</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="em" name="em">
            </div>
            <div class="col-2" id="emailSendBox">
                <button type="button" class="btn btn-dark" id="mail_check_button">인증전송</button>
            </div>
        </div>
        
        <div class="row mb-3" id="emailCkBox" style="display:none;">
        	<div class="col-10">
                <input id="emailCheck" class="form-control" type="text" >
            </div>
            
            <div class="col-2" id="emailCheckBox">
                <button type="button" class="btn btn-dark" id="btn_emailCk">인증확인</button>
            </div>
        </div>
        
        <div class="row">
        	<div class="col-3">
        		<input type="checkbox" class="form-check-input" name="phoneCheckBox2" id="phoneCheckBox2">휴대전화 인증
        	</div>
        	<div class="col-3">
        		<input type="checkbox" class="form-check-input" name="emailCheckBox2" id="emailCheckBox2">이메일 인증
        	</div>
        </div>
        <br>
        <div class="row">
        <div class="col" id="idViewBox">
        	<label>아이디</label>
        <h3><div id="idView"></div></h3>
        <br><br>
        </div>
        
        </div>
       
        
        <div class="row my-5 btnBox">
        <div class="col">
            <button class="btn btn-secondary btn-lg clsBtn" type="button" id="backBtn">닫기</button>
        </div>
    	</div>
    	
    	
    </div>
    
    <script>
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
    			let email = $("#em").val();
            	var data = {"email" : email}
            	$.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/member/idMailCheck",
                    data: data,
                    success:function(rs){
                    	if(rs == "error"){
            				alert("가입시 입력한 이메일과 일치하는 아이디가 없습니다.");
            			}else{
                    		alert("이메일을 확인후 인증번호를 입력해주세요.");
                    		code = rs;
            			}
                    }
                })
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
  				let email = $("#em").val();
      			$.ajax({
      				url : "${pageContext.request.contextPath}/member/toEmailIdFind.do"
      				, type : "post"
      				, data : {email : email}
      			}).done(function(rs){
      				$("#idView").html(rs);
      			}).fail(function(e){
      				console.log(e);
      			});
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
        if( $("#phone2").val() != "" || $("#phone3").val() != "" ){
        	$("#phone").val($("#phone1 option:selected").val() + $("#phone2").val() + $("#phone3").val());
            let phone = $("#phone").val();
            $.ajax({
            	type:"GET",
            	url:"${pageContext.request.contextPath}/member/idPhoneCheck?phone=" + phone, 
            	cache : false,
            	success:function(data){
            			if(data == "error"){
               				alert("가입시 입력한 휴대전화와 일치하는 아이디가 없습니다.");
               			}else{
               				$("#phoneCheck").attr("disabled",false);
               				alert("인증번호를 입력한 뒤 인증확인을 눌러주십시오.");
               				code2 = data;
               			}
            		}
            	})
        }else if( $("#phone2").val() == "" || $("#phone3").val() == "" ){
        	alert("전화번호를 입력후 인증을 진행해주세요.");
        }
	})
        
      	//휴대폰 인증번호 대조
      	$("#btn_phoneCk").click(function(){
      		if($("#phoneCheck").val() != "") {
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
      		}
       	})
      	
      		
      	
      	// 닫기 버튼
	    $("#backBtn").click(function(){
	    	window.close();
	    })
        </script>
</body>
</html>