<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("location")==null){
		session.setAttribute("location","off");
	}
	if(session.getAttribute("location").equals("on")){
		session.removeAttribute("location");
		session.setAttribute("location","off");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/header.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src =" https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js " > </script>
<style>
.imgBox>a>img{margin-top:17px;}
.header{height:100px;}
.header>div{height:100px;}
#toCart{
	position:relative;
	left:270px;
}
#alarmContentBox{
	left:1300px;
}
</style>
</head>
<body>
 <div class="container-fluid">
        <div class="row header">
            <!--로고영역-->
            <div class="col-2 imgBox">
            	<c:choose>
            		<c:when test="${loginSession.type==2}">
            			 <a href="${pageContext.request.contextPath}/offline/toMainEx.do?expert_id=${loginSession.user_id}">
		                	<img src="/resources/img/logo.png">
		                </a>
            		</c:when>
            		<c:otherwise>
            			 <a href="/offline/toMain.do">
		                	<img src="/resources/img/logo.png">
		                </a>
            		</c:otherwise>
            	</c:choose>
            </div>
            <!-- 검색창(오프라인은 각 분야게시판의 검색기능으로 대체)-->
            <div class="col-5 searchBox">
        
            </div>
            <!--온라인클래스 이동-->
            <div class="col-1">
                <button type="button" class="btn btn-dark" id="toOnline">온라인</button>
            </div>
            <!-- 장바구니 -->
            <div class="col-1">    
            	<c:if test = "${not empty loginSession }">
                   <svg xmlns="http://www.w3.org/2000/svg" width="25%" height="25%" fill="currentColor" class="bi bi-cart4" id="toCart" viewBox="0 0 16 16">
					  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
					</svg>
                </c:if>    
            </div>
            <!--알림(비로그인시 svg 안보여야함) // 로그인세션활용하여 c:if처리 할것-->
            <div class="col-1">
            	<c:if test = "${not empty loginSession }">
                    <button type="button" class="btn btn-white position-relative alarm" id="alarmBtn">
					  <svg xmlns="http://www.w3.org/2000/svg" width="110%" height="110%" fill="currentColor" class="bi bi-bell bell" viewBox="0 0 16 16">
						  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>
					  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
					    <span class="visually-hidden">New alerts</span>
					  </span>
					</button>
					<button type="button" class="btn btn-white position-relative alarm" id="noAlarmBtn">
					  <svg xmlns="http://www.w3.org/2000/svg" width="110%" height="110%" fill="currentColor" class="bi bi-bell bell" viewBox="0 0 16 16">
						  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>
					</button>
					<div id="alarmContentBox">
						<button type="button" class="btn btn-dark deleteAll" id="deleteAll">전체삭제</button>
						<div id="newAlarm"></div>
						<div id="alarmContent"></div>
					</div>
                </c:if>
            </div>
            <!--쪽지함(비로그인시 svg 안보여야함) // 로그인세션활용하여 c:if처리 할것-->
            <div class="col-1">
            	<c:if test = "${not empty loginSession }">
	                <svg xmlns="http://www.w3.org/2000/svg" width="25%" height="25%" fill="currentColor" id="toMessage" class="bi bi-envelope" viewBox="0 0 16 16">
	                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
	                  </svg>
                </c:if>
            </div>         
            <!-- 로그인과정 -->
            <c:choose>
            	<c:when test="${empty loginSession }">
            		<div class="col-1">
		                <button type="button" class="btn btn-outline-dark" id="toLogin">로그인</button>
		            </div>
            	</c:when>
            	<c:otherwise>
		            <div class="col-1 accountBox" >
		                <svg xmlns="http://www.w3.org/2000/svg" width="25%" height="25%" fill="currentColor" class="bi bi-person-square account" viewBox="0 0 16 16">
		                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
		                </svg>
		                <div id="accountInfoBox" style="display:none;">
				           <div class="row align-content-center textList1" id="toMypage">        		    		
				           			마이페이지
				           </div>
				           <div class="row align-content-center textList2" id="toUserInfo">
				           			정보 수정
				           </div>
				           <div class="row align-content-center textList2" id="toLogout">
				           			로그 아웃
				           </div>
		       			 </div>
		            </div>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
    
    	//계정표시아이콘 눌렀을 경우 마이페이지,정보수정,로그아웃 할수 있는 div창이 내려옴
        $(".account").click(function(){
            let accountBox = $("#accountInfoBox")
            if(accountBox.is(":visible")){
			    accountBox.fadeOut();
			}else{
			    accountBox.fadeIn();
			}
        }); 
           
    	//로그인 버튼 눌렀을 경우 login.jsp로 이동(HomeController이용)
         $("#toLogin").click(function(){
        	 location.href="${pageContext.request.contextPath}/toLogin.do"
         })
         
         //마이페이지 div창 눌렀을 경우 mypage.jsp로 이동(MemberController이용)
         $("#toMypage").click(function(){
        	 let type = '${loginSession.type}'
            	 if(type==0){
            		 location.href = "${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}"
            	 }else{
            		 location.href="${pageContext.request.contextPath}/member/toMyPage"
            	 }
         })
         //쪽지함 버튼 클릭시 쪽지함으로 이동 
         $("#toMessage").click(function(){
        	 location.href="${pagecontext.request.contextPath}/message/toViewMessage?type=received&user_id=${loginSession.user_id}&currentPage=1";
         })
         //정보수정 버튼 클릭시 회원정보조회페이지로 이동 
         $("#toUserInfo").click(function(){
        	 location.href="${pageContext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}";
         })
         
          //장바구니 버튼 클릭시 장바구니로 이동 
         $("#toCart").click(function(){
        	 location.href="${pagecontext.request.contextPath}/cart/selectCart.do?user_id=${loginSession.user_id}";
         })
         
         //로그아웃버튼 누르면 로그아웃처리
         $("#toLogout").click(function(){
        	 location.href="${pageContext.request.contextPath}/member/logout"
         })
         
         $("#toOnline").click(function(){
        	 location.href="${pageContext.request.contextPath}/online/toMain.do"
         })
         
        
         
          //========================================== 알람 영역 ===============================================
         //websocket 주소->endpoint로 이동
         ws = new WebSocket("ws://13.209.48.56:8080/alarm");
         
       //처음 시작할때 저장돼있는 알람 불러옴
  		$(document).ready(function(){
  			console.log("알람불러오기");
  			if("${loginSession}" != null){
  				selectAlarm();
  			}
  		})
 		
       //알람 클릭시 알림창 뜨게함
 		$(".alarm").click(function(){
 			 let category = $("#alarmContentBox")
 	            if(category.is(":visible")){
 	            	category.fadeOut();
 				}else{
 					category.fadeIn();	    
 				}
 		})	
 		//빨간점 알람 클릭시 빨간점 없는 알람버튼으로 바꿔줌 
		$("#alarmBtn").click(function(){
			$("#alarmBtn").css("display","none")
			$("#noAlarmBtn").css("display","flex")
			$("#noAlarmBtn").css("top","32px")
		})
		
		//메세지 수신
		ws.onmessage = function(e){
			console.log(e.data);
			let msgObj = JSON.parse(e.data);
			console.log(msgObj);
			let newMsg= $("<div>")
			let msg="";
			if("${loginSession.user_nickname}" == msgObj.to_id){//본인 아이디일때만 알람이 감
				//알림버튼 바꿈(빨간점 표시)
				$("#alarmBtn").css("display","flex")
				$("#noAlarmBtn").css("display","none")
				//-----------------------------------
				msg+="<div id='replyNew'><span>New</span></div>"
				//메세지 삽입	
				 if(msgObj.send_type==1){
					msg += "<a href='${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no="+msgObj.send_post_no+"'>"
				}else if(msgObj.send_type==2){
					msg += "<a href='${pageContext.request.contextPath}/offlinePost/toPostDetail.do?post_no="+msgObj.send_post_no+"'>"
				} 
				
				msg+="<span>"
				msg+= msgObj.from_id
				msg+= "님이 "
				if(msgObj.type==1){ //좋아요의 경우
					msg +="의뢰 게시글에 좋아요를 눌렀습니다."
				}else if(msgObj.type==2){
					msg +="댓글에 답글을 달았습니다."
				}else if(msgObj.type==3){
					msg +="댓글에 좋아요를 눌렀습니다."
				}
				msg+="</span>"
				 msg+="</a>" 
			newMsg.append(msg);
			$("#newAlarm").append(newMsg); 
			}
		}
 		//전체삭제처리
		$("#deleteAll").click(function(){
			let to_id = '${loginSession.user_nickname}'
			
			$.ajax({
				url:"${pageContext.request.contextPath}/notice/deleteAll.do?to_id="+to_id,
				type : "get"
			}).done(function(rs){
				if(rs == "available"){
					$("#newAlarm").empty();
					$("#alarmContent").empty();
				}else if(rs=="unavailable"){
					alert("전체삭제 실패");
				}
			}).fail(function(e){
				console.log(e);
			})
		})
		
		//개별삭제처리
		$(document).on('click', '.delete', function(e){
			let notice_no = $(this).val();
			console.log(notice_no)
			$.ajax({
				// aJax 알림창 삭제
				url : "${pageContext.request.contextPath}/notice/deleteByNo.do?notice_no="+notice_no
				, type : "get"				
			}).done(function(rs){
				if(rs == "available"){
					$("#alarmContent").empty();
					selectAlarm();
				}else if(rs == "unavailable"){
					alert("알림 삭제에 실패했습니다."); // 알림 삭제에 실패하면 alert 
				}				
			}).fail(function(e){
				console.log(e);
			});
		})
		
		
		
		function selectAlarm(){
 			console.log("알람시동")
			let to_id = '${loginSession.user_nickname}'
				
				$.ajax({
					url: "${pageContext.request.contextPath}/notice/selectById.do?to_id="+to_id,
					type: "get"
				}).done(function(rs){
					for(let notice of rs){
						let newMsg=$("<div>")
						let msg="";
						if(notice.send_type==1){
							let msg = "<a href='${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no="+notice.send_post_no+"'>"
						}else if(notice.send_type==2){
							let msg = "<a href='${pageContext.request.contextPath}/offlinePost/toPostDetail.do?post_no="+notice.send_post_no+"'>"
						} 
						msg += notice.from_id
						msg += "님이 "
						if(notice.type==1){
							msg +="게시글에 좋아요를 눌렀습니다."
						}else if(notice.type==2){
							msg +="게시글에 댓글을 달았습니다."
						}else if(notice.type==3){
							msg +="댓글에 답글을 달았습니다."
						}else if(notice.type==4){
							msg +="댓글에 좋아요를 눌렀습니다."
						}
						msg+="</a>" 
						
						msg+="<button type='button' class='btn btn-dark delete' value='"+notice.notice_no+"'>"
						msg+="<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16'>"
						msg+="<path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/>"
						msg+="</svg>"
						msg+="</button>"
						newMsg.append(msg);
						$("#alarmContent").append(newMsg); 
					}
					
				}).fail(function(e){
					console.log(e);
				})
		}
    </script>
</body>
</html>