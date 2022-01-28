<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
<style>
	body{width:1400px; margin:auto;}
	h2,h1{text-align:center}
	#title{height:100px; vertical-align: middle}
	#message{width:100%;}
	.inputColor{background-color: #f0f2ed}
	#priceBox{height:80px;}
	#btnBox{text-align:center;}
	#phone1,#phone2,#phone3,#phone11,#phone22,#phone33{
	float:left;
	width:33.3%;
	}
</style>
</head>
<body>
<!-- name, phone, email, address, user_id, amount 넘어감 -->
<form action ="${pageContext.request.contextPath}/" id="paymentForm" method="post">
<table class="table">
<input type="text" name="user_id" value="${loginSession.user_id }" hidden>
		<h1>주문/결제</h1>
		<thead>
			<tr>
				<th width="90">상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:set var="ttotal" value="0"/>
			<c:set var="total" value="0"/>
			<c:forEach items="${cartList}" var="dto">
				<tr>
					<td><input type="text" value="${dto.NAME}" disabled></td>
					<td>${dto.PRICE}</td>
					<td>${dto.QUANTITY}</td>
					<td hidden><input type="text" name="amount" id="amount" value="${dto.QUANTITY }"></td>
					<td>
						<c:set var="total" value="${dto.PRICE * dto.QUANTITY }"/>
						<c:set var="ttotal" value="${ttotal+total}"/>
						<c:out value="${total }"/>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="3"><b>총 가격</b></td>
					<td colspan="1"><c:out value="${ttotal }"/></td>
				</tr>
				
				<!-- 주문자 정보칸 -->
				<tr>
					<td colspan="4" id="title"><h4><b>주문자 정보</b></h4></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="3">${loginSession.user_nickname }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="3"><input type="text" class="form-control" value="${loginSession.email }"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td colspan="3">
						<select class="form-select" aria-label="Default select example" class="phoneBox" id="phone1" required>
		                    <option selected>010</option>
		                    <option value="1">011</option>
		                    <option value="2">016</option>
		                    <option value="2">017</option>
		                    <option value="3">018</option>
		                </select>
		                <input type="text" class="form-control" id="phone2" maxlength="4">
		                <input type="text" class="form-control" id="phone3" maxlength="4">
					</td>
				</tr>
				
				<!-- 배송정보칸 -->
				<tr>
					<td colspan="4" id="title"><h4><b>배송 정보</b></h4></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="checkbox" id="selectInfo">위 정보와 같음
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="3"><input type="text" class="form-control" id="name" name="name"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="3">
						<select class="form-select" aria-label="Default select example" id="phone11" required>
		                    <option selected>010</option>
		                    <option value="1">011</option>
		                    <option value="2">016</option>
		                    <option value="2">017</option>
		                    <option value="3">018</option>
		                </select>
		                <input type="text" class="form-control" id="phone22" maxlength="4">
		                <input type="text" class="form-control" id="phone33" maxlength="4">
		                <input type="text" id="phone" name="phone" hidden>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="3"><input type="text" class="form-control" id="email" name="email"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="3">
						<div class="row" id="daum-postcode">
				            <div class="col-12 col-md-6 my-2">
				                <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호"
				                    readonly>
				            </div>
				            <div class="col-12 col-md-6 my-2">
				                <div id="wrap-findPostcode"><input type="button" onclick="sample4_execDaumPostcode()"
				                        value="우편번호 찾기" class="btn btn-dark btnPost"></div>
				            </div>
				            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_roadAddress"
				                     placeholder="도로명주소" readonly></div>
				            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_jibunAddress"
				                    placeholder="지번주소" readonly></div>
				            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_detailAddress"
				                     placeholder="상세주소"></div>
				            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_extraAddress"
				                     placeholder="참고항목" readonly></div>
				            <!--주소 병합하여 저장할 곳-->
				            <div class="col-12 d-none">
				                <input type="text" id="user_address" name="address">
				            </div>
				        </div>
					</td>
				</tr>
				<tr>
					<td>배송메세지(100자 내외)</td>
					<td colspan="3"><textarea id="message" name="message"></textarea></td>
				</tr>
		</tbody>
		<tfoot>
				<tr class="inputColor">
					<td id="priceBox"><h4>최종 결제금액</h4></td>
					<td colspan="3"><h4><c:out value="${ttotal }"/>원</h4>
				</tr>
				<tr>
					<td colspan="4" id="btnBox">
					<button type="button" class="btn btn-dark" id="toPayment">주문하기</button>
					<button type="button" class="btn btn-light">취소</button>
					</td>
				</tr>
		</tfoot>
</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//핸드폰 값 분할해서 찢어줌
let phone = "${loginSession.phone}"
console.log(phone);
document.getElementById("phone2").value = phone.substring(3,7);
document.getElementById("phone3").value = phone.substring(3,7);
$("#phone3").value = phone.substring(7);


$("#selectInfo").click(function(){
	let nn = '${loginSession.user_nickname}'
	let email = '${loginSession.email}'
	let phone = '${loginSession.phone}'
	if($(this).is(':checked')){
		$("#name").val(nn)
		$("#email").val(email)
		document.getElementById("phone22").value = phone.substring(3,7);
		document.getElementById("phone33").value = phone.substring(3,7);
	}else{
		$("#name").val("")
		$("#email").val("")
		$("#phone22").val("")
		$("#phone33").val("")
	}
	})

	
	
	
	//regex 처리 
	let postcode = document.getElementById("sample4_postcode"); // 우편번호
	let roadAddr = document.getElementById("sample4_roadAddress"); // 도로명주소
	let name = document.getElementById("name");//이름
	let phone1 = document.getElementById("phone11") // 번호 첫번째 영역
	let phone2 = document.getElementById("phone22"); // 번호 중간 영역
	let phone3 = document.getElementById("phone33"); // 번호 뒷자리 영역
	let email = document.getElementById("email");

function regexName(){//이름 regex
	let regexName = /^[가-힣]{2,5}$/;
	return regexName.test(name.value);
}
	
function regexPhone() {
	let regexPhone2 = /[0-9]{4,4}/;
	let regexPhone3 = /[0-9]{4,4}/;
	// 휴대전화 번호 중간 영역, 마지막 영역 모두 정규식 통과했을 경우
	if (regexPhone2.test(phone2.value) && regexPhone3.test(phone3.value)) {
		return true;
	} else {
		return false;
	}
}

function regexEmail(){
	let regexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	return regexEmail.test(email.value);
}


$("#toPayment").click(function(){

	
	if(!regexName()||name.value==""){
		alert("이름을 정확히 입력해주세요.");
		return;
	}else if(!regexPhone()||phone2 == ""||phone3==""){
		alert("핸드폰 번호를 정확히 입력해주세요.");
		return;
	}else if(!regexEmail()||email == ""){
		alert("이메일을 정확히 입력해주세요.");
		return;
	}else if(postcode.value == ""){
		alert("주소를 입력해주세요.");
		return;
	}else{
		document.getElementById("phone").value = phone1.value + phone2.value + phone3.value;
		console.log("제출성공");
		//document.getElementById("paymentForm").submit();
	}
	
})
</script>


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