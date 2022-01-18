<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Member Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        * {
            margin: 0;
        }

        body {
            width: 1800px;
            height: 1000px;
            margin: 0 auto;
        }

        .header {
            height: 100px;
            border-bottom: 2px solid black;
        }

        .header>div {
            line-height: 100px;
        }

        .imgBox>img {
            width: 34%;
            height: 100%;
            margin-left: 30%;
        }

        .header>div>svg {
            margin-left: 35px;
            cursor: pointer;
        }

        .accountBox {
            position: relative;
            left: 1300px;
        }

        #accountInfoBox {
            background-color: white;
            position: absolute;
            width: 12%;
            right: 40px;
            display: none;
            z-index: 2;
        }

        #accountInfoBox>div {
            height: 60px;
            border: 1px solid gray;
            text-align: center;
            padding-top: 15px;
            cursor: pointer;
        }

        #accountInfoBox>div:hover {
            background-color: black;
            color: white;
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
        .searchArea {
            width: 100%;
        }

        .searchArea>div {
            padding: 0;
        }

        .searchArea button {
            width: 100%;
        }

        .tableWrapper table {
            width: 100%;
            text-align: center;
        }
        .tableWrapper {
            width: 100%;
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
        

        /* 폰트 관련 */
        .cls-blacklist {
            font-weight: bold;
            color: red !important;
        }

        .cls-admin {
            font-weight: bolder;
        }

        .cls-expert {
            font-weight: bold;
            color: green !important;
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
            <div class="col-1 accountBox">
                <svg xmlns="http://www.w3.org/2000/svg" width="50%" height="50%" fill="currentColor"
                    class="bi bi-person-square account" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path
                        d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z" />
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
                <!-- 회원 검색-->
                <form id="searchForm" action="${pageContext.request.contextPath}/admin/getMemberList?currentIdx=1&key=y"
                    method="post" class="d-flex justify-content-center">
                    <div class="row searchArea pb-5">
                        <div class="col-3 d-flex justify-content-end">
                            <select class="form-select" aria-label="Default select example" name="searchOption">
                                <option selected value="user_id">아이디</option>
                                <option value="user_nickname">닉네임</option>
                                <option value="email">이메일</option>
                            </select>
                        </div>
                        <div class="col-6 d-flex justify-content-center">
                            <input type="text" class="form-control" name="searchKeyword" placeholder="">
                        </div>
                        <div class="col-3 d-flex justify-content-start">
                            <button type="submit" class="btn btn-outline-dark" id="searchBtn">검색</button>
                        </div>
                    </div>
                </form>
                <!-- 회원정보 출력 -->
                <form id="selectCheckbox" method="post" class="d-flex justify-content-center">
                    <div class="row tableWrapper">
                        <div class="col-12 px-0">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <th><input type="checkbox" class="userCheckBoxAll" name="userCheckBoxAll"
                                            id="userCheckBoxAll"></th>
                                    <th>아이디</th>
                                    <th>닉네임</th>
                                    <th>이메일</th>
                                    <th>회원유형</th>
                                    <th>블랙리스트</th>
                                    <th>가입일</th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="dto">
                                        <tr>
                                            <td><input type="checkbox" value="${dto.user_id}" class="userCheckBox"
                                                    name="userCheckBox" id="userCheckBox">
                                            </td>
                                            <td>${dto.user_id}</td>
                                            <td>${dto.user_nickname}</td>
                                            <td>${dto.email}</td>
                                            <c:choose>
                                                <c:when test="${dto.type eq 0}">
                                                    <td class="cls-admin">관리자</td>
                                                </c:when>
                                                <c:when test="${dto.type eq 1}">
                                                    <td>일반</td>
                                                </c:when>
                                                <c:when test="${dto.type eq 2}">
                                                    <td class="cls-expert">능력자</td>
                                                </c:when>
                                                <c:when test="${dto.type eq 9}">
                                                    <td>탈퇴</td>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${dto.blacklist eq 0}">
                                                    <td>N</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="cls-blacklist">Y</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>${dto.signup_date}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
                <!-- 페이징 영역 -->
                <div class="row">
                    <div class="col-12 d-flex justify-content-center pt-5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${map.needPrev eq true}">
                                    <li class="page-item"><a class="page-link"
                                            href="${pageContext.request.contextPath}/admin/getMemberList?currentIdx=${map.firstIdx-1}">Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
                                    <c:choose>
                                        <c:when test="${empty searchOption}">
                                            <li class="page-item"><a class="page-link"
                                                href="${pageContext.request.contextPath}/admin/getMemberList?currentIdx=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link"
                                                href="${pageContext.request.contextPath}/admin/getMemberList?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&key=y">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${map.needNext eq true}">
                                    <li class="page-item"><a class="page-link"
                                            href="${pageContext.request.contextPath}/admin/getMemberList?currentIdx=${map.lastIdx+1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- 하단 버튼 영역 -->
                <div class="row">
                    <div class="col-12 d-flex justify-content-end px-0">
                        <button type="button" class="btn btn-outline-dark" id="blackListBtn">블랙리스트
                            추가</button>
                        <button type="button" class="btn btn-outline-dark" id="blackListCancelBtn">블랙리스트
                            해제</button>
                        <button type="button" class="btn btn-outline-dark" id="expulsionBtn">회원 강제
                            탈퇴</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 관리자 메인영역 마무리 -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(".account").click(function () {
            let accountBox = $("#accountInfoBox")
            if (accountBox.is(":visible")) {
                accountBox.fadeOut();
            } else {
                accountBox.fadeIn();
            }
        }); 
    </script>
    <script>
        // 전체 체크박스 ON / OFF
        $("#userCheckBoxAll").on("click", function () {
            if ($("#userCheckBoxAll").is(":checked")) {
                $("input[name=userCheckBox]").prop("checked", true);
                return;
            }
            $("input[name=userCheckBox]").prop("checked", false);
        });
        // 회원정보 검색
        $("#searchForm").on("submit", function () {
            if ($("#searchInput").val() == "") {
                alert("키워드를 정확히 입력하세요");
                return false;
            }
        });
        // 블랙리스트 추가
        $("#blackListBtn").on("click", function () {
            if ($(".userCheckBox").is(":checked") && confirm("블랙리스트에 추가하겠습니까?")) {
                $("form").attr("action", "${pageContext.request.contextPath}/admin/memberBlackList?idx=1");
                $("#selectCheckbox").submit();
            }
        });
        // 블랙리스트 해제
        $("#blackListCancelBtn").on("click", function () {
            if ($(".userCheckBox").is(":checked") && confirm("블랙리스트를 해제하겠습니까?")) {
                $("form").attr("action", "${pageContext.request.contextPath}/admin/memberBlackList?idx=0");
                $("#selectCheckbox").submit();
            }
        });
        // 회원 강제 탈퇴
        $("#expulsionBtn").on("click", function () {
            if ($(".userCheckBox").is(":checked") && confirm("강제 탈퇴시키겠습니까?")) {
                $("form").attr("action", "${pageContext.request.contextPath}/admin/memberExpulsion");
                $("#selectCheckbox").submit();
            }
        });
    </script>
</body>

</html>