<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>.
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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>    

    <title>Document</title>
    <style>
        @font-face {
            font-family: 'BMHANNAAir';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            width: 900px;
           
            /* border: 1px solid black; */
            text-align: center;
        }
        

        #title {
            font-family: 'BMHANNAAir';
            padding: 30px;
            vertical-align: middle;
            height: 100px;
            /* border: 1px solid; */
        }

        #thumbNail {
            height: 500px;
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
        .storeTitleP{
            font-family: 'BMHANNAAir';
            font-size: 30px;
        }
        #storeTitleSpan{
            color: red;
        }
        #thumbNailImg{
            width: 100%;
            height: 100%;
        }
        #productImg{
            width: 100%;
            height: 100%;
        }
        #storeLink{
            height: 250px;
            /* border: 1px solid black; */
            text-align: center;
            padding-left: 35%;
            border-bottom: 1px dotted #5f5d5d;
        }
        #product{
            height: 100%;
            width: 260px;
        }
        #productPic{
            padding: 2px;
            height: 55%;
            /* border: 1px solid; */
        }
        #productInfo{
            height: 45%;
            /* border: 1px solid black; */
        }
        #productName{
            
            font-family: 'BMHANNAAir';
            height: 65%;
            font-size: 17px;
            /* border: 1px solid black; */
            padding-top: 10px;
        }
        #productPrice{
            font-family: 'BMHANNAAir';
            height: 35%;
            /* border: 1px solid black; */
            padding-bottom: 10px;
        }
        #productPrice{
            font-size: 20px;
        }
        #naviTab{
            margin-top: 50px;
        }
        .nav-link{
            font-family: 'BMHANNAAir';
            font-size: 23px;
        }
        #detailContent{
            margin-top: 100px;
            font-family: 'BMHANNAAir';
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row" id="title">
            <h2>${PostDTO.title}</h2>
        </div>
        <div class="row" id="thumbNail">
            <img src="${pageContext.request.contextPath}/onlinePostThumbNail/${ImageDTO.system_name}" id="thumbNailImg">
        </div>
        <div class="row" id="storeTitle">
            <p class="storeTitleP"><span class="storeTitleP" id="storeTitleSpan">잠깐!! </span>준비물은 챙기셨나요?</p>
        </div>
        <div class="row" id="storeLink">
            <div id="product">
                <div id="productPic"><img src="${pageContext.request.contextPath}/onlinePostThumbNail/${ImageDTO.system_name}" id="productImg"></div>
                <div id="productInfo">
                    <div id="productName">산타도 찾아오는 트리 패키지 + 무료 배송 (당일 발송)</div>
                    <div id="productPrice"><p>16,900원</p></div>
                </div>
            </div>
        </div>
        <div class="row" id="naviTab">
            
            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#detail" type="button" role="tab" aria-controls="detail" aria-selected="true">상세설명</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="comments-tab" data-bs-toggle="tab" data-bs-target="#comments" type="button" role="tab" aria-controls="comments" aria-selected="false">후기 및 Q&A (120)</button>
                </li>
                
              </ul>
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
                    <div id="detailContent">
                       ${PostDTO.content}
                    </div>
                </div>
                <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">

                </div>
              </div>
        </div>

    </div>
</body>

</html>