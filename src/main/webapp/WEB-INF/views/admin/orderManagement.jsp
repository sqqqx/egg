<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/orderManagement.css">
<title>주문 관리</title>
<style>
	.address_input {
		border-left: none !important;
		border-top: none !important;
		border-right: none !important;
		box-shadow: none !important;
		border-radius: 0 !important;
	}
	#wrap-findPostcode {
		width: 100%;
	}
	#addrTitle {
		text-align: center;
	}
</style>
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
							placeholder="" value="${searchKeyword}">
					</div>
					<div class="col-3 d-flex justify-content-start">
						<button type="submit" class="btn btn-outline-dark" id="adminSearchBtn">검색</button>
					</div>
				</div>
			</form>

			<!-- 주문정보 출력 -->
			<form id="selectCheckbox" method="post"
				class="d-flex justify-content-center">
				<div class="row tableWrapper py-3">
					<table class="table table-condensed table-striped">
						<thead>
							<!-- depth 0 -->
							<!-- <th><input type="checkbox" class="orderCheckBoxAll"
								name="orderCheckBoxAll" id="orderCheckBoxAll"></th> -->
							<th>주문 번호</th>
							<th>주문 금액</th>
							<th>구매자</th>
							<th>주문 상태</th>
							<th>주문 일자</th>
							<th></th>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="6">주문 목록이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="map">
										<tr class="cls-tr">
											<%-- <td><input type="checkbox" value="${map.ORDER_NO}"
												class="orderCheckBox" name="orderCheckBox"
												id="orderCheckBox"></td> --%>
											<td>${map.ORDER_NO}</td>
											<td>₩ ${map.COST}</td>
											<td>${map.USER_ID}</td>
											<td>${map.STATUS}</td>
											<td>${map.ORDER_TIME}</td>
											<td style="width: 25%">
												<button type="button" class="btn btn-outline-dark orderDetailView" id="${map.ORDER_NO}">상세 정보</button>
												<button type="button" class="btn btn-outline-dark changeAddress" id="${map.ORDER_NO}" addr="${map.ADDRESS}">배송지 변경</button>
												<button type="button" class="btn btn-outline-dark orderCancel" id="${map.ORDER_NO}" pno="${map.ORDER_NO}" cost="${map.COST}">주문 취소</button>
											</td>
										</tr>
										<!-- depth 1 -->
										<%-- <tr>
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
										</tr> --%>
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
			<!-- <div class="row">
				<div class="col-12 d-flex justify-content-end px-0">
					<button type="button" class="btn btn-outline-dark" id="refundBtn">주문
						취소</button>
				</div>
			</div> -->
			
			<!-- modal -->
			<div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <!-- <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenteredScrollableTitle">Modal title</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div> -->
			      <div class="modal-body">
			      	<div class="row">
			        	<div class="col-12" id="addrTitle">
			        		<span>배송지 변경</span>
			        	</div>
			        </div>
			        <hr class="mb-4">
		      		<div class="row">
			        	<div class="col">
			        		<div class="mb-3">
							  <input type="text" class="form-control address_input" id="sample4_postcode" placeholder="우편번호" readonly>
							</div>
			        	</div>
			        </div>
			        <div class="row">
			        	<div class="col">
			        		<div class="mb-3">
							  <input type="text" class="form-control address_input" id="sample4_roadAddress" placeholder="도로명 주소" readonly>
							</div>
			        	</div>
			        </div>
			        <div class="row">
			        	<div class="col">
			        		<div class="mb-3">
							  <input type="text" class="form-control address_input" id="sample4_jibunAddress" placeholder="지번 주소" readonly>
							</div>
			        	</div>
			        </div>
			        <div class="row">
			        	<div class="col">
			        		<div class="mb-3">
							  <input type="text" class="form-control address_input" id="sample4_extraAddress" placeholder="참고 항목" readonly>
							</div>
			        	</div>
			        </div>
			        <div class="row">
			        	<div class="col">
			        		<div class="mb-3">
							  <input type="text" class="form-control address_input" id="sample4_detailAddress" placeholder="상세 주소">
							</div>
			        	</div>
			        </div>
			        <div class="row">
			        	<div class="col-12">
			        		<div id="wrap-findPostcode"><input type="button" onclick="sample4_execDaumPostcode()"
				                        value="우편번호 찾기" class="btn btn-dark btnPost" style="width: 100%"></div>
			        	</div>
			        	<div class="col-12 pt-2">
			        		<button type="button" class="btn btn-success" id="btnSubmit" onclick="checkAddress()" style="width: 100%">배송지 변경</button>
			        	</div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			
		</div>
	</div>

	<script>
		// 배송지 변경
		let order_no = "";
		$(".changeAddress").on("click", function(e) {
			const status = $(e.target).parents(".cls-tr").children().eq(3).html();
			if(status == "canceled") {
				alert("이미 취소 된 주문입니다");
				return;
			}
			/* $(".address_input").val("");
			const address = $(e.target).attr("addr");
			const post = address.match(/[0-9]{5}/)[0];
			const roadAddr = address.match(/[ㄱ-힣](.*?)(로|길).[1-9]{1,2}/)[0];
			let jibunAddr = address.match(/[0-9]{5}.*[ㄱ-힣](.*?)(로|길).[1-9]{1,2}\s/)[0];
			console.log(jibunAddr);
			jibunAddr = address.replace(jibunAddr, "");
			jibunAddr = jibunAddr.match(/[ㄱ-힣](.*?)[1-9]+(.+)[1-9]/)[0];
			const extraAddr = address.match(/\(([^)]+).\)/)[0];
			let detailAddr = address.replace(post, "");
			detailAddr = detailAddr.replace(roadAddr, "");
			detailAddr = detailAddr.replace(jibunAddr, "");
			detailAddr = detailAddr.replace(extraAddr, "");
			detailAddr = detailAddr.trim();
			
			$("#sample4_postcode").val(post);
			$("#sample4_roadAddress").val(roadAddr);
			$("#sample4_jibunAddress").val(jibunAddr);
			$("#sample4_extraAddress").val(extraAddr);
			$("#sample4_detailAddress").val(detailAddr); */
			
			order_no = e.target.id;
			$('#exampleModalCenteredScrollable').modal('toggle');
		});
		// 배송지 변경 확인 & 제출
		function checkAddress() {
			const input = document.querySelectorAll(".address_input");
			let address = "";
			for(let item of input) {
				if(item.value == "") {
					alert("빈 칸을 모두 입력해주세요.");
					return;
				}
				address += item.value + " ";
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/changeAddress.do",
				type: "post",
				data: {
					address: address,
					order_no: order_no
				}
			}).done(function(rs){
				console.log(rs);
				if(rs == "success") {
					alert("배송지 변경에 성공했습니다.");
					$('#exampleModalCenteredScrollable').modal('toggle');
					return;
				}
				alert("배송지 변경에 실패했습니다.");
				$('#exampleModalCenteredScrollable').modal('toggle');
			}).fail(function(e){
				console.log(e);
			});
		}
		// 주문 상세 정보
		$(".orderDetailView").on("click", function(e) {
     		const order_no = e.target.id;
     		const rs = order_no.indexOf("POINT");
     		if(rs == 0) {
     			alert("포인트 결제는 조회가 불가합니다.");
     			return;
     		}
			window.open("${pageContext.request.contextPath}/admin/orderDetailView?order_no="+order_no, "orderDetailView", "width=400,height=800");
		});
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
		/* $(".orderRow").on("click", function(e) {
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
		}); */
		// 결제 취소 버튼
		/* $("#refundBtn").on("click", function() {
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
		}); */
		// 결제 취소 (NEW)
		$(".orderCancel").on("click", function(e) {
			const status = $(e.target).parents(".cls-tr").children().eq(3).html();
			if(status == "canceled") {
				alert("이미 취소 된 주문입니다");
				return;
			}
			const payment_no = $(e.target).attr("pno"); // payment_no와 order_no은 동일(구분을 위한 명시)
			if(confirm("주문을 취소하겠습니까?") && checkOrder(payment_no)) {
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/payment/refund.do",
					data: {merchant_uid: payment_no}
				}).done(function(rs){
					console.log(rs);
					if(rs == "success") {
						alert("주문 취소 성공");
					} else {
						alert("주문 취소 실패");
					}
				}).fail(function(e){
					console.log(e);
					alert("주문 취소 성공");
				});
				location.href = "${pageContext.request.contextPath}/admin/toOrderManagement";
				return;
			} 
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
				if(rs == "ready") {
					bl = true;
				}
			}).fail(function(e) {
				console.log(e);
			});
			console.log("bl : " + bl);
			return bl;
		}
		// 결제 취소 process
		/* function cancelPay(payment_no, cost, order_no) {
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
		} */
    </script>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	// 다음 우편번호 API
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function (data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if (data.buildingName !== '' && data.apartment === 'Y') {
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if (extraRoadAddr !== '') {
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if (roadAddr !== '') {
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }
	            var guideTextBox = document.getElementById("guide");
	        }
	    }).open();
	}
	</script>
</body>

</html>