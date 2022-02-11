<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cls-sideBar</title>
<style>
.dropdown-toggle {
	outline: 0;
}

.nav-flush .nav-link {
	border-radius: 0;
}

.btn-toggle {
	display: inline-flex;
	align-items: center;
	padding: .25rem .5rem;
	font-weight: 600;
	color: rgba(0, 0, 0, .65);
	background-color: transparent;
	border: 0;
}

.btn-toggle:hover, .btn-toggle:focus {
	color: rgba(0, 0, 0, .85);
	background-color: #d2f4ea;
}

.btn-toggle::before {
	width: 1.25em;
	line-height: 0;
	content:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
	transition: transform .35s ease;
	transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
	color: rgba(0, 0, 0, .85);
}

.btn-toggle[aria-expanded="true"]::before {
	transform: rotate(90deg);
}

.btn-toggle-nav a {
	display: inline-flex;
	padding: .1875rem .5rem;
	margin-top: .125rem;
	margin-left: 1.25rem;
	text-decoration: none;
}

.btn-toggle-nav a:hover, .btn-toggle-nav a:focus {
	background-color: #d2f4ea;
}

.scrollarea {
	overflow-y: auto;
}

.fw-semibold {
	font-weight: 600;
}

.lh-tight {
	line-height: 1.25;
}

/*** 관리자 메인 영역 ***/
.main-Wrapper>div:nth-child(1) {
	width: 15%;
	float: left;
}

.main-Wrapper>div:nth-child(2) {
	width: 85%;
	float: left;
}

.cls-main {
	padding-left: 20px !important;
}
</style>
</head>
<body>
	<div class="flex-shrink-0 p-3 bg-white py-0" style="width: 280px;">
		<a href="#"
			class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
			<svg class="bi me-2" width="30" height="24">
					<use xlink:href="#bootstrap" /></svg> <span class="fs-5 fw-semibold">Admin
				page</span>
		</a>
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a
						href="${pageContext.request.contextPath}/admin/toAdminMain"
						class="link-dark rounded">HOME</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toMemberManagement"
						class="link-dark rounded">회원 관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toPostManagement"
						class="link-dark rounded">게시글 관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toReportManagement"
						class="link-dark rounded">신고 관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toProductManagement"
						class="link-dark rounded">상품 관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toOrderManagement"
						class="link-dark rounded">주문 관리</a></li>
				</ul>
			</li>
			<li class="border-top my-3"></li>
			<%-- <li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed"
					data-bs-toggle="collapse" data-bs-target="#account-collapse"
					aria-expanded="false">menu</button>
				<div class="collapse" id="account-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="#" class="link-dark rounded">메뉴1</a></li>
						<li><a href="#" class="link-dark rounded">메뉴2</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/toLab" class="link-dark rounded">메뉴3</a></li>
						<li><a href="#" class="link-dark rounded">쓸데가없네</a></li>
					</ul>
				</div>
			</li> --%>
		</ul>
	</div>
</body>
</html>