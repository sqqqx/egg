<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        *{margin:0;}
		body{
		    width:1800px;
		    height: 1000px;
		    margin:0 auto;
		}
		.header{
		    height: 100px; 
		    border-bottom: 2px solid black;   
		}
		.header>div{
		    line-height: 100px;
		}
		.imgBox>img{
		    width:34%;
		    height: 100%;
		    margin-left: 30%;
		}
		.header>div>svg{
		    margin-left: 35px;
		    cursor: pointer;
		}
		.accountBox{
		   position: relative;
		   left: 1300px;
		}
		#accountInfoBox{
		   background-color: white;
		   position: absolute;
		   width:12%;
		   right: 40px;
		   display:none;
		   z-index: 2;
		}
		#accountInfoBox>div{
		   height: 60px;
		   border: 1px solid gray;
		   text-align: center;
		   padding-top:15px;
		   cursor:pointer;
		}
		#accountInfoBox>div:hover{
		   background-color: black;
		   color:white;
		}
		
		/*** 관리자 메인 영역 ***/
        .main-Wrapper > div:nth-child(1) {
        	width: 15%;
        	float: left;
        }
        .main-Wrapper > div:nth-child(2) {
        	width: 85%;
        	float: left;
        }
        .main-Wrapper ul {
            list-style: none;
        }
        
        /* 사이드 바 */
        .cls-sideBar ul {
            list-style: none;
        }
        .cls-sideBar li {
            padding: 20px;
        }
        .cls-sideBar ul a {
            text-decoration: none;
            color: black;
            font-weight: bold;
            padding: 20px;
        } 

    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row header">
            <!--로고영역-->
            <div class="col-2 imgBox">
                <img src="logo.png">
            </div>
           
            <!--관리자계정정보창 -->
            <div class="col-1 accountBox" >
                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-person-square account" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
                </svg>
            </div>
        </div>
        <!--로그인후 계정아이콘 클릭하면 보이는 창(필요없는거 지우시면 됩니다.)-->
        <div class="container" id="accountInfoBox">
           <div class="row">
               <ul>마이페이지</ul>
           </div>
           <div class="row">
                <ul>정보수정</ul>
           </div>
           <div class="row">
                <ul>로그아웃</ul>
           </div>
        </div>
        <!--관리자 메인영역(여기 쓰시면 됩니다)-->
        
        <div class="main-Wrapper d-flex justify-content-center pt-5">
            <!--사이드 바-->
            <div class="cls-sideBar">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/toAdminMain">관리자 홈</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/toMemberManagement">회원 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/toPostManagement">게시글 관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/toReportManagement">신고 관리</a></li>
                    <li>~~side menu1</li>
                    <li>~~side menu2</li>
                    <li>~~side menu3</li>
                </ul>
            </div>
            <!-- 본문 -->
            <div>
                <h2>123abcABC!@#$가나다</h2>
                <p>접속자 수</p>
                <p>가입자 수</p>
                <p>신고 건수, 구매 합..</p>
            </div>
        </div>
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(".account").click(function(){
            let accountBox = $("#accountInfoBox")
            if(accountBox.is(":visible")){
			    accountBox.fadeOut();
			}else{
			    accountBox.fadeIn();
			}
        }); 
    </script> 
</body>
</html>