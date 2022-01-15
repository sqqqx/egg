<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- css파일은 /resources/css폴더 안에 있습니다. -->
<link rel="stylesheet" href="/resources/css/onlineMain.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row header">
            <!--로고영역-->
            <div class="col-2 imgBox">
                <img src="/resources/img/logo.png">
            </div>
            <!-- 검색창 -->
            <div class="input-group searchBox">
                <input type="text" class="form-control" placeholder="검색할 내용을 입력해주세요." aria-describedby="searchText">
                <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
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
            <div class="col-1" >
                <button type="button" class="btn btn-outline-dark" id="toLogin">로그인</button>
            </div>
            <!--로그인후 (임시로 로그인전에는 hidden처리할것)// 로그인세션활용하여 c:choose처리할것 -->
            <div class="col-1 accountBox" hidden>
                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor" class="bi bi-person-square account" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
                </svg>
            </div>
        </div>
        <!--로그인후 계정아이콘 클릭하면 보이는 창-->
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
            <div class="row category_small">
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
       
        
        <!--캐러샐-->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active slidePhoto">
                <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_6E6E61E02B8D4E21B92E5143A00F6CB5.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item slidePhoto">
                <img src="https://st4.depositphotos.com/20894472/41692/v/600/depositphotos_416924958-stock-illustration-clayware-crafting-hobby-online-classes.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item slidePhoto">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNT3bHsIQRqBcpkXu2Ca1rskQmXJzt7xIi6w&usqp=CAU" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev iconBox" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon iconPosition" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next iconBox" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon iconPosition" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="row main">
            <div class="col-12 mt-5 class">
                <label><h4>★이달의 강의★</h4></label>
                <button type="button" class="btn btn-primary">더보기</button>
                <div class="row">
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-5 class">
                <label><h4>★관리자 추천 강의★</h4></label>
                <button type="button" class="btn btn-primary">더보기</button>
                <div class="row">
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">영상화면</div>
                        <div class="row mediaText">제목</div>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-5 itemBox">
                <label><h4>★강의 필수 아이템★</h4></label>
                <button type="button" class="btn btn-primary">더보기</button>
                <div class="row">
                    <div class="col">
                        <div class="row mediaPhoto">상품사진</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">상품사진</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">상품사진</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">상품사진</div>
                        <div class="row mediaText">제목</div>
                    </div>
                    <div class="col">
                        <div class="row mediaPhoto">상품사진</div>
                        <div class="row mediaText">제목</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer">
            푸터
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
    <script>
         $(".category_big").click(function(){
            let accountBox = $(".category_small")
            if(accountBox.is(":visible")){
			    accountBox.css("display", "none")
			}else{
			    accountBox.css("display", "flex")
			}
        }); 
         
         $("#toLogin").click(function(){
        	 location.href="${pageContext.request.contextPath}/toLogin.do"
         })
         
    </script>
</body>
</html>