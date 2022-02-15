<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <title>관리자 홈</title>
    <style>
        @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);
        @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");
        /*** 프레임 ***/
		.main-Wrapper {
			padding: 12px;
		}
        .top {
            height: 200px !important;
        }
        .bottom {
            width: 100%;
        }
        .sector {
            height: 400px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
        .ulWrapper {
            overflow: auto;
        }
    </style>
</head>

<body>
 	<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
       <div class="main-Wrapper d-flex justify-content-center pt-5">
             <!--사이드 바-->
            <div class="cls-sideBar">
                <%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            </div>

            <!-- 본문 -->
            <div class="container">
                <div class="row">

                    <div class="col-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">오늘
                                            가입자</span> <span class="h3 font-bold mb-0" id="todayCount">215</span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-primary text-white text-lg rounded-circle">
                                            <i class="bi bi-people"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">비회원
                                            접속자</span> <span class="h3 font-bold mb-0" id="nLoginCount">215</span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-primary text-white text-lg rounded-circle">
                                            <i class="bi bi-people"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2 test33">회원
                                            접속자</span> <span class="h3 font-bold mb-0" id="loginCount">215</span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-primary text-white text-lg rounded-circle">
                                            <i class="bi bi-people"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row py-3">
                    <div class="col-8 sectorWrapper">
                        <div class="sector bottom">
                            <canvas id="line-chart" style="height: 350px; width: 800px"></canvas>
                        </div>
                    </div>
                    <div class="col-4 sectorWrapper">
                        <div class="sector bottom ulWrapper">
                            <ul class="navbar-nav mb-md-4" id="userInfo_Wrapper">
                                <!-- <li>
                                    <div class="nav-link text-xs font-semibold text-uppercase text-muted ls-wide"
                                        href="#">
                                        접속자 명단 <span
                                            class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-4"
                                            id="totalUserCount">13</span>
                                    </div>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // 접속자 수 & 명단
            let totalUserCount = 0;
            let loginUserCount = 0;
            ws.onmessage = function (e) {
                let msgObj = JSON.parse(e.data);
                //console.log(msgObj);
                //console.log(msgObj.type);
                if (msgObj.type == "user_count") {
                    let nLoginCount = msgObj.totalUserCount - msgObj.loginUserCount;
                    $("#nLoginCount").empty();
                    $("#loginCount").empty();
                    $("#totalUserCount").empty();
                    $("#nLoginCount").append(nLoginCount);
                    $("#loginCount").append(msgObj.loginUserCount);
                    totalUserCount = msgObj.totalUserCount;
                    loginUserCount = msgObj.loginUserCount
                }
                if (msgObj.type == "user_id") {
                    getUserInfo(msgObj);
                    $("#getUserList").empty();
                    Object.keys(msgObj).forEach(function (key) {
                        $("#getUserList").append(msgObj[key]);
                    });
                }
                // 오늘 가입자 수
                $("#todayCount").empty();
                $("#todayCount").append(${ getTodayCount });
            }
            // 가입자 통계
            const json = JSON.stringify(${ json });
            const items = JSON.parse(json);
            // console.log(items);

            let labelList = new Array();
            let valueList = new Array();

            for (let item of items) {
                // console.log(item.date);
                labelList.push(item.date);
                valueList.push(item.count);
            }

            new Chart(document.getElementById("line-chart"), {
                type: 'line',
                data: {
                    // labels: [0,1,2,3,4,5,6],
                    labels: labelList,
                    datasets: [
                        /*  { 
                    data: [10,22,12,32,1,5,9,23],
                    label: "방문자",
                    borderColor: "#3e95cd",
                    fill: false
                 },  */
                        {
                            // data: [2,1,0,2,1,0,6],
                            data: valueList,
                            label: "가입자",
                            borderColor: "#8e5ea2",
                            fill: false
                        }
                    ]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: '가입자 통계'
                    }
                }
            });

            // 로그인 유저 정보 가져오기
            function getUserInfo(msgObj) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/getUserInfo.do",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(msgObj)
                }).done(function (list) {
                    for (let item of list) {
                    }
                    insertUserInfo(list);
                }).fail(function (e) {
                    console.log(e);
                });
            }
            // 접속자 명단 생성
            function insertUserInfo(list) {
                $("#userInfo_Wrapper").empty();
                let info = '<li>\
                                <div class="nav-link text-xs font-semibold text-uppercase text-muted ls-wide" href="#">\
                                    접속자 명단 \
                                    <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-4" id="loginUserCount">13</span>\
                                </div>\
                            </li>';
                $("#userInfo_Wrapper").append(info);
                $("#loginUserCount").empty();
                $("#loginUserCount").append(loginUserCount);
                for(let dto of list) {
                	let address = dto.address.match(/[ㄱ-힣]+\s[ㄱ-힣]+/);
                    info = '<li id="li_' + dto.user_id + '">\
                        <a href="#" class="nav-link d-flex align-items-center" onclick="return false;">\
                            <div class="me-4">\
                                <div class="position-relative d-inline-block text-white">\
                                    <img alt="Image Placeholder"\
                                        src="/resources/img/' + dto.profile_path + '"\
                                        class="avatar rounded-circle"> <span\
                                            class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-success rounded-circle"></span>\
                                </div>\
                            </div>\
                            <div>\
                                <span class="d-block text-sm font-semibold">' + dto.user_nickname + '</span> <span class="d-block text-xs text-muted font-regular">\
                                   ' + address + '</span>\
                            </div>\
                            <div class="ms-auto">\
                                <i class="bi bi-trash remove" id="' + dto.user_id + '"></i>\
                            </div>\
                        </a>\
                    </li>';
                    $("#userInfo_Wrapper").append(info);
                }
            }
            // 강제 로그아웃 TEST
            document.addEventListener("click", function(e) {
            	const cls = e.target.getAttribute("class");
            	if(cls == "bi bi-trash remove" && confirm("이 회원을 로그아웃 시키겠습니까?")) {
            		const id = e.target.id;
                	const msg = "deleteSession," + id;
                	ws.send(msg);
                	// 응답값 대신 클라이언트에서 알아서 처리
                	$("#li_" + id).empty();
                	const loginCount = parseInt($("#loginCount").html()) - 1;
                	$("#loginCount").empty();
                	$("#loginCount").append(loginCount);
                	$("#totalUserCount").empty();
                	$("#totalUserCount").append(loginCount);
                	const nLoginCount = parseInt($("#nLoginCount").html()) + 1;
                	$("#nLoginCount").empty();
                	$("#nLoginCount").append(nLoginCount);
            	}
            });
        </script>
</body>

</html>