<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>SignUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        *{margin: 0;}
        body{
            background-color: lightgray;
        }
        .container{
            background-color: white;
            margin-top:20px;
            border-radius: 10px;
            width:900px;
            padding:80px;
        }
        .photoBox>div{
            text-align: center;
        }
        img{
            width:300px;
            height: 300px;;
        }
        .btnBox>div{
            text-align: center;
        }
        #submitBtn{
            float: right;
        }
        #backBtn{
            float: left;
        }
    </style>
</head>
<body>
	<form>
    <div class="container">
        <div class="row mb-3 photoBox">
            <div class="col">
               <img src="/resources/img/logo.png"> 
            </div>
        </div>
        <div class="row mb-2">
            <div class="col">
                <label> 아이디(regex조건 입력)</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="user_id" name="user_id">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-dark">중복검사</button>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col">
                <label> 비밀번호(regex조건 입력)</label>
            </div>
        </div>
        <div class="row mb-1">
            <div class="col-10">
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력">
            </div>
        </div>
        <div class="row">
            <div class="col-10">
                <input type="password" class="form-control" id="checkPw" placeholder="비밀번호 확인">
            </div>
        </div>
        <!-- 비밀번호 일치시 초록글씨, 불일치시 빨간글씨-->
        <div class="row mb-2">
            <div class="col">
                <span>비밀번호 일치 확인창</span>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col">
                <label> 닉네임(OO글자 이내)</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="nickname" name="nickname">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-dark">중복검사</button>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col">
                <label> 이메일</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-10">
                <input type="text" class="form-control" id="email" name="email">
            </div>
            <div class="col-2">
                <button type="button" class="btn btn-dark">중복검사</button>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col">
                <label> 휴대전화</label>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-4">
                <select class="form-select" aria-label="Default select example" id="phone1" name="phone1" required>
                    <option selected>010</option>
                    <option value="1">011</option>
                    <option value="2">016</option>
                    <option value="2">017</option>
                    <option value="3">018</option>
                </select>
            </div>
            <div class="col-3">
                <input type="text" class="form-control" id="phone2" name="phone2" maxlength="4">
            </div>
            <div class="col-3">
                <input type="text" class="form-control" id="phone3" name="phone3" maxlength="4">
            </div>
        </div>
        <!--휴대전화번호 병합하여 저장할 곳( 회원가입 버튼 클릭시 이곳으로 phone1+phone2+phon3 value값 더해서 입력할것)-->
        <div class="d-none">
            <input type="text" id="phone" name="phone">
        </div>


        <div class="row mb-2">
            <div class="col">
                <label> 주소</label>
            </div>
        </div>
         <!--주소 영역-->
         <div class="row" id="daum-postcode">
            <div class="col-12 col-md-6 my-2">
                <input type="text" class="form-control" id="sample4_postcode" name="postcode" placeholder="우편번호"
                    readonly>
            </div>
            <div class="col-12 col-md-6 my-2">
                <div id="wrap-findPostcode"><input type="button" onclick="sample4_execDaumPostcode()"
                        value="우편번호 찾기" class="btn btn-dark btnPost"></div>
            </div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_roadAddress"
                    name="roadAddress" placeholder="도로명주소" readonly></div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_jibunAddress"
                    placeholder="지번주소" readonly></div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_detailAddress"
                    name="detailAddress" placeholder="상세주소"></div>
            <div class="col-12 col-md-6 my-2"><input type="text" class="form-control" id="sample4_extraAddress"
                    name="extraAddress" placeholder="참고항목" readonly></div>
            <!--주소 병합하여 저장할 곳-->
            <div class="col-12 d-none">
                <input type="text" id="user_address" name="user_address">
            </div>
        </div>

        <!--버튼 영역-->
        <div class="row my-5 btnBox">
            <div class="col-6">
                <button type="submit" class="btn btn-dark btn-lg clsBtn" type="button" id="submitBtn">가입 완료</button>
            </div>
            <div class="col-6">
                <button type="button" class="btn btn-secondary btn-lg clsBtn" type="button" id="backBtn">뒤로 가기</button>
            </div>
        </div>
    </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>

    $("#backBtn").click(function(){
    	location.href="${pageContext.request.contextPath}/toLogin.do"
    })
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