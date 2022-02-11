<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
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
        *{
            font-family: 'BMHANNAAir';
        }
        
        h4{
            font-family: 'BMHANNAAir';
        }

        .container {
            width: 1200px;
            font-family: 'BMHANNAAir';
            color: #2b2b2b;

        }

        .category_menu {
            height: 300px;
            text-align: center;
            background-color: #efefef;
        }

        .category_menu_title {
            font-size: 120px;
            margin: 0;
        }

        .category_menu_explain {
            font-size: 25px;
            margin-bottom: 5px;
        }

        .proTitle {
            font-size: 35px;
        }

        .post {
            margin-top: 25px;
            width: 100%;
            height: 1100px;
        }

        .postInfo_all {
            border-top: 1px dotted black;
            border-bottom: 1px dotted black;
            height: 120px;
        }

        .postInfo {
            height: 100%;
            font-weight: bold;
            padding-left: 10px;
            width: 90%;
            float: left;
        }


        .postTitle {
            font-size: 30px;
            height: 40px;
        }

        .postCategory {
            height: 10px;
            margin-bottom: 15px;
            margin-top: 20px;
            vertical-align: bottom;
            font-size: 18px;
        }

        .postWriter {
            height: 10px;
            margin-bottom: 13px;
            vertical-align: bottom;
            font-size: 20px;
            margin-top: 7px;
        }

        .postContent {
            font-family: 'BMHANNAAir';
            margin-top : 30px;
            border-bottom: 1px dotted black;
            padding : 20px;
            
        }
        .buttons{
            text-align : center;
            margin-top : 30px;
        }
        .reactionPic{
            float: left;      
            text-align : center;  
            margin-top : 20px;
            margin-right : 13px;
            font-size : 14px;
        }
        .postReaction{
            float : left;
            text-align : center;
            width : 10%;
            height : 100%;
        }
        p{
            font-size: 20px;
        }
        .blank{
            height: 50px;
        }
    </style>
</head>

<body>
    <div class="blank"></div>
    <div class="container">
        <div class="post">
            <div class="postInfo_all">
                <div class="postInfo">
                    <div class="postCategory">${CategoryDTO.parent_group} - ${CategoryDTO.child_group}</div>
                    <div class="postTitle">"${CategoryDTO.child_group}"에 관한 요청 드립니다.</div>
                </div>
                <div class="postReaction">
                    <div class="reactionPic"><button class="btn btn-warning"  id="deleteBtn">요청 삭제</button></div>
                </div>
            </div>
            <div class="postContent">
                ${PostDTO.content}
            </div>
        </div>
        
    </div>
    <script>
        $("#deleteBtn").on("click",function(){
        	let post_no = ${PostDTO.post_no};
        	console.log(post_no);
        	$.ajax(function(){
        		url : "${pageContext.request.contextPath}/offlinePost/deletePost.do?"
        		,type : "post"
        		,data : {post_no:post_no}
        	}).done(function(data){
        		if(data=="success"){
        			location.href="마이페이지로"
        		}else if(data=="fail"){
        			alert("알 수 없는 오류가 발생하였습니다. 관리자에게 문의 바랍니다.");
        		}
        			
        	}).fail(function(rs){
        		alert("알 수 없는 오류가 발생하였습니다. 관리자에게 문의 바랍니다.");
        	})    
        })
    </script>

</body>

</html>