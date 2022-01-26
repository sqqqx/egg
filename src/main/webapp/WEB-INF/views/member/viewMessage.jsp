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
		                <select>
		                    <option>ID</option>
		                    <option>제목</option>
		                </select>
		                <input type="text"/>
		                <button type="button">검색</button>
		            </div>
		            <div class="col">
		                <select>
		                    <option>정렬</option>
		                    <option>최신순</option>
		                    <option>오래된순</option>
		                    <option>미열람쪽지</option>
		                    <option>열람쪽지</option>
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
		                <button type="button" id="checkedMsgReadBtn" class="btn btn-warning">체크읽음</button>
		                <button type="button" id="checkedMsgDelBtn" class="btn btn-danger">체크삭제</button>
		            </div>
		        </div>
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
			                    <td><input type="checkbox" name="checkMsg" vlaue="${msg.message_no}"></td>
			                    <td><img src="https://cdn-icons-png.flaticon.com/512/2218/2218516.png"></td>
			                    <td>${msg.to_id}</td>
			                    <td>${msg.title}</td>
			                    <td>${msg.message_date}</td>
			                    <td><button type="button" class="btn btn-danger deleteBtn" value="${msg.message_no}">삭제</button></td>
		                	</tr>
		            	</c:forEach>
		            </tbody>
		        </table>
		        <div class="row">
		            <nav aria-label="Page navigation example">
		            	<ul class="pagination justify-content-center">
		            		<!-- 이전페이지 -->
		            		<c:if test="${naviMap.get('needPrev') eq true}">
		            			<li class="page-item">
		            				<a class="page-link" href="${pagecontext.request.contextPath}/message/toViewMessage?
		            				type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${naviMap.get('startNavi')-1}">이전페이지</a>
		            			</li>
		            		</c:if>
		            		
		            		<!-- 페이지 목록 -->
		            		<c:forEach var="m" begin="${naviMap.get('startNavi')}" end="${naviMap.get('endNavi')}">
								<li class="page-item">
									<a class="page-link" href="${pagecontext.request.contextPath}/message/toViewMessage?
									type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${m}">${m}</a>
								</li>		            		
		            		</c:forEach>
		            		
		            		<!-- 다음페이지 -->
		            		<c:if test="${naviMap.get('needNext') eq true}">
		            			<li class="page-item">
		            				<a class="page-link" href="${pagecontext.request.contextPath}/message/toViewMessage?
		            				type=${naviMap.get('type')}&user_id=${loginSession.user_id}&currentPage=${naviMap.get('endNavi')+1}">다음페이지</a>
		            			</li>
		            		</c:if>
		            	</ul>
		            </nav>
		        </div>
            </div>
        </div>
    </div>
	
    

    <script>
        // 체크읽음버튼

        // 체크삭제버튼

        // 답장버튼
        $(".replyBtn").on("click", function(e){
            console.log($(this).val());
        })

        // 삭제버튼
        $(".deleteBtn").on("click", function(e){
            console.log($(this).val());
        })


    </script>
</body>
</html>