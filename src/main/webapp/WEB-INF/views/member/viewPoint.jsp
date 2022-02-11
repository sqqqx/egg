<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전 내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    * {
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th>날짜</th>
                    <th>충전/사용</th>
                    <th>잔액</th>
                </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${empty pointLog}">
            			<tr>
		                    <td colspan="3">포인트 충전/사용 내역이 존재하지 않습니다.</td>
	                	</tr>
            		</c:when>
            		<c:otherwise>
            			<c:forEach items="${pointLog}" var="log">
		            		<tr>
			                    <td>${log.log_date}</td>
			                    <td>${log.editp} P</td>
			                    <td>${log.balance} P</td>
		                	</tr>
            			</c:forEach>
            		</c:otherwise>
            	</c:choose>
            </tbody>
        </table>
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <button type="button" class="btn btn-secondary" id="closeBtn">닫기</button>
                <button type="button" class="btn btn-primary" id="chargeBtn">충전</button>
            </div>
        </div>
    </div>
    
    <script>
    	// 닫기 버튼
    	$("#closeBtn").on("click", function(){
    		window.close();
    	})
    	
    	// 충전 버튼
    	$("#chargeBtn").on("click", function(){
    		$(location).attr("href", "${pagecontext.request.contextPath}/pointlog/toChargePage?user_id=${loginSession.user_id}");
    	})
    </script>
</body>
</html>