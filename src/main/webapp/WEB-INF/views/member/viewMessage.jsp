<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/profileSection.css">
<link rel="stylesheet" href="/resources/css/viewMessage.css">
<title>쪽지함</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	
	<div class="container-fluid">
	
	<!-- 회원 정보 조회 -->
    <div class="container-fluid" id="myInfo">
        <div class="row">
        	<!-- 좌측 프로필 부분 -->
            <%@include file="/WEB-INF/views/member/profileSection.jsp" %>
            
            <div class="col-1"></div>
            
            <!-- 우측 회원정보조회 부분 -->
            <div class="col-8" id="userBox">
                <div class="row"><p>쪽지함</p></div>
		        <div class="row" id="searchBox">
		            <div class="col">
		            	<form action="${pagecontext.request.contextPath}/message/searchMsg.do" method="post" id="searchForm">
		            		<select id="searchSelect">
			                    <option value="user_id">ID</option>
			                    <option value="title">제목</option>
			                </select>
			                <input type="text" class="input-control" name="inputText"/>
			                <input type="text" id="searchOpt" name="searchOpt" hidden/>
			                <input type="text" name="type" value="${naviMap.get('type')}" hidden>
		            		<input type="text" name="user_id" value="${loginSession.user_id}" hidden>
		            		<input type="text" name="currentPage" value="${naviMap.get('currentPage')}" hidden>
		            		<input type="text" name="orderMsg" value="${orderMsg}" hidden>
			                <button type="button" id="msgSearchBtn">검색</button>
		            	</form>
		            </div>
		            <div class="col">
		                <select id="orderMsg">
		                	<option value="latest">최신순</option>
		                	<option value="oldest">오래된순</option>
		                	<option value="unread">미열람쪽지</option>
		                	<option value="read">열람쪽지</option>
		                </select>
		            </div>
		        </div>
		        <div class="row">
		            <div class="col"  id="receivedMsgTab">
		                <span class="msgTab">받은쪽지</span>
		            </div>
		            <div class="col" id="sentMsgTab">
		                <span class="msgTab">보낸쪽지</span>
		            </div>
		        </div>
		        <div class="row" id="checkBtnBox">
		            <div class="col">
		            	<c:if test="${naviMap.get('type') eq 'received'}">
		            		<button type="button" id="checkedMsgReadBtn" class="btn btn-warning">체크읽음</button>
		            	</c:if>
		                <button type="button" id="checkedMsgDelBtn" class="btn btn-danger">체크삭제</button>
		            </div>
		        </div>
		        
		        <!-- 글 목록 테이블 -->
		        <form action="${pagecontext.request.contextPath}/message/checkedMsg.do" method="post" id="msgListForm">
			        <table class="table">
			            <thead>
			                <tr>
			                    <th>체크</th>
			                    <th>확인여부</th>
			                    <th>ID</th>
			                    <th>제목</th>
			                    <th>날짜</th>    
			                    <th>삭제버튼</th>
			                </tr>
			            </thead>
			            <tbody>
		            		<c:forEach items="${msgList}" var="msg">
		            			<tr>
				                    <td><input type="checkbox" name="checkedMsg" value="${msg.message_no}"></td>
				                    <td>
				                    	<c:if test="${naviMap.get('type') eq 'received'}">
				                    		<c:choose>
					                    		<c:when test="${msg.message_check eq 'Y'}">
					                    			<img src="https://cdn-icons-png.flaticon.com/512/3731/3731194.png">
					                    		</c:when>
					                    		<c:otherwise>
					                    			<img src="https://cdn-icons-png.flaticon.com/512/2218/2218516.png">
					                    		</c:otherwise> 
					                    	</c:choose>
					                    	<td>${msg.from_id}</td>
				                    	</c:if>
				                    	<c:if test="${naviMap.get('type') eq 'sent'}">
				                    		<c:choose>
					                    		<c:when test="${msg.message_check eq 'Y'}">
					                    			<img src="https://cdn-icons-png.flaticon.com/512/948/948593.png">
					                    		</c:when>
					                    		<c:otherwise>
					                    			<img src="https://cdn-icons-png.flaticon.com/512/726/726619.png">
					                    		</c:otherwise> 
					                    	</c:choose>
					                    	<td>${msg.to_id}</td>
				                    	</c:if>
				                    </td>
				                    <td>${msg.title}</td>
				                    <td>${msg.message_date}</td>
				                    <td><button type="button" class="btn btn-danger deleteBtn" value="${msg.message_no}">삭제</button></td>
		                		</tr>
		            		</c:forEach>
		            		<input type="text" name="type" value="${naviMap.get('type')}" hidden>
		            		<input type="text" name="user_id" value="${loginSession.user_id}" hidden>
		            		<input type="text" name="currentPage" value="${naviMap.get('currentPage')}" hidden>
		            		<input type="text" name="checkOpt" id="checkOpt" hidden>
		            		<input type="text" name="orderMsg" value="${orderMsg}" hidden>
		            		<c:if test="${empty msgList}">
		            			<td colspan="6">표시할 쪽지가 없습니다.</td>
		            		</c:if>
			            </tbody>
			        </table>
		        </form>
		        
		        <!-- 페이지 -->
		        <div class="row">
		            <nav aria-label="Page navigation example">
		            	<ul class="pagination justify-content-center">
		            		<!-- 이전페이지 -->
		            		<c:if test="${naviMap.get('needPrev') eq true}">
		            			<li class="page-item">
		            				<a class="page-link" href="${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${naviMap.get('startNavi')-1}&orderMsg=${orderMsg}">이전페이지</a>
		            			</li>
		            		</c:if>
		            		
		            		<!-- 페이지 목록 -->
		            		<c:forEach var="m" begin="${naviMap.get('startNavi')}" end="${naviMap.get('endNavi')}">
								<li class="page-item">
									<a class="page-link" href="${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${m}&orderMsg=${orderMsg}">${m}</a>
								</li>		            		
		            		</c:forEach>
		            		
		            		<!-- 다음페이지 -->
		            		<c:if test="${naviMap.get('needNext') eq true}">
		            			<li class="page-item">
		            				<a class="page-link" href="${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${naviMap.get('endNavi')+1}&orderMsg=${orderMsg}">다음페이지</a>
		            			</li>
		            		</c:if>
		            	</ul>
		            </nav>
		        </div>
            </div>
        </div>
    </div>
	
    

    <script>
    	// 검색 버튼
     	$("#msgSearchBtn").on("click", function(e){
    		console.log("클릭");
    		console.log($("#searchSelect option:selected").val());
            $("#searchOpt").val($("#searchSelect option:selected").val());
            $("#searchForm").submit(); 
    	})
    	document.getElementById("searchBtn").onclick = function(){
    		console.log("e");
    	}
    
    	// 쪽지 정렬
    	$("#orderMsg").on("click", function(e){
    		/* console.log($(e.target).val());
            console.log("${orderMsg}"); */
            
            if("${orderMsg}" !== $(e.target).val()){
            	if($("#orderMsg option:selected").val() === "latest"){
            		$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=1&orderMsg=latest");
                } else if($("#orderMsg option:selected").val() === "oldest") {
                	$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=1&orderMsg=oldest");
                } else if($("#orderMsg option:selected").val() === "unread") {
                	$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=1&orderMsg=unread");
                } else if($("#orderMsg option:selected").val() === "read") {
                	$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=1&orderMsg=read");
                }
            }
            
        })
    	
    	// 받은쪽지 탭
    	$("#receivedMsgTab").on("click", function(){
    		$(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=received&user_id=${loginSession.user_id}&currentPage=1");
    	})
    	
    	// 보낸쪽지 탭
    	$("#sentMsgTab").on("click", function(){
            $(location).attr("href", "${pagecontext.request.contextPath}/message/toViewMessage?type=sent&user_id=${loginSession.user_id}&currentPage=1")
    	})
    
        // 체크읽음버튼
        $("#checkedMsgReadBtn").on("click", function(){
        	if(confirm("체크한 메세지를 전부 '읽음처리' 하시겠습니까?")){
        		$("#checkOpt").val("read");
        		$("#msgListForm").submit();	
        	}
        })
        
        // 체크삭제버튼
        $("#checkedMsgDelBtn").on("click", function(){
        	if(confirm("체크한 메세지를 전부 '삭제' 하시겠습니까?")){
        		$("#checkOpt").val("delete");
        		$("#msgListForm").submit();	
        	}
        })

        // 삭제버튼
        $(".deleteBtn").on("click", function(e){
        	if(confirm("쪽지를 정말 삭제하시겠습니까?")){
        		$(location).attr("href", "${pagecontext.request.contextPath}/message/deleteMsg.do?"
        		+ "type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${naviMap.get('currentPage')}&message_no="
        		+ $(this).val() + "&orderMsg=${orderMsg}");	
        	}
        })
        
        
        // 자동 실행 함수
    	$(function(){
    		// 쪽지 탭 border지정
    		if("${naviMap.get('type')}" === "received"){
    			$("#sentMsgTab").css("border", "none");
                $("#receivedMsgTab").css("border", "5px solid skyblue");
                $("#receivedMsgTab").css("border-radius", "10px");
        	} else if("${naviMap.get('type')}" === "sent"){
        		$("#receivedMsgTab").css("border", "none");
                $("#sentMsgTab").css("border", "5px solid skyblue");
                $("#sentMsgTab").css("border-radius", "10px");
        	}
    		
    		// 쪽지 정렬 지정
    		if("${orderMsg}" === "latest") {
    			$("#orderMsg option:nth-child(1)").prop("selected", true);
    		} else if("${orderMsg}" === "oldest") {
    			$("#orderMsg option:nth-child(2)").prop("selected", true);
    		} else if("${orderMsg}" === "unread") {
    			$("#orderMsg option:nth-child(3)").prop("selected", true);
    		} else if("${orderMsg}" === "read") {
    			$("#orderMsg option:nth-child(4)").prop("selected", true);
    		}
    	});


    </script>
</body>
</html>