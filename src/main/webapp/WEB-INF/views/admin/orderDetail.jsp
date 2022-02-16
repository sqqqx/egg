<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* Our Font */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap');

        /* Global */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins'
        }

        body {
            height: 100vh;
            background-color: #D3E1E1
        }

        /* The Receipt */
        .receipt {
            width: 360px;
            height: 720px;
            background-color: white;
            border-radius: 30px;
            position: relative;
            top: 50%;
            left: 50%;
            margin-top: -360px;
            margin-left: -180px;
            box-shadow: 14px 14px 22px -18px;
            padding: 20px
        }

        .name {
            text-transform: uppercase;
            text-align: center;
            color: #6c8b8e;
            letter-spacing: 10px;
            font-size: 1.8em;
            margin-top: 10px
        }

        .greeting {
            font-size: 21px;
            text-transform: capitalize;
            text-align: center;
            color: #6f8d90;
            margin: 35px 0;
            letter-spacing: 1.2px
        }

        .order p {
            font-size: 13px;
            color: #aaa;
            padding-left: 10px;
            letter-spacing: .7px
        }

        hr {
            border: .7px solid #ddd;
            margin: 15px 0;
        }

        .details {
            padding-left: 10px;
            margin-bottom: 35px;
            overflow: hidden
        }

        .details h3 {
            font-weight: 400;
            color: #6c8b8e;
            font-size: 1.5em;
            margin-bottom: 15px
        }

        .product {
            float: left;
            width: 83%
        }

        .product img {
            width: 65px;
            float: left
        }

        .product .info {
            float: left;
            margin-left: 15px
        }

        .product .info h4 {
            color: #6f8d90;
            font-weight: 400;
            text-transform: uppercase;
            margin-top: 10px
        }

        .product .info p {
            font-size: 12px;
            color: #aaa;
        }

        .details>p {
            color: #6f8d90;
            margin-top: 25px;
            font-size: 15px
        }

        .totalprice p {
            padding-left: 10px
        }

        .totalprice .sub,
        .totalprice .del {
            font-size: 13px;
            color: #aaa
        }

        .totalprice span {
            float: right;
            margin-right: 17px
        }

        .totalprice .tot {
            color: #6f8d90;
            font-size: 15px
        }

        footer {
            font-size: 10px;
            text-align: center;
            margin-top: 135px;
            color: #aaa
        }
        #product_img {
        	width: 50px;
        	height: 50px;
        }
    </style>
</head>

<body>
    <div class="receipt">
        <!-- <h2 class="name"> 주문 정보 </h2> -->
        <p class="greeting"> 주문 정보 </p>

        <div class="order">
            <p> 결제번호 : <span>${map.PAYMENT_NO}</span> </p>
            <p> 결제수단 : <span>${map.METHOD}</span> </p>
            <%-- <p> 카드명 : <span>${map.CARD_NAME}</span> </p> --%>
        </div>
        <hr>

        <div class="order">
            <p> 수령인 : <span>${map.NAME}</span> </p>
            <p> 휴대전화번호 : <span>${map.PHONE}</span> </p>
            <p> 이메일 : <span>${map.EMAIL}</span> </p>
            <p> 요청사항 : <span>${map.MESSAGE}</span> </p>
            <p> 배송지 : <span>${map.ADDRESS}</span> </p>
        </div>
        <hr>

        <div class="details">
            <!-- <h3> 상품 </h3> -->
            <div class="product">
                <img src="{pageContext.request.contextPath}/productThumbnail/${map.IMAGE_PATH}" id="product_img">
                <div class="info">
                    <h4> ${map.PRODUCT_NAME} </h4>
                    <p> 가격: <span> ₩ ${map.PRICE} </span> </p>
                    <p> 수량: <span> ${map.QUANTITY} </span> </p>
                    
                </div>
            </div>
            <!-- <p> ---  </p> -->
        </div>

        <div class="totalprice">
            <p class="sub"> 주문 금액 <span> ₩ ${map.COST} </span></p>
            <p class="del"> 배송비 <span> ₩ 3,000 </span> </p>
            <hr>
            <p class="tot"> Total <span id="finalCost"> ₩ 0 </span> </p>
        </div>

        <!-- Footer -->
        <footer>  </footer>
    </div>
	
	<script>
		// 배송비 합쳐서 total에 넣기
		window.onload = function(){
			let cost = "${map.COST}";
			const regex = /,/gi;
			cost = cost.replace(regex, "");
			cost = parseInt(cost) + 3000;
			cost = cost.toLocaleString();
			console.log(cost);
			document.getElementById("finalCost").textContent = "₩ " + cost;
		}
	</script>
</body>

</html>