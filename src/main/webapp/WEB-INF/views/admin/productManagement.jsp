<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/productManagement.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>상품 관리</title>
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
				action="${pageContext.request.contextPath}/admin/getProductsList.do?currentIdx=1"
				method="post" class="d-flex justify-content-center">
				<div class="row searchArea">
					<div class="col-3 d-flex justify-content-end">
						<select class="form-select" aria-label="Default select example"
							name="searchOption">
							<option value="name" ${searchOption == "name" ? 'selected="selected"' : ''}>상품명</option>
							<option value="product_no" ${searchOption == "product_no" ? 'selected="selected"' : ''}>상품번호</option>
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
			
			<!-- 상품 출력 -->
			<form id="selectCheckbox" method="post"
				class="d-flex justify-content-center">
				<div class="row tableWrapper py-3">
					<div class="col-12 px-0">
						<table class="table table-striped table-hover">
							<thead>
								<th><input type="checkbox" class="productCheckBoxAll"
									id="productCheckBoxAll" name="productCheckBoxAll"></th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>상품가격</th>
								<th>재고량</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="5">상품 내역이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="map">
											<tr>
												<td><input type="checkbox" value="${map.PRODUCT_NO}"
													class="productCheckBox" id="productCheckBox"
													name="productCheckBox"></td>
												<td class="toProductDetail">${map.PRODUCT_NO}</td>
												<td class="toProductDetail">${map.NAME}</td>
												<td class="toProductDetail">₩ ${map.PRICE}</td>
												<td class="toProductDetail">${map.STOCK}</td>
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
									href="${pageContext.request.contextPath}/admin/getProductsList.do?currentIdx=${map.firstIdx-1}">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.firstIdx}" end="${map.lastIdx}">
								<c:choose>
									<c:when test="${empty searchOption}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getProductsList.do?currentIdx=${i}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/getProductsList.do?currentIdx=${i}&searchOption=${searchOption}&searchKeyword=${searchKeyword}&key=y">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getProductsList.do?currentIdx=${map.lastIdx+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			
			<!-- 하단 버튼 영역 -->
			<div class="row">
				<div class="col-12 d-flex justify-content-end px-0">
					<button type="button" class="btn btn-outline-dark" id="btnWrite">상품 등록</button>
 					<button type="button" class="btn btn-outline-dark" id="btnModify">상품 수정</button>
					<button type="button" class="btn btn-outline-dark" id="deleteProductbtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<script>
        // 전체 체크박스 ON / OFF
        $("#productCheckBoxAll").on("click", function () {
            if ($("#productCheckBoxAll").is(":checked")) {
                $("input[name=productCheckBox]").prop("checked", true);
                return;
            }
            $("input[name=productCheckBox]").prop("checked", false);
        });
     	// 검색
        $("#searchForm").on("submit");
     	// 상품 상세페이지 이동
     	$(".toProductDetail").on("click", function(e) {
     		let product_no = $(e.target).parent().children().eq(0).children().val();
     		product_no = parseInt(product_no);
     		console.log("p_no : " + product_no);
     		location.href = "${pageContext.request.contextPath}/product/toProductDetail.do?product_no="+product_no;
     	});
     	// 상품 등록
     	$("#btnWrite").on("click", function() {
     		location.href = "${pageContext.request.contextPath}/product/toWrite.do";
     	});
     	// 상품 수정
     	$("#btnModify").on("click", function() {
     		const checkBox = $("input:checkbox[name=productCheckBox]:checked");
           if(checkBox.length == 1) {
        	   const product_no = parseInt(checkBox.val());
        	   location.href = "${pageContext.request.contextPath}/product/toModify.do?product_no="+product_no;
               return;
            }
            if (checkBox.length == 0) {
                alert("한 개 이상의 글을 선택해주세요.");
                return;
            }
            alert("하나의 글만 선택해주세요.");
     	});
     	// 상품 삭제
     	$("#deleteProductbtn").on("click", function() {
     		if ($(".productCheckBox").is(":checked") && confirm("삭제하겠습니까?")) {
                $("#selectCheckbox").attr("action", "${pageContext.request.contextPath}/admin/deleteProduct.do");
                $("#selectCheckbox").submit();
            }
     	});
    </script>
</body>
</html>