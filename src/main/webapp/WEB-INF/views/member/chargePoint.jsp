<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    * {
        text-align: center;
    }
    .container {
        padding-top: 30px;
    }
    #optionBox {
        margin: 0 auto;
        border: 1px solid grey;
        width: 530px;
        padding: 20px;
    }
    .form-check-label {
        margin-right: 20px;
    }
    .btn {
        margin: 20px;
        width: 20%;
    }
</style>
</head>
<body>
	<form action="${pagecontext.request.contextPath}/payment/toPayment" method="post" id="pointForm">
	    <div class="container">
	        <div class="row"><h2>포인트 충전</h2></div>
	        <div class="row" id="optionBox">
	            <p>충전할 금액을 선택해 주세요</p>
	            <div class="col">
	                <input type="radio" class="form-check-input" name="cost" value="30000" id="option1">
	                <label class="form-check-label" for="option1">30,000P</label>
	                <input type="radio" class="form-check-input" name="cost" value="50000" id="option2" checked>
	                <label class="form-check-label" for="option2">50,000P</label>
	                <input type="radio" class="form-check-input" name="cost" value="100000" id="option3">
	                <label class="form-check-label" for="option3">100,000P</label>
	                <input type="radio" class="form-check-input" name="cost" value="500000" id="option4">
	                <label class="form-check-label" for="option4">500,000P</label>
	            </div>
	        </div>
	        <div class="row" id="btnBox">
	            <div class="col">
	                <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
	                <button type="button" class="btn btn-primary" id="paymentBtn">결제</button>
	            </div>
	        </div>
	        <div hidden>
	        	<input type="text" name="cost" id="cost"/>
	        	<input type="text" name="name" value="${dto.user_nickname}"/>
	        	<input type="text" name="address" value="${dto.address}"/>
	        	<input type="text" name="message" value=""/>
	        	<input type="text" name="status" value="ready"/>
	        	<input type="text" name="tracking_no" value="point"/>
	        	<input type="text" name="user_id" value="${dto.user_id}"/>
	        	<input type="text" name="phone" value="${dto.phone}"/>
	        	<input type="text" name="email" value="${dto.email}"/>
	        </div>
	    </div>	
	</form>

    
    <script>
    	// 취소 버튼
    	$("#cancelBtn").on("click", function(){
    		window.close();
    	})
    	
    	// 결제 버튼
    	$("#paymentBtn").on("click", function(){
    		// 결제 금액 지정
    		$("#cost").val($("input:radio:checked").val());
    		$("#pointForm").submit();
    	})
    	
    </script>
</body>
</html>