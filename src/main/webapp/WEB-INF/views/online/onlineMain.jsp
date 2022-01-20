<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 적용 문구 -->
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/onlineMain.css"> 
</head>
<body>
    <div class="container-fluid">
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

</body>
</html>