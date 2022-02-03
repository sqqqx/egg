<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
<!--     <link rel="stylesheet" href="/resources/css/admin/memberManagement.css">
 -->    <title>관리자 홈</title>
	<style>
		.top {
			height: 200px !important;
		}
		.bottom {
			width: 100%;
		}
		.sector {
            height: 400px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
	</style>
</head>

<body>
	<!-- 헤더 -->
 	<%@include file="/WEB-INF/views/header.jsp" %>
       <div class="main-Wrapper d-flex justify-content-center pt-5">
       
             <!--사이드 바-->
            <div class="cls-sideBar">
                <%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            </div>
            
            <!-- 본문 -->
            <div class="container">
                <div class="row py-3">
                    <div class="col px-1 sector top">
                    
                    </div>
                </div>
                <div class="row py-3">
                    <div class="col-6 sectorWrapper">
                        <div class="sector bottom">
                        
                        </div>
                    </div>
                    <div class="col-6 sectorWrapper">
                        <div class="sector bottom">
                        
                        </div>
                    </div>
                </div>
            </div>

       </div>
       
       <script>
       		/* $(document).ready(function() {
       			ws.onmessage = function(e) {
                	console.log(e.data);
                	msgObj = JSON.parse(e.data);
                	console.log("msgObj333 : " + msgObj);
                	$("#tmp").empty();
                	$("#tmp").append(msgObj);
                }
       		}); */
       </script>
</body>
</html>