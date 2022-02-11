<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/memberManagement.css">
<title>회원 관리</title>
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
				action="${pageContext.request.contextPath}/admin/getMemberList.do?currentIdx=1&userType=${userType}"
				method="post" class="d-flex justify-content-center">
				<div class="row searchArea">
					<div class="col-3 d-flex justify-content-end">
						<select class="form-select" aria-label="Default select example"
							name="searchOption">
							<option selected value="user_id" ${searchOption == "user_id" ? 'selected="selected"' : ''}>아이디</option>
							<option value="user_nickname" ${searchOption == "user_nickname" ? 'selected="selected"' : ''}>닉네임</option>
							<option value="email" ${searchOption == "email" ? 'selected="selected"' : ''}>이메일</option>
						</select>
					</div>
					<div class="col-6 d-flex justify-content-center">
						<input type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="" value="${searchKeyword}">
					</div>
					<div class="col-3 d-flex justify-content-start">
						<button type="submit" class="btn btn-outline-dark" id="adminSearchBtn">검색</button>
					</div>
				</div>
			</form>
			
			<!-- 회원 유형 -->
			<div class="row cls-postType py-3">
				<div class="col-4 d-flex">
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeAll" value="9">전체</button>
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeBasic" value="1">일반회원</button>
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeExpert" value="2">고수</button>
					<button type="button" class="btn btn-outline-dark cls-type"
						id="typeAdmin" value="0">관리자</button>
				</div>
			</div>
			
			<!-- 회원정보 출력 -->
			<form id="selectCheckbox" method="post"
				class="d-flex justify-content-center">
				<div class="row tableWrapper">
					<div class="col-12 px-0">
						<table class="table table-striped table-hover">
							<thead>
								<th><input type="checkbox" class="userCheckBoxAll"
									name="userCheckBoxAll" id="userCheckBoxAll"></th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>회원유형</th>
								<th>블랙리스트</th>
								<th>가입일</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="7">회원 정보가 존재하지 않습니다.</td>
										<tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="dto">
											<tr>
												<td><input type="checkbox" value="${dto.user_id}"
													class="userCheckBox" name="userCheckBox" id="userCheckBox">
												</td>
												<td class="cls-toMypage" id="user_id">${dto.user_id}</td>
												<td class="cls-toMypage">${dto.user_nickname}</td>
												<td class="cls-toMypage">${dto.email}</td>
												<c:choose>
													<c:when test="${dto.type eq 0}">
														<td class="cls-admin cls-toMypage">외계인</td>
													</c:when>
													<c:when test="${dto.type eq 1}">
														<td class="cls-toMypage">일반</td>
													</c:when>
													<c:when test="${dto.type eq 2}">
														<td class="cls-expert cls-toMypage">능력자</td>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${dto.blacklist eq 0}">
														<td class="cls-toMypage">N</td>
													</c:when>
													<c:otherwise>
														<td class="cls-blacklist cls-toMypage">Y</td>
													</c:otherwise>
												</c:choose>
												<td class="cls-toMypage">${dto.signup_date}</td>
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
									href="${pageContext.request.contextPath}/admin/getMemberList.do?currentIdx=${map.firstIdx-1}&userType=${userType}">Previous</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
								<c:choose>
									<c:when test="${empty searchOption}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getMemberList.do?currentIdx=${i}&userType=${userType}">${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getMemberList.do?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&userType=${userType}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getMemberList.do?currentIdx=${map.lastIdx+1}&userType=${userType}">Next</a>
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
						id="blackListBtn">블랙리스트 추가</button>
					<button type="button" class="btn btn-outline-dark"
						id="blackListCancelBtn">블랙리스트 해제</button>
					<button type="button" class="btn btn-outline-dark"
						id="expulsionBtn">회원 강제 탈퇴</button>
				</div>
			</div>
		</div>
	</div>

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
            $("#searchForm").on("submit");
            // 블랙리스트 추가
            $("#blackListBtn").on("click", function () {
                if ($(".userCheckBox").is(":checked") && confirm("블랙리스트에 추가하겠습니까?")) {
                    $("form").attr("action", "${pageContext.request.contextPath}/admin/memberBlackList.do?idx=1");
                    $("#selectCheckbox").submit();
                }
            });
            // 블랙리스트 해제
            $("#blackListCancelBtn").on("click", function () {
                if ($(".userCheckBox").is(":checked") && confirm("블랙리스트를 해제하겠습니까?")) {
                    $("form").attr("action", "${pageContext.request.contextPath}/admin/memberBlackList.do?idx=0");
                    $("#selectCheckbox").submit();
                }
            });
            // 회원 강제 탈퇴
            $("#expulsionBtn").on("click", function () {
                if ($(".userCheckBox").is(":checked") && confirm("강제 탈퇴시키겠습니까?")) {
                    $("form").attr("action", "${pageContext.request.contextPath}/admin/memberExpulsion.do");
                    $("#selectCheckbox").submit();
                }
            });
            // 회원 정보 수정
            $(".cls-toMypage").on("click", function (e) {
                const user_id = $(e.target).parent().find("#user_id").text();
                location.href = "${pageContext.request.contextPath}/admin/toUserInfomation?user_id=" + user_id;
            });
         	// 회원 유형 선택
            $(".cls-type").on("click", function(e) {
            	const userType = e.target.value;
                location.href = "${pageContext.request.contextPath}/admin/getMemberList.do?currentIdx=1&userType="+userType;
            });
            // 유형 버튼 변경
            $(document).ready(function() {
                switch(${userType}) {
                    case 0 :
                        $("#typeAdmin").attr("class", "btn btn-dark");
                        break;
                    case 1 :
                        $("#typeBasic").attr("class", "btn btn-dark");
                        break;
                    case 2 :
                        $("#typeExpert").attr("class", "btn btn-dark");
                        break;
                    case 9 :
                        $("#typeAll").attr("class", "btn btn-dark");
                        break;
                }
            });
        </script>
</body>

</html>