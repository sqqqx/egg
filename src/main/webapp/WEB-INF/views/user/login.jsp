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
            background-color: lightgray;
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
            <img src="/resources/img/logo.png">
        </div>
        <form id="loginForm">
        <div class="row mb-3">
            <div class="col-12">
              <input type="text" class="form-control" id="id" name="user_id" placeholder="아이디 / 이메일을 입력해주세요.">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <input type="password" class="form-control" name="password" placeholder="패스워드를 입력해주세요.">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
				<input type="checkbox" class="form-check-input" id="rememberId"> 아이디 기억하기
			</div>
        </div>
        <div class="row">
            <div class="col">
				<button type="button" class="btn btn-dark" id="loginBtn">로그인</button>
				<img id="kakaoLogin" onclick="kakaoLogin();" src="/resources/img/kakao_login_medium_narrow.png">
			</div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <a href="${pageContext.request.contextPath}/toSignup.do">회원가입</a> // 
                <a href="${pageContext.request.contextPath}/member/idFind.do">아이디</a> * <a href="">비밀번호</a>찾기
            </div>
        </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
 	// 로그인 요청
 	$("#loginBtn").on("click", function(){
		login();
	})
 	function login(){
 		let data = $("#loginForm").serialize();
		console.log(data);
		$.ajax({
			url : "${pageContext.request.contextPath}/member/login.do"
			, type : "post"
			, data : data
		}).done(function(rs){
			console.log(rs);
			if(rs == "성공"){
				location.href = "${pageContext.request.contextPath}/online/toMain.do";
			}else if(rs == "실패"){
				alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			}
		}).fail(function(e){
			console.log(e);
		}) 
	};
    
    
    $("#backBtn").click(function(){
    	location.href="${pageContext.request.contextPath}/online/toMain.do"
    })
    
    //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: '/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });
  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  
    </script>
</body>
</html>