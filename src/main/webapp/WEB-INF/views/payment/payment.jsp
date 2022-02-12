<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>결제 페이지</title>
<style>
	.container {
        width: 500px;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2">결제정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>상품명</th>
                    <td>${iamdto.name}</td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>${iamdto.amount}원</td>
                </tr>
            </tbody>
        </table>
        <button onclick="requestPay()" class="btn btn-primary">결제하기</button>
    </div>
</body>

  <script>
  IMP.init('imp51956285'); // 예: imp00000000
  function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param (name과 amount만 있어도 결제 진행 가능)
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: "${iamdto.merchant_uid}",
          name: "${iamdto.name}",
          amount: "${iamdto.amount}",
          buyer_email: "${iamdto.buyer_email}",
          buyer_name: "${iamdto.buyer_name}",
          buyer_tel: "${iamdto.buyer_tel}",
          buyer_addr: "${iamdto.buyer_addr}",
          buyer_postcode: "${iamdto.buyer_postcode}"
      }, function (rsp) { // callback
    	  if ( rsp.success ) {	// 결제 성공 시
    		  alert("결제 성공 후 DB저장");
    		  // ajax로 결제내역 저장하기
    	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	    	$.ajax({
    	    		url: "/payment/completePaid.do", //cross-domain error가 발생하지 않도록 주의해주세요
    	    		type: 'POST',
    	    		dataType: 'text',
    	    		data: {
    	    			payment_no : rsp.merchant_uid,
    	    			cost : rsp.paid_amount,
    	    			method : rsp.pg_provider,
    	    			card_name : rsp.card_name,
    	    			route : "${iamdto.route}"
    		    		// imp_uid : rsp.imp_uid // 결제 고유번호 필요한지 확인
    		    		//기타 필요한 데이터가 있으면 추가 전달
    	    		}
    	    	}).done(function(rs) {
    	    		alert("결제에 성공했습니다.");
    	    		if(rs === "pointCharged"){
    	    			window.close();
    	    		} else {
    	    			$(location).attr("href", "${pagecontext.request.contextPath}/");	
    	    		}
    	    		
    	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	    		/*
    	    		if ( rs.equals("success") ) {
    	    			var msg = '결제가 완료되었습니다.';
    	    			msg += '\n고유ID : ' + rsp.imp_uid;
    	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    	    			msg += '\결제 금액 : ' + rsp.paid_amount;
    	    			msg += '카드 승인번호 : ' + rsp.apply_num;
    	    			alert(msg);
    	    		} else {
    	    			//[3] 아직 제대로 결제가 되지 않았습니다.
    	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    	    			alert("DB에 저장이 제대로 안되었습니다.");
    	    		}*/
    	    	}).fail(function(e){
    	    		console.log(e);
    	    		alert("결제 DB저장하였으나 실패");
    	    	});
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	        console.log(rsp);
    	        
    	        alert(msg + " / ec: " + rsp.error_code);
    	    }
      });
    }
  </script>
</html>
