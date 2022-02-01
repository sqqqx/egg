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
				action="${pageContext.request.contextPath}/admin/getOrderList.do?currentIdx=1"
				method="post" class="d-flex justify-content-center">
				<div class="row searchArea">
					<div class="col-3 d-flex justify-content-end">
						<select class="form-select" aria-label="Default select example"
							name="searchOption">
							<option value="order_no"
								${searchOption == "order_no" ? 'selected="selected"' : ''}>주문번호</option>
							<option value="user_id"
								${searchOption == "user_id" ? 'selected="selected"' : ''}>구매자</option>
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
				<div class="row tableWrapper">
					<table class="table table-condensed table-striped">
						<thead>
							<!-- depth 0 -->
							<th><input type="checkbox" class="orderCheckBoxAll"
								name="orderCheckBoxAll" id="orderCheckBoxAll"></th>
							<th>주문 번호</th>
							<th>구매자</th>
							<th>요청 사항</th>
							<th>주문 금액</th>
							<th>주문 상태</th>
							<th>결제 번호</th>
							<th>주문 일자</th>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="8">주문 목록이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="map">
										<tr data-bs-toggle="collapse"
											data-bs-target="#id_${map.ORDER_NO}"
											class="accordion-toggle orderRow" id="${map.ORDER_NO}">
											<td><input type="checkbox" value="${map.ORDER_NO}"
												class="orderCheckBox" name="orderCheckBox"
												id="orderCheckBox"></td>
											<td>${map.ORDER_NO}</td>
											<td>${map.USER_ID}</td>
											<td>${map.MESSAGE}</td>
											<td>${map.AMOUNT}</td>
											<td>${map.STATUS}</td>
											<td>${map.PAYMENT_NO}</td>
											<td>${map.PAYMENT_TIME}</td>
										</tr>
										<!-- depth 1 -->
										<tr>
											<td colspan="8" class="hiddenRow">
												<div class="accordian-body collapse" id="id_${map.ORDER_NO}">
													<table class="table">
														<thead>
															<tr class="info">
																<th>상품번호</th>
																<th>상품명</th>
																<th>가격</th>
																<th>수량</th>
															</tr>
														</thead>
														<tbody id="tblBody">
														</tbody>
													</table>
												</div>
											</td>
										</tr>
										<!-- one row finish -->
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</form>

			<!-- 페이징 영역 -->
			<div class="row">
				<div class="col-12 d-flex justify-content-center pt-5">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${map.needPrev eq true}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getOrderList.do?currentIdx=${map.firstIdx-1}">Previous</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
								<c:choose>
									<c:when test="${empty searchOption}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getOrderList.do?currentIdx=${i}">${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getOrderList.do?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getOrderList.do?currentIdx=${map.lastIdx+1}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>

			<!-- 하단 버튼 영역 -->
			<div class="row">
				<div class="col-12 d-flex justify-content-end px-0">
					<button type="button" class="btn btn-outline-dark" id="refundBtn">주문
						취소</button>
				</div>
			</div>

		</div>
	</div>

	<script>
		// 전체 체크박스 ON / OFF
	    $("#orderCheckBoxAll").on("click", function () {
	        if ($("#orderCheckBoxAll").is(":checked")) {
	            $("input[name=orderCheckBox]").prop("checked", true);
	            return;
	        }
	        $("input[name=orderCheckBox]").prop("checked", false);
	    });
	 	// 검색
	    $("#searchForm").on("submit");
		// 상품 목록 가져오기 (닫힐 때 request막기 & setTimeout걸어놓을 것 & checkbox는 선택ㄴㄴ)
		$(".orderRow").on("click", function(e) {
			$("#tblBody").empty(); 
			let order_no = parseInt($(this).attr("id"));
			$.ajax({
				url: "/admin/getProductList.do",
				data: {order_no : order_no}
			}).done(function(list){
				for(let map of list) {
					const tr = $('<tr>');
					tr.append($("<td>" + map.PRODUCT_NO + "</td>"));
					tr.append($("<td>" + map.NAME + "</td>"));
					tr.append($("<td>" + map.PRICE + "</td>"));
					tr.append($("<td>" + map.QUANTITY + "</td>"));
					$("#tblBody").append(tr);
				}
			}).fail(function(e){
				console.log(e);
			});
		});
		// 결제 취소 버튼
		$("#refundBtn").on("click", function() {
			const checkBox = $("input:checkbox[name=orderCheckBox]:checked");
        	if($("#orderCheckBox").is(":checked") && checkBox.length == 1) {
        		const order_no = checkBox.parents("tr").children().eq(1).html();
        		const payment_no = checkBox.parents("tr").children().eq(6).html();
        		const cost = checkBox.parents("tr").children().eq(4).html();
        		if(confirm("주문을 취소하겠습니까?")) {
        			if(checkOrder(payment_no)) {
        				cancelPay(payment_no, cost, order_no);	
        				return;
        			}
        			alert("주문에 실패했거나, 이미 취소 된 결제입니다.");
        		}
                return;
            }
        	if(checkBox.length == 0) {
        		alert("한 개 이상의 주문을 선택해주세요.");
        		return;
        	}
        	alert("하나의 주문만 선택해주세요.");
		});
		// 주문 상태 확인
		function checkOrder(payment_no) {
			let bl = false;
			$.ajax({
				url: "/admin/checkOrder.do",
				type: "post",
				async: false,
				data: {
					payment_no: payment_no
				}
			}).done(function(rs) {
				console.log(rs);
				if(rs == "success") {
					bl = true;
				}
			}).fail(function(e) {
				console.log(e);
			});
			console.log("bl : " + bl);
			return bl;
		}
		// 결제 취소 process
		function cancelPay(payment_no, cost, order_no) {
			console.log(payment_no + " : " + cost + " : " + order_no);
			$.ajax({
				url: "/admin/canclePay.do",
				type: "post",
				data: {
					payment_no: payment_no,
					cost: cost,
					reason: "",
					order_no: order_no
				}
			}).done(function(rs) {
				console.log(rs);
				if(rs == "success") {
					alert("결제 취소에 성공했습니다.");
					location.href = "${pageContext.request.contextPath}/admin/toOrderManagement";
					return;
				}
				alert("결제 취소에 실패했습니다.");
			}).fail(function(e) {
				console.log(e);
			});
		}
    </script>
</body>

</html>