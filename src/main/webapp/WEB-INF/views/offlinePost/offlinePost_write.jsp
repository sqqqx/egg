<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <title>Document</title>
    <style>
        @font-face {
            font-family: 'BMHANNAAir';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            width: 1200px;
            font-family: 'BMHANNAAir';
            color: #2b2b2b;

        }

        .category_menu {
            height: 300px;
            text-align: center;
            background-color: #efefef;
        }

        .category_menu_title {
            font-size: 120px;
            margin: 0;
        }

        .category_menu_explain {
            font-size: 25px;
            margin-bottom: 5px;
        }

        form {
            margin-top: 30px;
        }

        .proTitle {
            font-size: 35px;
        }

        .question {
            font-size: 21px;
        }

        .buttons {
            margin-top: 30px;
            font-size: 50px;
            text-align: right;

        }

        .btn {
            font-size: 25px;
        }

        textarea {
            width: 100%;
            height: 150px;
            resize: none;
        }

        #reservation_timeDiv {
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="category_menu">
            <span class="category_menu_title">"${parent_group}"</span><br>
            <span class="category_menu_explain">[당신에게 딱맞는 <strong class="proTitle">"능력자"</strong>를 찾아드리겠습니다!]</span><br>
            <span class="category_menu_explain"><strong>잠깐! 그전에 아래 항목을 작성해 주세요!</strong></span>

        </div>
        <form action="/offlinePost/insertPost.do" method="post" id="writeForm">
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <strong class="question"> 1. 어떤 분야의 도움이 필요하신가요?</strong>
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                        data-bs-parent="#accordionExample" value="1">
                        <div class="accordion-body">
                            <c:forEach var="dto" items="${categoryList}">
                                <input type="radio" name="category_no" class="inputRadio" value="${dto.category_no}">
                                <label for="${dto.category_no}">${dto.child_group}</label><br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <strong class="question"> 2. 어떤 방식으로 진행하기 원하시나요?? </strong>
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse " aria-labelledby="headingTwo"
                        data-bs-parent="#accordionExample" value="2">
                        <div class="accordion-body">
                            <input type="radio" name="method" class="inputRadio" value="제가 있는 곳에서 진행하고 싶습니다."> 제가 있는 곳에서
                            진행하고 싶습니다.<br>
                            <input type="radio" name="method" class="inputRadio" value="카페/스터디룸에서 진행하고 싶습니다."> 카페/스터디룸에서
                            진행하고 싶습니다.<br>
                            <input type="radio" name="method" class="inputRadio" value="능력자분이 있는 곳으로 가겠습니다."> 능력자분이 있는
                            곳으로 가겠습니다.<br>
                            <input type="radio" name="method" class="inputRadio" value="온라인/화상 수업을 원합니다."> 온라인/화상 수업을
                            원합니다.<br>
                            <input type="radio" name="method" class="inputRadio" value="능력자 분과 협의하겠습니다."> 능력자 분과 협의하겠습니다..<br>

                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <strong class="question"> 3. ${loginSession.user_nickname}님의 연령대는 어떻게 되시나요? (본인이 아닌 경우 수강 받는
                                분의 정보를 적어주세요.)</strong>
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                        data-bs-parent="#accordionExample" value="3">
                        <div class="accordion-body">
                            <input type="radio" name="age" class="inputRadio" value="10대 미만"> 10대 미만<br>
                            <input type="radio" name="age" class="inputRadio" value="10대"> 10대<br>
                            <input type="radio" name="age" class="inputRadio" value="20대"> 20대<br>
                            <input type="radio" name="age" class="inputRadio" value="30대"> 30대<br>
                            <input type="radio" name="age" class="inputRadio" value="40대"> 40대<br>
                            <input type="radio" name="age" class="inputRadio" value="50대 이상"> 50대 이상<br>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            <strong class="question"> 4. ${loginSession.user_nickname}님의 성별은 어떻게 되시나요? (본인이 아닌 경우 수강 받는
                                분의 정보를 적어주세요.)</strong>
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                        data-bs-parent="#accordionExample" value="4">
                        <div class="accordion-body">
                            <input type="radio" name="gender" class="inputRadio" value="남"> 남<br>
                            <input type="radio" name="gender" class="inputRadio" value="여"> 여<br>
                            <input type="radio" name="gender" class="inputRadio" value="혼성"> 혼성<br>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            <strong class="question"> 5. 능력자가 필요하신 날짜는 언제인가요?</strong>
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse " aria-labelledby="headingFive"
                        data-bs-parent="#accordionExample" value="5">
                        <div class="accordion-body">
                            <input type="radio" name="class_time" class="inputRadio" value="능력자와 혐의하고 싶습니다."> 능력자와 혐의하고
                            싶습니다.<br>
                            <input type="radio" name="class_time" class="inputRadio" value="가능한 빨리 진행하고 싶습니다."> 가능한 빨리
                            진행하고 싶습니다.<br>
                            <input type="radio" name="class_time" class="inputRadio" value="일주일 이내로 진행하고 싶습니다."> 일주일 이내로
                            진행하고 싶습니다.<br>
                            <input type="radio" name="class_time" class="inputRadio" id="settingTime"
                                value="원하는 날짜가 따로 있어요"> 원하는 날짜가 따로 있어요<br>
                            <div class="reservation_timeDiv" id="reservation_timeDiv" hidden>
                                <input type="date" name="reservation_time" id="datePicker">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingSix">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                            <strong class="question"> 6. 수업과 관련된 희망사항이 있으신가요? </strong>
                        </button>
                    </h2>
                    <div id="collapseSix" class="accordion-collapse collapse " aria-labelledby="headingSix"
                        data-bs-parent="#accordionExample" value="6">
                        <div class="accordion-body">
                            <textarea id="wish" placeholder="희망사항을 구체적으로 적어주세요."></textarea>
                        </div>
                    </div>
                </div>
                <input class="contentInput" id="content" name="content" hidden>
                <input class="titleInput" id="title" name="title" hidden>
                <div class="buttons">
                    <button type="button" class="btn btn-warning" id="submitBtn">1:1 고수 찾기</button>
                    <button type="button" class="btn btn-secondary" id="cancel">취소</button>
                </div>
        </form>
    </div>
    <script>
        // document.getElementById("openBtn").onclick = function () {
        //     // $(".accordion-collapse").collapse('toggle');
        //     $("#collapseSix").collapse('show');
        //     console.log($("input:radio:checked").length);
        // }
        
        //취소 버튼 누르면 이전 페이지로 돌아가기
    $("#cancel").on("click",function(){
    	goBackPage();
    })
    
    //이전 페이지로 돌아가는 함수
    function goBackPage(){
    	window.history.back();
    }
        
        $(document).ready(function () {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0 so need to add 1 to make it 1!
            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("datePicker").setAttribute("min", today);


            $('#wish').on('keyup', function () {
                if ($(this).val().length > 200) {//150자가 넘는 경우
                    $(this).val($(this).val().substring(0, 250)); //150자까지만 잘라서 표기
                    alert("250자 이상 입력하실 수 없습니다.");
                }
            });
        });




        $(".inputRadio").on("click", function () {
            let parent = $(this).parent().parent()[0];
            let number = parent.getAttribute("value");
            if (number != "5") { //시간 선택 항목 검사 필요 (시간 설정 여부)
                openMenu(parseInt(number) + 1);
            } else {
                if ($(this).attr("id") == "settingTime") { // 원하는 시간이 따로 있는 경우 시간표 열어주기
                    $("#reservation_timeDiv")[0].hidden = false; //날짜 선택 보여주기
                    $("#datePicker").on("change", function () { //날짜가 눌리면
                        openMenu(parseInt(number) + 1); //다음 색션으로 넘어가기
                    })
                } else { //시간 설정 필요X 다음 섹션으로 넘어가기
                    $("#datePicker").val(""); //선택된 날짜가 있으면 지우기
                    $("#reservation_timeDiv")[0].hidden = true; //날짜 선택 숨기기
                    openMenu(parseInt(number) + 1); //다음 색션 열기
                }
            }
            //다음 메뉴를 연다.
        })

        function openMenu(number) { //number에 해당하는 메뉴바를 연다
            $("div[value='" + number + "']").collapse('show');
        }

        $("#submitBtn").on("click", function () {

            if (!$('input:radio[name=category_no]').is(':checked')) {
                alert("능력 분야를 선택해 주세요.");
                $("#collapseOne").collapse('show');
                return;
            } else if (!$('input:radio[name=method]').is(':checked')) {
                alert("원하시는 학습 방법을 선택해 주세요.");
                $("#collapseTwo").collapse('show');
                return;
            } else if (!$('input:radio[name=age]').is(':checked')) {
                alert("${loginSession.user_nickname}님의 나이를 선택해 주세요.");
                $("#collapseThree").collapse('show');
                return;
            } else if (!$('input:radio[name=gender]').is(':checked')) {
                alert("${loginSession.user_nickname}의 성별을 선택해 주세요.");
                $("#collapseFour").collapse('show');
                return;
            } else if (!$('input:radio[name=class_time]').is(':checked')) {
                alert("수업 희망 시기를 선택해 주세요.");
                $("#collapseFive").collapse('show');
                return;
            } else if ($('input[name="class_time"]:checked').val() == "원하는 날짜가 따로 있어요" && $("#datePicker").val() == "") {
                //원하는 날짜가 있는데 선택이 안되어 있는 경우!
                alert("날짜를 선택해 주세요.");
                $("#collapseFive").collapse('show');
                return;
            } else if ($("#wish").val() == "") {
                if (!confirm("희망사항을 적지 않았습니다. 이대로 진행하시겠습니까?")) {
                    $("#collapseSix").collapse('show');
                    return
                } else {
                    submitForm();
                }
            } else {//모든 것이 다 적혀있는 경우
                submitForm();

            }
        })


        function submitForm() { //제목과 내용 형식 맞추기
        	var id = '${loginSession.user_id}'
            //1.title값 설정 
            //title을 "JAVA(소제목)에 관한 요청입니다" 형식으로 맞출 예정;
            var category_no = $('input[name="category_no"]:checked').val(); //선택된 값의 category_no
            var category_text = $("label[for='" + category_no + "']").text(); //category_no에 해당하는 text값
            $("#title").attr("value", "\"" + category_text + "\"에 관한 요청입니다."); //제목에 값 입력
            console.log($("#title").attr("value")); //title값 설정

            //2. 내용 맞추기
            //현재 페이지에 있는 모든 내용을 썸머노트 형식으로 저장해 버릴 예정
            var method = $('input[name="method"]:checked').val();
            var age = $('input[name="age"]:checked').val();
            var gender = $('input[name="gender"]:checked').val();
            var class_time = $('input[name="class_time"]:checked').val();
            var wish = $("#wish").val();
            var reservation_time = $("#datePicker").val();
           /*  if(reservation_time=="undefined"){
            	reservation_time="";
            } */
            console.log(reservation_time);
            //content값 포맷팅
            var content = "<h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'><span style='font-weight: 700;'>1. 어떤 분야의 도움이 필요하신가요?</span></h4><h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'>:&nbsp; " + category_text + "</h4><p style='text-align: left;'><br></p>\
                 <h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'><span style='font-weight: 700;'>2. 어떤 방식으로 진행되길 원하시나요?</span></h4><h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'>:&nbsp; "+ method + "</h4><p style='text-align: left;'><br></p>\
                 <h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'><span style='font-weight: 700;'>3. 과외생의 연령대가 어떻게 되나요?</span></h4><h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'>:&nbsp; "+ age + "</h4><p style='text-align: left;'><br></p>\
                 <h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'><span style='font-weight: 700;'>4. 과외생의 성별은 무엇인가요?</span></h4><h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'>:&nbsp; "+ gender + "</h4><p style='text-align: left;'><br></p>\
                 <h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'><span style='font-weight: 700;'>6. 원하는 날짜가 있나요?</span></h4><h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'>:&nbsp;"+ class_time +"<br>"+ reservation_time +"</h4><p style='text-align: left;'><br></p>\
                 <h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'><span style='font-weight: 700;'>7. 수업 관련 희망사항이 있나요?</span></h4><h4 style='font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(33, 37, 41); text-align: left;'>:&nbsp; "+ wish + "</h4>";
 
            $("#content").attr("value", content);
            let write_form = $("#writeForm").serialize();
            $.ajax({
                url: "${pageContext.request.contextPath}/offlinePost/insertPost.do"
                , data: write_form
                , type: "post"
            }).done(function (data) {
                if (data == "success") {
                    alert("요청 완료되었습니다.");
                    if('${loginSession.type}'==2){
               		 location.href="${pageContext.request.contextPath}/offline/toMainEx.do?expert_id="+id
	               	 }else{
	               		 location.href="${pageContext.request.contextPath}/offline/toMain.do"
	               	 }
                } else {
                    console.log("nono");
                    alert("알 수 없는 오류가 발생하였습니다. 관리자에게 문의 부탁 드립니다.");
                }
            }).fail(function (rs) {
                alert("알 수 없는 오류가 발생하였습니다. 관리자에게 문의 부탁 드립니다.");
            }) 
        }

    </script>

</body>

</html>