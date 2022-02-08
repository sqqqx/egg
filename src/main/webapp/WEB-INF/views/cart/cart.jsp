<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	body{margin:auto;}
	h1{text-align:center;}
	.quantityController{width:150px;}
	#btnBox{text-align:center;}
</style>
</head>
<body>
	<table class="table">
		<h1 mt-2>장바구니</h1>
		<thead>
			<tr>
				<th>상품명</th>
				<th>가격</th>
				<th >수량</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:set var="ttotal" value="0"/>
			<c:set var="total" value="0"/>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><input type="text" value="${dto.name}" disabled></td>
					<td hidden><input type="text" id="stock" value="${dto.stock}"></td>
					<td>${dto.price}</td>
					<td><span><input type="number" value="${dto.quantity }" class="form-control quantityController"></span></td>
					<td><button type="button" class="deleteCart" value="${dto.name}">장바구니삭제</button></td>
					<td hidden>
						<c:set var="total" value="${dto.price * dto.quantity}"/>
						<c:set var="ttotal" value="${ttotal+total}"/>
						<c:out value="${total }"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row inputColor">
	<div class="col">
		<h4><label>총 가격</label></h4>
	</div>
	</div>
	<div class="row inputColor">
	<div class="col">
		<h4><c:out value="${ttotal }"/></h4>
	</div>
	</div>
	<div id="btnBox">
		<button type="button" class="btn btn-dark" id="toOrder">구매</button>
		<button type="button" class="btn btn-light" id="back">취소</button>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	$(".deleteCart").click(function(e){
		let name = e.target.value;
		let id = '${loginSession.user_id}';
		location.href= "${pageContext.request.contextPath}/cart/deleteCart.do?name="+name+"&user_id="+id;  
	})
	
	$("#back").click(function(){
		location.href="/online/toMain.do"
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
			location.href="${pageContext.request.contextPath}/cart/toOrder.do?user_id="+ id + "&route=cart";
		
	})
	
	
	</script>
</body>
</html>