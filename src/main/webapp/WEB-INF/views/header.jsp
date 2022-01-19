<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
<link rel="stylesheet" href="/resources/css/header.css"> 
</head>
<body>
 <div class="container-fluid">
        <div class="row header">
            <!--로고영역-->
            <div class="col-2 imgBox">
                <a href="/online/toMain.do">
                	<img src="/resources/img/logo.png">
                </a>
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
                <button type="button" class="btn btn-dark">오프라인</button>
            </div>
            <!--쇼핑몰-->
            <div class="col-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
                    <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
                </svg>
            </div>
            <!--알림(비로그인시 svg 안보여야함) // 로그인세션활용하여 c:if처리 할것-->
            <div class="col-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                  </svg>
            </div>
            <!--쪽지함(비로그인시 svg 안보여야함) // 로그인세션활용하여 c:if처리 할것-->
            <div class="col-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                  </svg>
            </div>
            <!--로그인전 (임시로 로그인후에는 hidden처리할것)// 로그인세션활용하여 c:choose처리할것-->
            <div class="col-1">
                <button type="button" class="btn btn-outline-dark" id="toLogin">로그인</button>
            </div>
            <!--로그인후 (임시로 로그인전에는 hidden처리할것)// 로그인세션활용하여 c:choose처리할것 -->
            <div class="col-1 accountBox" hidden>
                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-person-square account" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
                </svg>
                <div id="accountInfoBox" style="display:none;">
		           <div class="row align-content-center textList1" id="toMypage">        		    		
		           			마이페이지
		           </div>
		           <div class="row align-content-center textList2">
		           			정보 수정
		           </div>
		           <div class="row align-content-center textList2">
		           			로그 아웃
		           </div>
       			 </div>
            </div>
             <!--로그인후 계정아이콘 클릭하면 보이는 창-->
        
        </div>
       

        <!--카테고리영역-->
        <div class="container-fluid categoryBox">
            <div class="row category_big">
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
                <div class="col">
                    대분류
                </div>
            </div>
            <div class="row category_small" style="display:none;">
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
                        <li>소분류</li>
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
        	 location.href="${pageContext.request.contextPath}/member/toMypage.do"
         })
    </script>
</body>
</html>