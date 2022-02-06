<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/reportManagement.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>신고 관리</title>
</head>

<body>
	<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
	<div class="main-Wrapper d-flex justify-content-center pt-5">
		<!--사이드 바-->
		<div class="cls-sideBar">
			<%@include file="/WEB-INF/views/admin/adminSidebar.jsp"%>
		</div>
		
		<!-- 본문 -->
		<div class="cls-main">
		
			<!-- 검색 영역 -->
			<form id="searchForm"
				action="${pageContext.request.contextPath}/admin/getReportList.do?currentIdx=1"
				method="post" class="d-flex justify-content-center">
				<div class="row searchArea">
					<div class="col-3 d-flex justify-content-end">
						<select class="form-select" aria-label="Default select example"
							name="searchOption">
							<!-- 컬럼 type에 맞춰 value 수정할 것 -->
							<option value="1" ${searchOption == "1" ? 'selected="selected"' : ''}>게시글</option>
							<option value="2" ${searchOption == "2" ? 'selected="selected"' : ''}>댓글</option>
							<option value="3" ${searchOption == "3" ? 'selected="selected"' : ''}>쪽지</option>
						</select>
					</div>
					<div class="col-6 d-flex justify-content-center">
						<input type="text" class="form-control" name="searchKeyword"
							placeholder="">
					</div>
					<div class="col-3 d-flex justify-content-start">
						<button type="submit" class="btn btn-outline-dark" id="searchBtn">검색</button>
					</div>
				</div>
			</form>
			
			<!-- 테이블 영역 -->
			<form id="selectCheckbox" method="post"
				class="d-flex justify-content-center">
				<div class="row tableWrapper">
					<div class="col-12 px-0">
						<table class="table table-striped table-hover">
							<thead>
								<th><input type="checkbox" class="reportCheckBoxAll"
									id="reportCheckBoxAll" name="reportCheckBoxAll"></th>
								<th>신고자</th>
								<th>신고 유형</th>
								<th>내용</th>
								<th>처리 상황</th>
								<th>등록일</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="6">신고 내역이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="map">
											<input type="text" value="${map.TYPE}" hidden>
											<tr>
												<td><input type="checkbox" value="${map.REPORT_NO}"
													class="reportCheckBox" id="reportCheckBox"
													name="reportCheckBox"></td>
												<td class="toReportDetail">${map.USER_NICKNAME}</td>
												<c:choose>
													<c:when test="${map.TYPE eq 1}">
														<td class="toReportDetail">게시글</td>
													</c:when>
													<c:when test="${map.TYPE eq 2}">
														<td class="toReportDetail">댓글</td>
													</c:when>
													<c:when test="${map.TYPE eq 3}">
														<td class="toReportDetail">쪽지</td>
													</c:when>
												</c:choose>
												<td class="toReportDetail">${map.REPORT_CONTENT}</td>
												<c:choose>
													<c:when test="${map.YN eq 0}">
														<td class="toReportDetail">미처리</td>
													</c:when>
													<c:otherwise>
														<td class="reportClear toReportDetail">처리 완료</td>
													</c:otherwise>
												</c:choose>
												<td class="toReportDetail">${map.REPORT_DATE}</td>
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
									href="${pageContext.request.contextPath}/admin/getReportList.do?currentIdx=${map.firstIdx-1}">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
								<c:choose>
									<c:when test="${empty searchOption}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getReportList.do?currentIdx=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getReportList.do?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&key=y">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getReportList.do?currentIdx=${map.lastIdx+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<script>
        // 전체 체크박스 ON / OFF
        $("#reportCheckBoxAll").on("click", function () {
            if ($("#reportCheckBoxAll").is(":checked")) {
                $("input[name=reportCheckBox]").prop("checked", true);
                return;
            }
            $("input[name=reportCheckBox]").prop("checked", false);
        });
     	// 신고 검색
        $("#searchForm").on("submit");
     	// 신고 상세페이지 이동
     	$(".toReportDetail").on("click", function(e) {
     		const type = $(e.target).parent().find("*").eq(3).text();
     		const report_no = $(e.target).parent().find("*").eq(0).children().val();
     		window.open("${pageContext.request.contextPath}/admin/getReportDetail?report_no="+report_no+"&type="+type, "reportDetail", "width=550,height=650");
     	});
    </script>
</body>
</html>