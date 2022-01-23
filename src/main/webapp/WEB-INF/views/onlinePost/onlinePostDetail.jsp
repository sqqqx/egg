<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <title>Document</title>
    <style>
        @font-face {
            font-family: 'BMHANNAAir';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .container {
            width: 900px;

            /* border: 1px solid black; */
            text-align: center;
        }

        .buttons {
            text-align: right;
            height: 30px;
        }

        #title {
            font-family: 'BMHANNAAir';
            padding: 30px;
            vertical-align: middle;
            height: 100px;
            /* border: 1px solid; */
        }

        #thumbNail {
            height: 500px;
            /* border: 1px solid black; */
        }

        #storeTitle {
            padding-left: 10px;
            border-top: 1px dotted #5f5d5d;
            margin-top: 30px;
            padding: 10px;
            height: 60px;
            /* border: 1px solid black; */
            font-size: 20px;
        }

        .storeTitleP {
            font-family: 'BMHANNAAir';
            font-size: 30px;
        }

        #storeTitleSpan {
            color: red;
        }

        #thumbNailImg {
            width: 100%;
            height: 100%;
        }

        #productImg {
            width: 100%;
            height: 100%;
        }

        #storeLink {
            height: 250px;
            /* border: 1px solid black; */
            text-align: center;
            padding-left: 35%;
            border-bottom: 1px dotted #5f5d5d;
        }

        #product {
            height: 100%;
            width: 260px;
        }

        #productPic {
            padding: 2px;
            height: 55%;
            /* border: 1px solid; */
        }

        #productInfo {
            height: 45%;
            /* border: 1px solid black; */
        }

        #productName {

            font-family: 'BMHANNAAir';
            height: 65%;
            font-size: 17px;
            /* border: 1px solid black; */
            padding-top: 10px;
        }

        #productPrice {
            font-family: 'BMHANNAAir';
            height: 35%;
            /* border: 1px solid black; */
            padding-bottom: 10px;
        }

        #productPrice {
            font-size: 20px;
        }

        #naviTab {
            margin-top: 50px;
        }

        .nav-link {
            font-family: 'BMHANNAAir';
            font-size: 23px;
        }

        #detailContent {
            margin-top: 100px;
            font-family: 'BMHANNAAir';
        }

        a {
            color: black;
            text-decoration-line: none;
        }


        .comments {
            /* width: 100%; */
            margin-top: 50px;
            /* border: 1px solid black; */
            height: 800px;
            font-family: 'BMHANNAAir';
        }

        .tab-content {
            height: 0;
        }

        .commentsInputArea {
            height: 300px;
            /* border: 1px solid black; */
        }

        .commentsLabel {
            text-align: left;
            font-size: 25px;
            height: 50px;
            /* border: 1px solid black; */
            vertical-align: middle;
            padding-left: 5px;
            padding-top: 10px;
            /* margin-bottom: 10px; */
            margin-bottom: 5px;
        }

        #commentsInput {
            height: 180px;
            width: 100%;
            resize: none;
            padding: 8px;
            font-size: 20px;
        }

        #commentsInput_cnt {
            height: 20px;
            text-align: left;
            padding-right: 10px;
        }

        #commentInsertBtn {
            text-align: right;
            margin-top: 10px;
            padding-right: 5px;
        }

        .user_nickname {
            text-align: left;
            padding-left: 10px;
            padding-top: 10px;
            height: 22px;
            /* border: 1px solid black; */
            margin-top: 10px;
            font-size: 18px;
            border-top: 1px dotted #494646;
            font-weight: bold;
            display: flex;
        }
        #user_id{
            padding-top: 5px;
        }
        .written_date {
            padding-left: 10px;
            text-align: left;
            height: 15px;
            font-size: 15px;
            color: grey;
            margin-top: 5px;
        }

        .comment_content {
            text-align: left;
            padding-left: 13px;
            padding-right: 10px;
            margin-top: 25px;
        }

        .divGroup {
            flex: 1;
        }

        #commentChange {
            text-align: right;
            font-size: 12px;
            color: #494646;
            padding-right: 10px;
            /* padding-top: 5px; */
            margin-bottom: 10px;
            
        }
        .dropdown{
            vertical-align: top;
        }
        ul{
            font-weight : bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="buttons">
            <button type="button" class="btn btn-warning" id="modify">게시글 수정</button>
            <button type="button" class="btn btn-danger" id="delete">게시글 삭제</button>
        </div>
        <div class="row" id="title">
            <h2>${PostDTO.title}</h2>
        </div>
        <div class="row" id="thumbNail">
            <img src="${pageContext.request.contextPath}/onlinePostThumbNail/${ImageDTO.system_name}" id="thumbNailImg">
        </div>
        <div class="row" id="storeTitle">
            <p class="storeTitleP"><span class="storeTitleP" id="storeTitleSpan">잠깐!! </span>준비물은 챙기셨나요?</p>
        </div>
        <div class="row" id="storeLink">
            <div id="product">
                <a href="">
                    <div id="productPic"><img
                            src="${pageContext.request.contextPath}/onlinePostThumbNail/${ImageDTO.system_name}"
                            id="productImg"></div>
                    <div id="productInfo">
                        <div id="productName">${ProductDTO.name}</div>
                        <div id="productPrice">
                            <p>${ProductDTO.price} 원</p>
                        </div>
                    </div>
                </a>

            </div>
        </div>
        <div class="row" id="naviTab">

            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#detail"
                        type="button" role="tab" aria-controls="detail" aria-selected="true">상세설명</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="comments-tab" data-bs-toggle="tab" data-bs-target="#comments"
                        type="button" role="tab" aria-controls="comments" aria-selected="false">후기 및 Q&A</button>
                </li>

            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
                    <div id="detailContent">
                        ${PostDTO.content}
                    </div>
                </div>
                <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">
                    <div class="comments">
                        <div class="commentsInputArea">
                            <div class="commentsLabel"><label id="commentsLabel">댓글 달기</label></div>
                            <div class="commentsInput">
                                <!-- <textarea id="commentsInput"></textarea> -->
                                <textarea id="commentsInput" name="commentsInput" cols="30" rows="10"
                                    placeholder="강의 후기 또는 궁금한 점을 남겨주세요! (150자 이내)"></textarea>

                                <div id="commentInsertBtn">
                                    <span id="commentsInput_cnt">(0 / 150)</span>
                                    <button id="insert" class="btn btn-success">댓글 등록</button>
                                </div>
                            </div>
                        </div>
                        <div class="allComments">
                            <div class="commentsLabel"><label id="commentsLabel">전체 댓글 (120)</label></div>
                            <div class="comment">
                                <div class="user_nickname">
                                    <div class="divGroup" id="user_id"><label >경민짱</label></div>
                                    <div class="divGroup"></div>
                                    <div class="divGroup" id="commentChange">
                                        <div class="dropdown">
                                            <ul class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Left Align">
                                                <!-- <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span> -->
                                                댓글 편집
                                            </ul>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                              <li><a class="dropdown-item" href="#">수정</a></li>
                                              <li><a class="dropdown-item" href="#">삭제</a></li>
                                            </ul>
                                          </div>
                                    </div>
                                </div>
                                <div class="comment_content">아니라고는 말 못할 것 같아요아니라고는 말 못할 것 같아요아니라고는 말 못할 것 같아요아니라고는 말 못할
                                    것 같아요아니라고는 말 못할 것 같아요아니라고는 말 못할 것 같아요아니라고는 말 못할 것 같아요</div>
                                <div class="written_date"><label id="written_date">2021-12-15 12:30</label></div>
                                <div class="reactions">
                                    <div class="reaction" id="like"></div>
                                    <div class="reaction" id="report"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        document.getElementById("modify").onclick = function () {
            /* alert("수정 버튼이 눌렸어!"); */
            location.href = "/onlinePost/toModifyPost.do?post_no=" + ${ PostDTO.post_no };
        }


        //삭제버튼 결합 후에 바꿔주어야 함.
        document.getElementById("delete").onclick = function () {
            /* alert("삭제 버튼이 눌렸어요!"); */
            location.href = "/onlinePost/deletePost.do?post_no=16";
        }

        $(document).ready(function () {
            $('#commentsInput').on('keyup', function () {
                $('#commentsInput_cnt').html("(" + $(this).val().length + " / 150)");

                if ($(this).val().length > 150) {
                    $(this).val($(this).val().substring(0, 150));
                    $('#commentsInput_cnt').html("(150 / 150)");
                    alert("150자 이상 입력하실 수 없습니다.");
                }
            });
        });

        $(document).ready(function(){
        $('.dropdown-toggle').dropdown()
    });

        
    </script>
</body>

</html>