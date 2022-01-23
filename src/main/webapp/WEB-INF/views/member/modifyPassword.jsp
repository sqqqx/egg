<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        #currentPw {
            width: 100%;
        }
        #checkBtn {
        	margin-top: 30px;
        }
        #modifyPw {
            display: none;
        }
        #newPw {
            margin-bottom: 30px;
        }
        #newPwCheck {
            margin-bottom: 20px;
        }
        #confirmBtn {
            width: 300px;
            display: none;
            
        }
    </style>
</head>
<body>
    <div class="container">
		<div class="row">
			<div class="col-12"><h2>비밀번호 수정</h2></div>
		</div>
		<div class="row" id="checkPw">
			<form id="userPwCheck">
				<div class="col-12"><p>현재 비밀번호를 입력하세요</p></div>
				<div class="col-3"><input type="password" name="password" id="currentPw" class="form-control"/></div>
	            <div class="col-3">
	                <button type="button" id="checkBtn" class="btn btn-primary">본인확인</button>
	            </div>
	            <input type="text" id="checkId" name="user_id" value="test" hidden/>	<!-- 임시 id값 넣어놓음. -->
			</form>
		</div>
        <div class="row" id="modifyPw">
            <form id="modifyPwForm">
                <div class="col-12"><p>새로운 비밀번호를 입력하세요</p></div>
                <div class="col-3"><input type="password" id="newPw" name="pw" class="form-control"/></div>
                <div class="col-12"><p>비밀번호 확인을 위해 다시 입력해 주세요.</p></div>
                <div class="col-3"><input type="password" id="newPwCheck" class="form-control"/></div>
                * 비밀번호가 일치할 때 수정버튼이 나타납니다. 
                <div class="col-12">
                    <button type="button" id="confirmBtn" class="btn btn-success">비밀번호 수정</button>
                </div>
                <input type="text" id="id" name="id" value="test" hidden/>	<!-- 임시 id값 넣어놓음. -->
            </form>
        </div>
	</div>

    <script>
    
	 	// 본인확인 버튼
	    $("#checkBtn").on("click", function(){
	    	console.log("본인확인버튼 / user_id : " + $("#checkId").val());
	    	let check = $("#userPwCheck").serialize();
	        $.ajax({
	        	url: "${pagecontext.request.contextPath}/member/login.do",
	        	type: "post",
	        	data: check
	        }).done(function(rs){
	        	console.log("본인확인 반환값: " + rs);
	        	if(rs === "성공"){
	        		// 비밀번호가 일치 할 경우 alert 띄우고 화면 전환
	                alert("비밀번호가 일치합니다.");
	                $("#checkPw").css("display", "none");
	                $("#modifyPw").css("display", "block");	
	        	} else {
	        		// 비밀번호 불일치할 경우 alert 띄우고 다시 입력
	                alert("비밀번호가 틀렸습니다. 다시 입력해주세요.");
	                $("#currentPw").val("");
	        	}
	        	
	        }).fail(function(e){
	        	console.log(e);
	        })
	    })
	    
        // 비밀번호 유효성 검사 회원가입 폼보고 추후에 추가
        // 비밀번호가 일치할 때 버튼 초록색으로 바뀐다.
        // 새비밀번호 입력 시 확인비밀번호 같은지 확인
        $("#newPw").keyup(function(){
            if($("#newPw").val() === $("#newPwCheck").val()){
                $("#confirmBtn").css("display", "block");
            } else {
                $("#confirmBtn").css("display", "none");
            }
        })
        // 확인비밀번호 입력 시 새비밀번호 같은지 확인
        $("#newPwCheck").keyup(function(){
            if($("#newPw").val() === $("#newPwCheck").val()){
                $("#confirmBtn").css("display", "block");
            } else {
                $("#confirmBtn").css("display", "none");
            }
        })
        // 비밀번호 수정 버튼
        // 비밀번호 수정요청 후 팝업창 종료
        $("#confirmBtn").on("click", function(){
	    	console.log("비밀번호 수정 id: " + $("#id").val() + " / pw: " + $("#newPw").val());
	    	let modifying = $("#modifyPwForm").serialize();
	        $.ajax({
	        	url: "${pagecontext.request.contextPath}/member/modifyPassword.do",
	        	type: "post",
	        	data: modifying
	        }).done(function(rs){
            	if(rs === "success"){
            		alert("비밀번호 수정 성공");
            		window.close();
            	} else {
            		alert("비밀번호 수정 실패");
            	}
            }).fail(function(e){
            	alert("비밀번호 수정 중 에러가 발생했습니다.");
                console.log(e);
            })
	    })
    </script>
</body>
</html>