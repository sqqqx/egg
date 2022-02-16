<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<style>
         *{margin:0;}
          @font-face {
            font-family: 'BMHANNAAir';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        .whole{
            height: 950px;
        }
        .whole>div{
            height: 100%;
        }
        .ctnBox{
            position: relative;
            width:100%;
            height: 100%;
            padding:0;
        }
        .ctnBox>img{
            width:100%;
            height:100%;
            cursor: pointer;
            
        }
        
    </style>
</head>
<body>
    <div class="container-fluid whole">
        <div class="row">
            <div class="col ctnBox">
                <img class="img-fluid" id="toOnlineBtn" src="/resources/img/Home.png">
            </div>
            <div class="col ctnBox">
                <img class="img-fluid" id="toOfflineBtn" src="/resources/img/Home1.png">                
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
    	$("#toOnlineBtn").click(function(){
    		location.href="${pageContext.request.contextPath}/online/toMain.do"
    	})
    	$("#toOfflineBtn").click(function(){
    		location.href="${pageContext.request.contextPath}/offline/toMain.do"
    	})
    </script>
</body>
</html>
