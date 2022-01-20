<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
         *{margin:0; }
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
        }
        .toBtn{
           position: absolute;
            width:35%;
         height: 15%;
            left:33%;
            top:80%;
        }
    </style>
</head>
<body>
	<a href="${pageContext.request.contextPath}/admin/toAdminMain">(임시) 관리자 페이지 이동</a>
	
    <div class="container-fluid whole">
        <div class="row">
            <div class="col ctnBox">
                <img class="img-fluid" src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2020/09/urbanbrush-20200904214249838778.jpg">
                <div class="row">
                    <button type="button" id="toOnlineBtn" class="btn btn-primary toBtn">온라인 클래스</button>
                </div>
            </div>
            <div class="col ctnBox">
                <img class="img-fluid" src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/PER/image/5GbHMQjW3hZ9qGz7SjB_5CDE46w.jpg">
                <button type="button" id="toOnlineBtn" class="btn btn-primary toBtn">오프라인 클래스</button>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
    	$("#toOnlineBtn").click(function(){
    		location.href="${pageContext.request.contextPath}/online/toMain.do"
    	})
    </script>
</body>
</html>
