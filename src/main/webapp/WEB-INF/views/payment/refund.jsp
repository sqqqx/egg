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
      url: "http://www.myservice.com/payments/cancel", // 예: http://www.myservice.com/payments/cancel
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify({
        merchant_uid: " ORD20180131-0000011", // 예: ORD20180131-0000011
        cancel_request_amount: 64900, // 환불금액
        reason: "테스트 결제 환불", // 환불사유
        refund_holder: "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        refund_bank: "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        refund_account: "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
      }),
      "dataType": "json"
    });
    console.log("ajax지남");
  }
</script>

<script>
	    
	    if($('#pay_coupon').text() >= 5){
		$.ajax({
				url: "/samsam/coupon_cancel.do",
				type:"post",
				//datatype:"json",
				contentType : 'application/x-www-form-urlencoded; charset = utf-8',
				data : {
					//"biz_email" :  // 주문번호
					//"cancle_request_amount" : 2000, //환불금액
					//"reason": "테스트 결제 환불", //환불사유
					//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
					//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
					//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
				}
			}).done(function(result){ //환불 성공
				 pay -= 5;
				 $('#pay_coupon').html(pay);	
				console.log("환불 성공 : "+ result);
			}).fail(function(error){
				console.log("환불 실패 : "+ error);
			});//ajax
		} else{
			console.log("환불 실패 : 남은 결제권 환불 불가");
		}
</script>
</body>
</html>