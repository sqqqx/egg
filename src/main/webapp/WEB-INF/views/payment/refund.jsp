<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 페이지</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<button onclick="cancelPay()">환불하기</button>
<script>
  function cancelPay() {
	  console.log("환불버튼");
    $.ajax({
      url: "${pagecontext.request.contextPath}/payment/refund.do", // 예: http://www.myservice.com/payments/cancel
      type: "POST",
      //contentType: "application/json;charset=utf-8",
      data: {
        merchant_uid: "ORD20180131-0000025", // 예: ORD20180131-0000011
        cancel_request_amount: 100, // 환불금액
        reason: "테스트 결제 환불", // 환불사유
        refund_holder: "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        refund_bank: "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        refund_account: "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
      },
      dataType: "text"
    }).done(function(rs){	// 환불 성공
    	console.log("환불 성공. 결과메세지: " + rs);
    }).fail(function(e){	// 환불 실패
    	console.log("환불 실패. 에러메세지: " + e);
    	console.log(e);
    });
    console.log("환불 ajax지남");
  }
</script>
</body>
</html>