<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/admin/memberManagement.css">
    <title>게시글 관리</title>
</head>

<body>
    <%@include file="/WEB-INF/views/header.jsp" %>
        <div class="main-Wrapper d-flex justify-content-center pt-5">
            <!--사이드 바-->
            <div class="cls-sideBar">
                <%@include file="/WEB-INF/views/admin/adminSidebar.jsp" %>
            </div>
            <!-- 본문 -->
            <div class="cls-main">
                <!-- 검색 영역 -->
                <form id="searchForm" action="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=1"
                    method="post" class="d-flex justify-content-center">
                    <div class="row searchArea">
                        <div class="col-3 d-flex justify-content-end">
                            <select class="form-select" aria-label="Default select example" name="searchOption">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="user_nickname">작성자</option>
                            </select>
                        </div>
                        <div class="col-6 d-flex justify-content-center">
                            <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"
                                placeholder="">
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
                                    <th><input type="checkbox" class="postCheckBoxAll" name="postCheckBoxAll"
                                            id="postCheckBoxAll"></th>
                                    <th>번호</th>
                                    <th>유형</th>
                                    <th>작성자</th>
                                    <th>제목</th>
                                    <th>조회수</th>
                                    <th>좋아요</th>
                                    <th>작성일</th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="map">
                                        <tr>
                                            <td><input type="checkbox" value="${map.POST_NO}" class="postCheckBox"
                                                    name="postCheckBox" id="postCheckBox">
                                            </td>
                                            <td class="cls-toDetailPost">${map.POST_NO}</td>
                                            <c:choose>
                                            	<c:when test="${map.TYPE eq 0}">
                                            		<td class="cls-toDetailPost">오프라인</td>
                                           		</c:when>
                                            	<c:when test="${map.TYPE eq 1}">
                                            		<td class="cls-toDetailPost">온라인</td>
                                            	</c:when>
                                            	<c:when test="${map.TYPE eq 2}">
                                            		<td class="cls-toDetailPost">스토어</td>
                                            	</c:when>
                                            </c:choose>
                                            <td class="cls-toDetailPost">${map.USER_NICKNAME}</td>
                                            <td class="cls-toDetailPost">${map.TITLE}</td>
                                            <td class="cls-toDetailPost">${map.VIEW_COUNT}</td>
                                            <td class="cls-toDetailPost">${map.COUNT}</td>
                                            <td class="cls-toDetailPost">${map.WRITTEN_DATE}</td>
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
                                            href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${map.firstIdx-1}">Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
                                    <c:choose>
                                        <c:when test="${empty searchOption}">
                                            <li class="page-item"><a class="page-link"
                                                    href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link"
                                                    href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${map.needNext eq true}">
                                    <li class="page-item"><a class="page-link"
                                            href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${map.lastIdx+1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div> 
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script>
        	
		    // 전체 체크박스 ON / OFF
	        $("#selectCheckboxAll").on("click", function () {
	            if ($("#selectCheckboxAll").is(":checked")) {
	                $("input[name=selectCheckbox]").prop("checked", true);
	                return;
	            }
	            $("input[name=selectCheckbox]").prop("checked", false);
	        });
		    // 검색
	        $("#searchForm").on("submit");
		    // 상세페이지 이동
	      	
        </script>
</body>

</html>