<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/header.css"> 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
 <div class="container-fluid">
        <div class="row header">
            <!--로고영역-->
            <div class="col-2 imgBox">
            	<c:choose>
            		<c:when test="${loginSession.type==0}">
            			 <a href="/admin/toAdminMain">
		                	<img src="/resources/img/logo.png">
		                </a>
            		</c:when>
            		<c:otherwise>
            			 <a href="/online/toMain.do">
		                	<img src="/resources/img/logo.png">
		                </a>
            		</c:otherwise>
            	</c:choose>
            </div>
            <!-- 검색창 -->
            <div class="col-5 searchBox">
            	<div class="col-10">
            	<input type="text" class="form-control" id="searchInput" placeholder="검색할 내용을 입력해주세요." aria-describedby="searchText">
            	</div>
            	<div class="col-2">
            	<button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>       
            	</div>
            </div>
            <!--오프라인클래스 이동-->
            <div class="col-1">
                <button type="button" class="btn btn-dark" id="toOffline">오프라인</button>
            </div>
            <!--쇼핑몰(이었던것)-->
            <div class="col-1">        
            </div>
            <!--알림(비로그인시 svg 안보여야함) // 로그인세션활용하여 c:if처리 할것-->
            <div class="col-1">
            	<c:if test = "${not empty loginSession }">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                  </svg>
                </c:if>
            </div>
            <!--쪽지함(비로그인시 svg 안보여야함) // 로그인세션활용하여 c:if처리 할것-->
            <div class="col-1">
            	<c:if test = "${not empty loginSession }">
	                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" id="toMessage" class="bi bi-envelope" viewBox="0 0 16 16">
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
		                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-person-square account" viewBox="0 0 16 16">
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
       

        <!--카테고리영역-->
        <div class="container-fluid categoryBox">
            <div class="row category_big">
                <div class="col">
                    운동
                </div>
                <div class="col">
                    요리, 베이킹
                </div>
                <div class="col">
                    외국어
                </div>
                <div class="col">
                    IT
                </div>
                <div class="col">
                    라이프
                </div>
                <div class="col">
                    드로잉
                </div>
                <div class="col">
                    공예
                </div>
                <div class="col">
                    아동교육
                </div>
            </div>
            <div class="row category_small" style="display:none;">
                <div class="col">
                    <ul>
                        <li value=11>요가</li>
                        <li value=12>필라테스</li>
                        <li value=13>피트니스</li>
                     
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=21>아시안</li>
                        <li value=22>서양</li>
                        <li value=23>제빵</li>
                        
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=31>영어</li>
                        <li value=32>중국어</li>
                        <li value=33>스페인어</li>
                  
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=41>프로그래밍</li>
                        <li value=42>정보보안</li>
                        <li value=43>모바일App개발</li>
                   
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=51>뷰티</li>
                        <li value=52>명상</li>
                        <li value=53>반려동물</li>
           
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=61>펜, 연필</li>
                        <li value=62>마카</li>
                        <li value=63>색연필</li>
               
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=71>뜨개질, 자수</li>
                        <li value=72>패브릭공예</li>
                        <li value=73>종이공예</li>
  
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li value=81>자연, 과학</li>
                        <li value=82>신체, 건강</li>
                        <li value=83>수학, 코딩</li>
      
                    </ul>
                </div>
            </div>
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
    
    	//카테고리 창 눌렀을 경우 소분류 창이 내려옴
         $(".category_big").click(function(){
            let category = $(".category_small")
            if(category.is(":visible")){
            	category.css("display", "none")
			}else{
				category.css("display", "")
			    
			}
        }); 
         
    	//로그인 버튼 눌렀을 경우 login.jsp로 이동(HomeController이용)
         $("#toLogin").click(function(){
        	 location.href="${pageContext.request.contextPath}/toLogin.do"
         })
         
         //마이페이지 div창 눌렀을 경우 mypage.jsp로 이동(MemberController이용)
         $("#toMypage").click(function(){
        	 location.href="${pageContext.request.contextPath}/member/toMyPage"
         })
         //쪽지함 버튼 클릭시 쪽지함으로 이동 
         $("#toMessage").click(function(){
        	 location.href="${pagecontext.request.contextPath}/message/toViewMessage?type=received&user_id=${loginSession.user_id}&currentPage=1";
         })
         //정보수정 버튼 클릭시 회원정보조회페이지로 이동 
         $("#toUserInfo").click(function(){
        	 location.href="${pageContext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}";
         })
         
         //로그아웃버튼 누르면 로그아웃처리
         $("#toLogout").click(function(){
        	 location.href="${pageContext.request.contextPath}/member/logout"
         })
         
         $("#toOffline").click(function(){
        	 let id = '${loginSession.user_id}'
        	
        	 if('${loginSession.type}'==2){
        		 location.href="${pageContext.request.contextPath}/offline/toMainEx.do?expert_id="+id
        	 }else{
        		 location.href="${pageContext.request.contextPath}/offline/toMain.do"
        	 }
        	 
         })
         //websocket 주소->endpoint로 이동[본인의 포트번호로 바꿀것]
         ws = new WebSocket("ws://localhost/alarm");
    </script>
</body>
</html>