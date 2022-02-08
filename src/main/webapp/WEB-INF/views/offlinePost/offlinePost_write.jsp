<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>.
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
    </style>
</head>

<body>
    <div class="container">
        <div class="category_menu">
            <span class="category_menu_title">"프로그래밍"</span><br>
            <span class="category_menu_explain">[당신에게 딱맞는 <strong class="proTitle">"능력자"</strong>를 찾아드리겠습니다!]</span><br>
            <span class="category_menu_explain"><strong>잠깐! 그전에 아래 항목을 작성해 주세요!</strong></span>

        </div>
        <form action="/offlinePost/write.do" method="post" id="writeForm">
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
                            <input type="radio" name="category" class="inputRadio"> 드로잉<br>
                            <input type="radio" name="category" class="inputRadio"> 공예<br>
                            <input type="radio" name="category" class="inputRadio"> 가죽 공예<br>
                            <input type="radio" name="category" class="inputRadio"> 기타<br>
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
                            <input type="radio" name="method" class="inputRadio"> 제가 있는 곳에서 진행하고 싶습니다.<br>
                            <input type="radio" name="method" class="inputRadio"> 카페/스터디룸에서 진행하고 싶습니다.<br>
                            <input type="radio" name="method" class="inputRadio"> 능력자분이 있는 곳으로 가겠습니다.<br>
                            <input type="radio" name="method" class="inputRadio"> 온라인/화상 수업을 원합니다.<br>
                            <input type="radio" name="method" class="inputRadio"> 다 괜찮습니다.<br>

                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <strong class="question"> 3. "닉네임"님의 연령대는 어떻게 되시나요?</strong>
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                        data-bs-parent="#accordionExample" value="3">
                        <div class="accordion-body">
                            <input type="radio" name="age" class="inputRadio"> 20대<br>
                            <input type="radio" name="age" class="inputRadio"> 30대<br>
                            <input type="radio" name="age" class="inputRadio"> 40대<br>
                            <input type="radio" name="age" class="inputRadio"> 50대 이상<br>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            <strong class="question"> 4. "닉네임"님의 성별은 어떻게 되시나요?</strong>
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                        data-bs-parent="#accordionExample" value="4">
                        <div class="accordion-body">
                            <input type="radio" name="gender" class="inputRadio"> 남<br>
                            <input type="radio" name="gender" class="inputRadio"> 여<br>
                            <input type="radio" name="gender" class="inputRadio"> 혼성<br>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            <strong class="question"> 5. 지역을 선택해 주세요</strong>
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse " aria-labelledby="headingFive"
                        data-bs-parent="#accordionExample" value="5">
                        <div class="accordion-body">
                            <input type="radio" name="location" class="inputRadio"> 서울<br>
                            <input type="radio" name="location" class="inputRadio"> 부산<br>
                            <input type="radio" name="location" class="inputRadio"> 경기도<br>
                            <input type="radio" name="location" class="inputRadio"> 어쩌구<br>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingSix">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                            <strong class="question"> 6. 능력자가 필요하신 날짜는 언제인가요? </strong>
                        </button>
                    </h2>
                    <div id="collapseSix" class="accordion-collapse collapse " aria-labelledby="headingSix"
                        data-bs-parent="#accordionExample" value="6">
                        <div class="accordion-body">
                            <input type="radio" name="class_day" class="inputRadio"> 능력자와 혐의하고 싶습니다.<br>
                            <input type="radio" name="class_day" class="inputRadio"> 가능한 빨리 진행하고 싶습니다.<br>
                            <input type="radio" name="class_day" class="inputRadio"> 일주일 이내로 진행하고 싶습니다.<br>
                            <input type="radio" name="class_day" class="inputRadio"> 원하는 날짜가 따로 있어요<br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="buttons">
                <button type="button" class="btn btn-warning" id="submitBtn">1:1 고수 찾기</button>
                <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
            </div>
        </form>

        <script>
            // document.getElementById("openBtn").onclick = function () {
            //     // $(".accordion-collapse").collapse('toggle');
            //     $("#collapseSix").collapse('show');
            //     console.log($("input:radio:checked").length);
            // }

            $(".inputRadio").on("click", function () {
                let parent = $(this).parent().parent()[0];
                let number = parent.getAttribute("value");
                console.log($("input:radio:checked").length);
                if ($("input:radio:checked").length != "6") {
                    openMenu(parseInt(number) + 1);
                } else {
                    // document.getElementById("openBtn").hidden=false;
                }
            })

            function openMenu(number) { //다음 메뉴바를 연다
                $("div[value='" + number + "']").collapse('show');
            }

            $("#submitBtn").on("click", function () {

                if (!$('input:radio[name=category]').is(':checked')) {
                    alert("능력 분야를 선택해 주세요.");
                    $("#collapseOne").collapse('show');
                    return;
                } else if (!$('input:radio[name=method]').is(':checked')) {
                    alert("원하시는 학습 방법을 선택해 주세요.");
                    $("#collapseTwo").collapse('show');
                    return;
                } else if (!$('input:radio[name=age]').is(':checked')) {
                    alert("닉네임님의 나이를 선택해 주세요.");
                    $("#collapseThree").collapse('show');
                    return;
                } else if (!$('input:radio[name=gender]').is(':checked')) {
                    alert("닉네임님의 성별을 선택해 주세요.");
                    $("#collapseFour").collapse('show');
                    return;
                } else if (!$('input:radio[name=location]').is(':checked')) {
                    alert("지역을 선택해 주세요.");
                    $("#collapseFive").collapse('show');
                    return;
                } else if (!$('input:radio[name=class_day]').is(':checked')) {
                    alert("날짜를 선택해 주세요.");
                    $("#collapseSix").collapse('show');
                    return;
                } else {
                    $("#writeForm").submit();
                }
            })

        </script>
    </div>
</body>

</html>