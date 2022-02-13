<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    div {
        border: 1px solid grey;
        text-align: center;
    }
    #msg_head {
        font-size: 30pt;
    }
    #content {
        overflow : auto;
        height: 300px;
    }
    button {
        width: 100%;
    }
</style>
</head>
<body>
    <div class="container">
        <form id="msgForm">
            <div class="row">
                <div class="col" id="msg_head"><p>쪽지 상세보기</p></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label for="to_id">수신자</label>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="to_id" name="to_id" value="${dto.to_id}" readonly>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label for="to_id">송신자</label>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="from_id" name="from_id" value="${dto.from_id}" readonly>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label>제목</label>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="title" value="${dto.title}" readonly>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label for="content">내용</label>
                </div>
                <div class="col-5">
                    <div class="form-control" id="content" name="content">${dto.content}</div>
                </div>
                <div class="col-3"></div>
            </div>
            <c:if test="${dto.from_id ne loginSession.user_id}">
	            <div class="row">
	                <div class="col-3"></div>
	                <div class="col-3">
	                    <button type="button" class="btn btn-danger" id="reportBtn">신고</button>
	                </div>
	                <div class="col-3">
	                    <button type="button" class="btn btn-success" id="towriteBtn">답장</button>
	                </div>
	                <div class="col-3"></div>
	            </div>
            </c:if>
        </form>
    </div>

    <script>
	    // 내용 초기화 버튼
	    $("#reportBtn").on("click", function(){
	        alert("신고");
	    })
	
	    // 답장 버튼
	    $("#towriteBtn").on("click", function(){
	    	$(location).attr("href", "${pagecontext.request.contextPath}/message/toSendMessage?to_id=${dto.to_id}&from_id=${dto.from_id}");
	    })
    </script>
</body>
</html>