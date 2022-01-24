<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/orderManagement.css">
<title>주문 관리</title>
<style>
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
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
							<option value="1">주문번호</option>
							<option value="2">구매자</option>
							<option value="3">주문금액</option>
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

			<!-- 주문정보 출력 -->
			<form id="selectCheckbox" method="post"
				class="d-flex justify-content-center">
				<table class="table table-condensed table-striped">
					<thead>
						<!-- depth 0 -->
						<tr>
							<th><input type="checkbox" class="orderCheckBoxAll"
									name="orderCheckBoxAll" id="orderCheckBoxAll"></th>
							<th>주문 번호</th>
							<th>구매자</th>
							<th>요청 사항</th>
							<th>주문 금액</th>
							<th>주문 상태</th>
							<th>결제 번호</th>
							<th>주문 일자</th>
						</tr>
					</thead>
					<tbody>
						<tr data-bs-toggle="collapse" data-bs-target="#demo1"
							class="accordion-toggle orderRow">
							<td><input type="checkbox" class="orderCheckBox"
									name="orderCheckBox" id="orderCheckBoxAll"></td>
							<td>10305</td>
							<td>구매자 닉네임</td>
							<td>빠른 배송 원함</td>
							<td>10,000,000원</td>
							<td>성공</td>
							<td>TESTNUM124185</td>
							<td>2022-01-23</td>
						</tr>
						<!-- depth 1 -->
						<tr>
							<td colspan="12" class="hiddenRow">
								<div class="accordian-body collapse" id="demo1">
									<table class="table">
										<thead>
											<tr class="info">
												<th colspan="2"></th>
												<th>상품번호</th>
												<th>상품명</th>
												<th>가격</th>
												<th>수량</th>
											</tr>
										</thead>
										<tbody>
											<tr data-bs-toggle="collapse"
												class="accordion-toggle childTd" data-bs-target="#demo10">
												<td colspan="2"></td>
												<td>1060</td>
												<td>두더지</td>
												<td>10,000,000</td>
												<td>7</td>
											</tr>
											<!-- depth 2 -->
											<!-- <tr>
                                                <td colspan="12" class="hiddenRow">
                                                    <div class="accordian-body collapse" id="demo10">
                                                        <table class="table table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <td><a href="#">-</a></td>
                                                                    <td>-</td>
                                                                    <td>-</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>item 1</th>
                                                                    <th>item 2</th>
                                                                    <th>item 3</th>
                                                                    <th>item 4</th>
                                                                    <th>item 5</th>
                                                                    <th>Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>item 1</td>
                                                                    <td>item 2</td>
                                                                    <td>item 3</td>
                                                                    <td>item 4</td>
                                                                    <td>item 5</td>
                                                                    <td><a href="#" class="btn btn-default btn-sm">
                                                                            <i class="glyphicon glyphicon-cog"></i>
                                                                        </a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </td>
                                            </tr> -->
											<!-- depth 1 -->
											<tr>
												<td colspan="2"></td>
												<td>3080</td>
												<td>MSFT</td>
												<td>300$</td>
												<td>10</td>
											</tr>

										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<!-- one row finish -->

						<tr data-bs-toggle="collapse" data-bs-target="#demo2"
							class="accordion-toggle orderRow">
							<td><input type="checkbox" class="orderCheckBox"
									name="orderCheckBox" id="orderCheckBox"></td>
							<td>10305</td>
							<td>구매자 닉네임</td>
							<td>빠른 배송 원함</td>
							<td>10,000,000원</td>
							<td>성공</td>
							<td>TESTNUM124185</td>
							<td>2022-01-23</td>
						</tr>
						<!-- depth 1 -->
						<tr>
							<td colspan="12" class="hiddenRow">
								<div class="accordian-body collapse" id="demo2">
									<table class="table">
										<thead>
											<tr class="info">
												<th>상품명</th>
												<th>가격</th>
												<th>수량</th>
											</tr>
										</thead>
										<tbody>
											<tr data-bs-toggle="collapse" class="accordion-toggle"
												data-bs-target="#demo10">
												<td><a href="#">CHILD TD</a></td>
												<td>CHILD TD</td>
												<td>CHILD TD</td>
											</tr>
											<!-- depth 2 -->
											<!-- <tr>
                                                <td colspan="12" class="hiddenRow">
                                                    <div class="accordian-body collapse" id="demo10">
                                                        <table class="table table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <td><a href="#">-</a></td>
                                                                    <td>-</td>
                                                                    <td>-</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>item 1</th>
                                                                    <th>item 2</th>
                                                                    <th>item 3</th>
                                                                    <th>item 4</th>
                                                                    <th>item 5</th>
                                                                    <th>Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>item 1</td>
                                                                    <td>item 2</td>
                                                                    <td>item 3</td>
                                                                    <td>item 4</td>
                                                                    <td>item 5</td>
                                                                    <td><a href="#" class="btn btn-default btn-sm">
                                                                            <i class="glyphicon glyphicon-cog"></i>
                                                                        </a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </td>
                                            </tr> -->
											<!-- depth 1 -->
											<tr>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
											</tr>

										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<!-- one row finish -->
					</tbody>
				</table>
			</form>
		</div>
	</div>

	<script>

        </script>
</body>

</html>