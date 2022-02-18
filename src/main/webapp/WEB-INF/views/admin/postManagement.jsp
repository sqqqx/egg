<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/memberManagement.css">
<title>게시글 관리</title>
</head>

<body>
	<%@include file="/WEB-INF/views/admin/adminHeader.jsp"%>
	<div class="main-Wrapper d-flex justify-content-center pt-5">
		<!--사이드 바-->
		<div class="cls-sideBar">
			<%@include file="/WEB-INF/views/admin/adminSidebar.jsp"%>
		</div>

		<!-- 본문 -->
		<div class="cls-main">

			<!-- 검색 영역 -->
			<form id="searchForm"
				action="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=1&type=${type}"
				method="post" class="d-flex justify-content-center">
				<div class="row searchArea">
					<div class="col-3 d-flex justify-content-end">
						<select class="form-select" aria-label="Default select example"
							name="searchOption" id="searchOption">
							<option value="title"
								${searchOption == "title" ? 'selected="selected"' : ''}>제목</option>
							<option value="content"
								${searchOption == "content" ? 'selected="selected"' : ''}>내용</option>
							<option value="user_nickname"
								${searchOption == "user_nickname" ? 'selected="selected"' : ''}>작성자</option>
						</select>
					</div>
					<div class="col-6 d-flex justify-content-center">
						<input type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="">
					</div>
					<div class="col-3 d-flex justify-content-start">
						<button type="submit" class="btn btn-outline-dark" id="adminSearchBtn">검색</button>
					</div>
				</div>
			</form>

			<!-- 글 유형 -->
			<div class="row cls-postType py-3">
				<div class="col-4 d-flex">
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeAll" value="9">전체</button>
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeOnline" value="1">온라인</button>
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeOffline" value="2">오프라인</button>
					<%-- <button type="button" class="btn btn-outline-dark cls-type"
						id="typeStore" value="0">스토어</button> --%>
				</div>
				<div class="col-8 d-flex justify-content-end">
					<button type="button" class="btn btn-outline-dark" id="btnWrite">글
						작성</button>
					<button type="button" class="btn btn-outline-dark" id="btnModify">글
						수정</button>
				</div>
			</div>

			<!-- 회원정보 출력 -->
			<form id="selectCheckbox" method="post"
				class="d-flex justify-content-center">
				<div class="row tableWrapper">
					<div class="col-12 px-0">
						<table class="table table-striped table-hover">
							<thead>
								<th><input type="checkbox" class="postCheckBoxAll"
									name="postCheckBoxAll" id="postCheckBoxAll"></th>
								<th>번호</th>
								<th>유형</th>
								<th>작성자</th>
								<th>제목</th>
								<th>조회수</th>
								<th>좋아요</th>
								<th>작성일</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="8">작성 된 글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="map">
											<tr type="${map.TYPE}">
												<td><input type="checkbox" value="${map.POST_NO}"
													class="postCheckBox" name="postCheckBox" id="postCheckBox">
												</td>
												<td class="toDetailPost">${map.POST_NO}</td>
												<c:choose>
													<c:when test="${map.TYPE eq 2}">
														<td class="toDetailPost">오프라인</td>
													</c:when>
													<c:when test="${map.TYPE eq 1}">
														<td class="toDetailPost">온라인</td>
													</c:when>
													<c:when test="${map.TYPE eq 0}">
														<td class="toDetailPost">스토어</td>
													</c:when>
												</c:choose>
												<td class="toDetailPost">${map.USER_NICKNAME}</td>
												<td class="toDetailPost">${map.TITLE}</td>
												<td class="toDetailPost">${map.VIEW_COUNT}</td>
												<c:choose>
													<c:when test="${empty map.COUNT}">
														<td>0</td>
													</c:when>
													<c:otherwise>
														<td>${map.COUNT}</td>
													</c:otherwise>
												</c:choose>
												<td class="toDetailPost">${map.WRITTEN_DATE}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
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
									href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${map.firstIdx-1}&type=${type}">Previous</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
								<c:choose>
									<c:when test="${empty searchOption}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${i}&type=${type}">${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&type=${type}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=${map.lastIdx+1}&type=${type}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>

			<!-- 하단 버튼 영역 -->
			<div class="row">
				<div class="col-12 d-flex justify-content-end px-0">
					<button type="button" class="btn btn-outline-dark"
						id="deletePostbtn">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<script>
            // 전체 체크박스 ON / OFF
            $("#postCheckBoxAll").on("click", function () {
                if ($("#postCheckBoxAll").is(":checked")) {
                    $("input[name=postCheckBox]").prop("checked", true);
                    return;
                }
                $("input[name=postCheckBox]").prop("checked", false);
            });
            // 검색
            $("#searchForm").on("submit");
            // 상세페이지 이동
            $(".toDetailPost").on("click", function (e) {
            	const type = $(e.target).parents("tr").attr("type");
                const post_no = $(e.target).parent().find("*").eq(0).children().val();
                let checkViewCount = 1;
                /* if (!getCookie(post_no)) {
                    setCookie(post_no);
                    checkViewCount = 0;
                } */
                console.log("post_no : " + post_no + " : type : " + type);
                if(type == 1) {
                    location.href = "${pageContext.request.contextPath}/onlinePost/toDetail.do?post_no=" + post_no;
                	return;
                }
                location.href = "${pageContext.request.contextPath}/offlinePost/toPostDetail.do?post_no=" + post_no;
            });
            // 조회수 중복 방지
            /* function setCookie(post_no) {
                const expireDate = new Date();
                expireDate.setDate(expireDate.getDate() + 1);
                const key = "post_no_" + post_no;
                document.cookie = key + "=" + post_no + ";Expires" + expireDate;
            }
            function getCookie(post_no) {
                const key = "post_no_" + post_no;
                const value = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
                // console.log(value[2]);
                return value ? true : false;
            } */
            // 글 유형 선택
            $(".cls-type").on("click", function (e) {
                const type = e.target.value;
                location.href = "${pageContext.request.contextPath}/admin/getPostList.do?currentIdx=1&type=" + type;
            });
            // 유형 버튼 변경
            $(document).ready(function () {
                switch (${type}) {
                   case 0 :
                $("#typeStore").attr("class", "btn btn-dark");
                break;
                   case 1 :
                $("#typeOnline").attr("class", "btn btn-dark");
                break;
                   case 2 :
                $("#typeOffline").attr("class", "btn btn-dark");
                break;
                   case 9 :
                $("#typeAll").attr("class", "btn btn-dark");
                break;
            }
           });
            // 글 작성
            $("#btnWrite").on("click", function () {
                location.href = "${pageContext.request.contextPath}/admin/toPostWrite";
            });
            // 글 삭제
            $("#deletePostbtn").on("click", function () {
                if ($(".postCheckBox").is(":checked") && confirm("삭제하겠습니까?")) {
                    $("#selectCheckbox").attr("action", "${pageContext.request.contextPath}/admin/deletePost.do");
                    $("#selectCheckbox").submit();
                }
            });
            // 글 수정
            $("#btnModify").on("click", function () {
                const checkBoxLength = $("input:checkbox[name=postCheckBox]:checked").length;
                console.log(checkBoxLength);
                if (checkBoxLength == 1) {
                    $("#selectCheckbox").attr("action", "${pageContext.request.contextPath}/admin/toModify");
                    $("#selectCheckbox").submit();
                    return;
                }
                if (checkBoxLength == 0) {
                    alert("한 개 이상의 글을 선택해주세요.");
                    return;
                }
                alert("하나의 글만 선택해주세요.");
            });
        </script>
</body>

</html>