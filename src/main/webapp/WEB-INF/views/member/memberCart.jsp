<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/userInformation.css">    <!-- 부트스트랩 적용시 부트스트랩 cdn을 가져온 뒤 css를 불러와야 레이아웃에 적용된다.-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보조회</title>
<style>
table td:nth-child(3) {
    display: block;
    height:55.5px;
}
#btnbtn{
	text-align:center;
}
</style>
</head>
<body>
		
	<!-- 회원 정보 조회 -->
    <div class="container-fluid" id="myInfo">
        <div class="row">
        	<!-- 좌측 프로필 부분 -->
            <%@include file="/WEB-INF/views/member/profileSection.jsp" %>
            
            <div class="col-1"></div>
            
            <!-- 우측 회원정보조회 부분 -->
            <div class="col-8" id="userBox">
                <div class="row mt-4" id="title"><p>장바구니</p></div>
                <div class="row">
                	<table class="table">
						<thead>
							<tr>
								<th style="width:40%">상품명</th>
								<th style="width:20%">가격</th>
								<th style="width:10%">수량</th>
								<th style="width:30%"></th>
								
							</tr>
						</thead>
						<tbody>
						<c:set var="ttotal" value="0"/>
							<c:set var="total" value="0"/>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="8">장바구니가 비어있습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="dto">
										<tr>
											<td hidden><input type="text" value="${dto.name}" id="name" disabled></td>
											<td hidden><input type="text" id="stock" value="${dto.stock}"></td>
											<td>${dto.name}</td>
											<td>${dto.price}</td>
											<td><span><input type="number" value="${dto.quantity }" class="form-control quantityController"></span></td>
											<td id="btnbtn"><button type="button" class="btn btn-dark deleteCart" value="${dto.name}">
											삭제
											</button></td>
											<td hidden>
												<c:set var="total" value="${dto.price * dto.quantity}"/>
												<c:set var="ttotal" value="${ttotal+total}"/>
												<c:out value="${total }"/>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>		
						</tbody>
					</table>
					<div class="row mt-3 inputColor">
					<div class="col">
						<h4><label>총 가격</label></h4>
					</div>
					</div>
					<div class="row inputColor">
					<div class="col">
						<h4><c:out value="${ttotal }"/>원</h4>
					</div>
					</div>
					<div class="row mt-5" id="btnBox">
						<button type="button" class="btn btn-dark" id="toOrder">구매</button>
					</div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	$(".deleteCart").click(function(e){
		let name = e.target.value;
		let id = '${loginSession.user_id}';
		console.log(name);
		console.log(id);
		location.href= "${pageContext.request.contextPath}/cart/deleteCartForMe.do?name="+name+"&user_id="+id;  
	})
	
	
	$(".quantityController").blur(function(e){
		let quantity = e.target.value;
		let id = '${loginSession.user_id}';
		let thisRow = $(this).closest('tr');
		let name = thisRow.find('td:eq(0)').find('input').val();
		let stock = thisRow.find('td:eq(1)').find('input').val();	
		
		function Regex(){
			const Regex = /[0-9]/;
			if(Regex.test(quantity)){
				return true;
			}else{
				return false;
			}
		}
		
		if(!Regex() || quantity=="" || quantity<=0){
			alert("올바른 숫자를 입력해주세요.")
			$(this).val("1");
		}else{
			console.log(quantity)
			console.log(stock)
			if(parseInt(quantity)<=parseInt(stock)){
				$.ajax({
					url:"${pageContext.request.contextPath}/cart/updateQuantity.do?quantity="+quantity+"&name=" + name,
					post:"get"
				}).done(function(data){
					if(data == "success"){
						location.href="${pageContext.request.contextPath}/cart/selectCart.do?user_id="+id;	
					}
				}).fail(function(e){
					console.log(e);
				})
			}else{
				alert("재고("+stock+")가 부족합니다. 수량을 조절해주세요.");
				$(this).val(stock)
			}
		
		}
	})
	
	$("#toOrder").click(function(){

			let id = '${loginSession.user_id}';
			let list='${list}'
			
			if(list != '[]'){
				location.href="${pageContext.request.contextPath}/cart/toOrder.do?user_id="+ id + "&route=cart";
			}else{
				alert("장바구니에 들어있는 상품이 없습니다.")
			}
			//
		
	})
	</script>
</body>
</html>