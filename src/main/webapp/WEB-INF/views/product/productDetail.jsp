<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <title>Document</title>
    <style>
        @font-face {
            font-family: 'BMHANNAAir';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            width: 900px;
            /* border: 1px solid black; */
            text-align: center;
        }

        .buttons {
            text-align: right;
            height: 30px;
        }

        #title {

            font-family: 'BMHANNAAir';
            padding: 30px;
            vertical-align: middle;
            height: 100px;
            /* border: 1px solid; */
        }

        #thumbNail{
            height: 400px;
            /* border: 1px solid black; */
        }

        #storeTitle {
            padding-left: 10px;
            border-top: 1px dotted #5f5d5d;
            margin-top: 30px;
            padding: 10px;
            height: 60px;
            /* border: 1px solid black; */
            font-size: 20px;
        }

        .storeTitleP {
            font-family: 'BMHANNAAir';
            font-size: 30px;
        }

        #storeTitleSpan {
            color: red;
        }

        #thumbNailImg {
            width: 100%;
            height: 100%;
        }

        #productImg {
            width: 100%;
            height: 100%;
        }

        #storeLink {
            height: 250px;
            /* border: 1px solid black; */
            text-align: center;
            padding-left: 35%;
            border-bottom: 1px dotted #5f5d5d;
        }

        #product {
            height: 100%;
            width: 260px;
        }

        #productPic {
            padding: 2px;
            height: 55%;
            /* border: 1px solid; */
        }

        #productInfo {
            height: 45%;
            /* border: 1px solid black; */
        }

        #productName {
            font-family: 'BMHANNAAir';
            height: 65%;
            font-size: 17px;
            /* border: 1px solid black; */
            padding-top: 10px;
            padding-left : 8px;
            text-align : left;
        }

        #productPrice {
            font-family: 'BMHANNAAir';
            /* border: 1px solid black; */
            padding-bottom: 10px;
            font-size: 18px;
            text-align: left;
            padding-left: 8px;
            margin-top: 5px;

        }

        #upperBlank{
            height : 90px;
        }
        #productName{
            font-family: 'BMHANNAAir';
            font-size: 23px;
            font-weight: bold;
        }
        #productQuantity{
            font-family: 'BMHANNAAir';
            text-align: left;
            padding-left: 8px;
        }
        #quantityController{
            display: inline-block;
            width: 60%;
            height: 30px;
        }
        .priceTitle{
            font-family: 'BMHANNAAir';
            font-size: 15px;
        }
        #price{
            font-family: 'BMHANNAAir';
            font-size: 25px;
        }
        .productTotalArea{
            height: 60px;
            padding-top: 10px;
            margin-top: 20px;
            border-top: 1px dotted grey;
            text-align: left;
            padding-left: 8px;
        }
        .productButtons{
            width: 100%;
            border: 1px solid black;
            height: 80px;
        }
        .parchaseBtn, .like_cart_buttons{
            float: left;
            font-family: 'BMHANNAAir';
            font-size: 20px;
        }
        .like_cart_buttons{
            width: 70%;
            height: 100%;
        }
        .parchaseBtn{
            vertical-align: middle;
            width: 30%;
            border: 1px solid black;
            height: 100%;
            background-color: rgb(224, 240, 81);
            padding-top: 23px;
        }
        #likeBtn, #cartBtn{
            padding: 5px;
            border: 1px solid black;
            width: 100%;
            height: 50%;
        }

    </style>
</head>

<body>
    <div class="container mt-3">
        <div class="buttons">
            <button type="button" class="btn btn-warning" id="modify">게시글
                수정</button>
            <button type="button" class="btn btn-danger" id="delete">게시글
                삭제</button>
        </div>
        <div class="row" id="upperBlank">
        </div>
        <div class="row" id="thumbNail">
            <div class="col-8">
                <img src="${pageContext.request.contextPath}/onlinePostThumbNail/${ProductDTO.image_path}" id="thumbNailImg">
            </div>
            <div class="col-4">
                <div class="productInput">
                    <div id="productName">${ProductDTO.name}</div>
                    <div id="productPrice">가격 : <span id="product_price">${ProductDTO.price}</span><span> 원</span></div>
                    <div id="productQuantity" ><span>수량 : </span><span><input type="number" value="1" id="quantityController" class="form-control"></span></div>
                </div>
                <div class="productTotalArea">
                    <div class="productTotal"><span class="priceTitle">총 금액(수량) : </span><span id="price">${ProductDTO.price}원</span><span class="priceTitle" id="priceQuantity"> (1개)</span></div>
                </div>
                <div class="productButtons">
                    <div class="parchaseBtn">구매</div>
                    <div class="like_cart_buttons">
                        <div id="likeBtn">찜하기</div>
                        <div id="cartBtn">카트</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="storeTitle">
            <p class="storeTitleP">
                <span class="storeTitleP" id="storeTitleSpan">
            </p>
        </div>
        </div>
    </div>
    <script>
        $("#quantityController").on("change",function(){
            let quantity = $(this).val();
            console.log(quantity);
            if(quantity==0){
                alert("1보다 적은 수량은 선택하실 수 없습니다.");
                $(this).val("1");
                return;
            }else{
                let price = $("#product_price")[0].innerHTML;
                console.log(price);
                let total = parseInt(quantity)*parseInt(price);
                console.log(total);
                $("#price").html(total+"원");
                $("#priceQuantity").html(" ("+quantity+"개)");
            }
        })
        
        $(".parchaseBtn").on("click",function(){
        	console.log("하하하하");
        	let product_no = ${ProductDTO.product_no}
        	let quantity = $("#quantityController").val();
        	console.log(product_no);
        	location.href="/product/toOrder.do?product_no="+product_no+"&quantity="+quantity;
        })
    </script>
</body>

</html>