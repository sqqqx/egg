<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>login</title>
    <style>
        *{margin:0; text-align: center;}
        body{
            background-color: #6DCEF520;
        }
        .container{
            background-color: white;
            width:800px;
            padding:120px;
            border: 1px solid black;
            border-radius: 10px;
        }
        a{
            color: black;
            text-decoration: none;
        }
        #backBtn{
        	position:absolute;
        	top:10px;
        }
        #loginBtn{
        	width:165px;
        	height:44px;
        }
        #kakaoLoginBtn{
        	cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
    	<button type="button" class="btn-close" id="backBtn" aria-label="Close"></button>
        <div class="row mb-4">
            <img src="/resources/img/logoBig.png">
        </div>
        <form id="loginForm">
        <div class="row mb-3">
            <div class="col-12">
              <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해주세요.">
            </div>
            
        </div>
        <div class="row mb-3">
            <div class="col">
                <input type="password" class="form-control" id="password" name="password" placeholder="패스워드를 입력해주세요.">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
				<input type="checkbox" class="form-check-input" id="rememberId" name="rememberId"> 아이디 기억하기
			</div>
        </div>
        <div class="row">
            <div class="col">
				<button type="button" class="btn btn-dark" id="loginBtn">로그인</button>
			</div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <a href="${pageContext.request.contextPath}/toSignup.do">회원가입</a> // 
                <a href="${pageContext.request.contextPath}/member/idFind.do" onclick="window.open(this.href,'_black', 'width=800, height=600'); return false;">아이디</a> * <a href="${pageContext.request.contextPath}/member/pwFind.do" onclick="window.open(this.href,'_black', 'width=800, height=600'); return false;">비밀번호</a>찾기
            </div>
        </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

    	$("#password").on('keypress', function(e){
        	if(e.keyCode == '13'){
        		$('#loginBtn').click();
        	}
        });
        
        $("#user_id").on('keypress', function(e){
        	if(e.keyCode == '13'){
        		$('#loginBtn').click();
        	}
        });
        
     	// 쿠키 선생님이랑 같이 했던 코드
    	// 쿠키 값 가져와 id 인풋창에 세팅
//     	console.log(document.cookie);
    	let regex = /rememberId=(.*)/;
    	if (regex.test(document.cookie)) {
    		let id = RegExp.$1;
    		$("#user_id").val(id);
    	}
    	
    	if(document.cookie) {
    		$("#rememberId").attr("checked", true);
    	}
		
    	
    	// 로그인 요청
    	$("#loginBtn").on("click", function(){
    		let loc = '${location}'
    		// 아이디 기억하기 여부 검사
    		if($("#rememberId:checked").length == 1){ // 체크 됨.
    		 	rememberId();
    		}else{ //체크 안됨.
    			deleteRememberId();
    		}	
    		
    		let data = $("#loginForm").serialize();
    		let id = $("#user_id").val();
    		console.log(id);
 //    		console.log(data);
    		$.ajax({
    			url : "${pageContext.request.contextPath}/member/login.do"
    			, type : "post"
    			, data : data
    		}).done(function(rs){
    			if(rs != "Y") {
    				if(rs == "성공") {
    					if(loc == "on"){
    						location.href="${pageContext.request.contextPath}/online/toMain.do"
    					}else if(loc == "off"){
    						if('${loginSession.type}==2'){
    			        		 location.href="${pageContext.request.contextPath}/offline/toMainEx.do?expert_id="+id
    						}else{
    			        		 location.href="${pageContext.request.contextPath}/offline/toMain.do";
    			        	 }
    					}
    				}else if(rs == "관리자") {
    					location.href = "${pageContext.request.contextPath}/admin/toAdminMain"
    				}else if(rs == "실패"){
    					alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
    				}
    			}else {
    				alert("블랙리스트 등록되어 로그인에 제한됩니다 고객센터에 문의해주세요.");
    			}
    				
    		}).fail(function(e){
    			console.log(e);
    		}) 
    	});
        

	// 로그인 쿠키 삭제
	function deleteRememberId() {
		// 쿠키 삭제 : 쿠키는 삭제 X -> 쿠키는 만료일이 되어야 삭제가 됨
		// 만료일을 과거날짜로 덮어씌워 버림.
		// 만료일 날짜 형식 2022-02-03T10:06:42.000Z
		// 과거일 : 1월 1일
		// Sat, 01 Jan 2022 00:00:10 GMT
		document.cookie = "rememberId=;Expires=Sat, 01 Jan 2022 00:00:10 GMT";
	}
	function divideType(){
		
	}

	// 로그인 쿠키 생성
	function rememberId() {
		let expiryDate = new Date();
// 		console.log("오늘 날짜 ", expiryDate);
		expiryDate.setDate(expiryDate.getDate() + 30);
// 		console.log("30일 뒤", expiryDate);
			
		let key = "rememberId";
		let value = $("#user_id").val();
		document.cookie = key + "=" + value + ";Expires=" + expiryDate;
	}
    
    
    $("#backBtn").click(function(){
    	location.href="${pageContext.request.contextPath}/online/toMain.do"
    }) 
    </script>
</body>
</html>