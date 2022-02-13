<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
        *{
            font-family: 'BMHANNAAir';
        }
        
        h4{
            font-family: 'BMHANNAAir';
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

        .proTitle {
            font-size: 35px;
        }

        .post {
            margin-top: 25px;
            width: 100%;
            height: 1100px;
        }

        .postInfo_all {
            border-top: 1px dotted black;
            border-bottom: 1px dotted black;
            height: 150px;
        }

        .postInfo {
            height: 100%;
            font-weight: bold;
            padding-left: 10px;
            width: 90%;
            float: left;
        }


        .postTitle {
            font-size: 30px;
            height: 40px;
        }

        .postCategory {
            height: 10px;
            margin-bottom: 15px;
            margin-top: 20px;
            vertical-align: bottom;
            font-size: 18px;
        }

        .postWriter {
            height: 10px;
            margin-bottom: 13px;
            vertical-align: bottom;
            font-size: 20px;
            margin-top: 7px;
        }

        .postContent {
            font-family: 'BMHANNAAir';
            margin-top : 30px;
            border-bottom: 1px dotted black;
            padding : 20px;
            
        }
        .buttons{
            text-align : center;
            margin-top : 30px;
        }
        .reactionPic{
            float: left;      
            text-align : center;  
            margin-top : 20px;
            margin-right : 13px;
            font-size : 14px;
        }
        .postReaction{
            float : left;
            text-align : center;
            width : 10%;
            height : 100%;
        }
        p{
            font-size: 20px;
        }
         #popup, #popup_message {
            text-align: left;
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .781);
            z-index: 1;
            color : white;

        }


        #popup.hide , #popup_message.hide{
            display: none;
        }

        #popup.has-filter, #popup_message.has-filter {
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            
        }

        #popup.content, #popup_message.content {
            width: 500px;
            height: 500px;
            padding: 10px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
            font-size: 17px;
        }

        .reportTitle {
            font-size: 38px;
            text-align: center;
            font-family: 'BMHANNAAir';
        }

        p {
            margin-top: 10px;
            margin-bottom: 19px;
        }

        .radios {
            margin-bottom: 15px;
            font-size: 20px;
            font-family: 'BMHANNAAir';

        }

        #reportReason {
            resize: none;
            width: 99%;
            height: 100px;
            border-radius: 3px;
        }

        .reportBtns {
            text-align: center;
            margin-top: 10px;
        }

        
        #popup_message div{
            font-size : 20px;
             margin-top : 15px;
        }
        
        #popup_message input{
            width:450px;
        }
        #popup_message textarea{
            width : 450px;
            height : 200px;
            resize:none;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="category_menu">
            <span class="category_menu_title">"${CategoryDTO.parent_group}"</span><br>
            <span class="category_menu_explain"><strong>공고가 마음에 드시면 <strong class="proTitle">"견적"</strong>을
                    보내보세요!</strong></span><br>
            <span class="category_menu_explain"><strong>잠깐! 그전에 요구사항을 꼼꼼하게 확인해 주세요!</strong></span>
        </div>

        <div class="post">
            <div class="postInfo_all">
                <div class="postInfo">
                    <div class="postCategory">${CategoryDTO.parent_group} - ${CategoryDTO.child_group}</div>
                    <div class="postTitle">"${CategoryDTO.child_group}"에 관한 요청 드립니다.</div>
                    <div class="postWriter"><span>${PostDTO.user_id} &nbsp;|&nbsp; ${PostDTO.written_date}&nbsp;|&nbsp; 조회수 ${PostDTO.view_count}</span></div>
                </div>
                <div class="postReaction">
                    <div class="reactionPic" id="likeArea" value=0 onclick="likePost()"><i id="likeBtn" class="fas fa-heart fa-2x"></i><p>찜하기</p></div>
                    <div class="reactionPic" onclick="showPopup(1)"><i class="fa fa-times fa-2x"></i><p>신고</p></div>
                </div>
            </div>
            <div class="postContent">
                ${PostDTO.content}
            </div>
            <div class="buttons">
              <button class="btn btn-warning" id="sendingMessage">견적 보내기</button>
              <button class="btn btn-secondary" id="cancelBtn">목록으로</button>
            </div>
        </div>
        <form method="post" id="reportForm" action="/report/insertReport.do">
            <div id="popup" class="hide">

                <div class="content">
                    <input type="hidden" name="type" id="type" value=2>
                    <input type="hidden" name="target_no" id="target_no">
                    <div class="reportTitle">
                        <h2>신고하기</h2>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=1> <span>부적절한 언행 사용(욕설, 성적 발언,
                            정치,
                            종교 혐오 발언 등)</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=2> <span>유해한 컨텐츠 사용(광고, 거짓정보,
                            자극적인
                            컨텐츠)</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=3> <span>따돌림 혹은 괴롭힘</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=4> <span>지적 재산권 침해 및 저작권
                            침해</span><br>
                    </div>
                    <div class=" radios">
                        <input type="radio" class="reportType" name="report_title" value=5> <span>기타</span><br>
                    </div>
                    <textarea type="text" id="reportReason" name="report_content" disabled></textarea>
                    <div class="reportBtns">
                        <button type="button" class="btn btn-secondary" onclick="closePopup()">취소</button>
                        <button type="button" class="btn btn-warning" id="reportBtn">신고</button>
                    </div>
                </div>
            </div>
        </form>
        <form method="post" id="messageForm">
        <div id="popup_message" class="hide">
            <div class="content">
                <h2>[ '피피' 님께 보내는 견적서 ]</h2>
                <div class="expert_categoryDiv">
                    <label>* 제공하는 서비스 : </label><br>
                    <input type="text" class="expert_category" value="${CategoryDTO.parent_group} - ${CategoryDTO.child_group}" readonly> 
                </div>
                <div class="class_price">
                    <label>* 견적 금액 : </label><br>
                    <input type="type" id="price" placeholder="(예: 시간당 30000원 / 회당 20000원)">
                </div>
                <div class="specificContent">
                    <label>* 제공할 수 있는 서비스에 관해 구체적으로 기입해 주세요: </label><br>
                    <textarea id="classContent"></textarea>
                </div>
                <div class="buttons_message">
                    <button type="button" class="btn btn-warning" id="message_submitBtn">견적 전송</button>
                    <button type="button" class="btn btn-secondary" id="message_cancelBtn" onclick="messeage_closePopup()">취소</button>
                </div>
            </div>
        </div>
        </form>
    </div>
    <script>
    $(document).ready(function(){
    	selectLike();
    })
    
    //취소버튼 누르면 이전 페이지로 넘어가기
    $("#cancelBtn").on("click",function(){
    	goBackPage();
    })
    
    //이전 페이지로 돌아가는 함수
    function goBackPage(){
    	window.history.back();
    }
    
    //좋아요 처리
        function likePost(){
        	let bid = '${loginSession.user_id}';
        	let post_no = ${PostDTO.post_no};
        	let value = $("#likeArea").attr("value");
        	if(value=="0"){ //좋아요가 눌려있지 않는 경우
        		$("#likeBtn").css("color", "#e05885"); 
                $("#likeArea").attr("value","1");
                console.log($("#likeArea").attr("value"));
            	$.ajax({
                    url: "${pageContext.request.contextPath}/like/plus.do?post_no=" + post_no + "&user_id=" + bid + "&type=5",
                    type: "get"
                }).done(function (data) {
                    if (data == "available") {
                        console.log("좋아요 성공")
                    } else if (data == "unavailable") {
                        alert("좋아요 요청 실패");
                    }
                    return;
                }).fail(function (e) {
                    console.log(e);
                })
        	}else{//좋아요가 눌려있는 경우
        		$("#likeBtn").css("color", "black"); 
                $("#likeArea").attr("value","0");
                console.log($("#likeArea").attr("value"));
                $.ajax({
                    url: "${pageContext.request.contextPath}/like/minus.do?post_no=" + post_no + "&user_id=" + bid + "&type=5",
                    type: "get"
                }).done(function (data) {
                    if (data == "available") {
                        console.log("좋아요 취소 성공")
                    } else if (data == "unavailable") {
                        alert("좋아요 취소 요청 실패");
                    }
                }).fail(function (e) {
                    console.log(e);
                })
        	}
        	
        	
        }
    
    
        //유저가 이 게시글에 좋아요를 눌렀을 경우 좋아요버튼이 눌린채로 표시
        function selectLike() {
            let bid = '${loginSession.user_id}'
            let post_no = '${PostDTO.post_no}'
            $.ajax({
                url: "${pageContext.request.contextPath}/like/selectLike.do?post_no=" + post_no + "&user_id=" + bid + "&type=5",
                type: "get"
            }).done(function (data) {
                if (data == "available") {
                	$("#likeBtn").css("color", "#e05885"); 
                    $("#likeArea").attr("value","1");
                } else if (data == "unavailable") {
                	$("#likeBtn").css("color", "black"); 
                    $("#likeArea").attr("value","0");
                }
            }).fail(function (e) {
                console.log(e);
            });
        }
        
        //신고 팝업을 띄우는 메서드
        //신고 타입(댓글인지, 게시글인지), 해당 번호
        function showPopup(type) {
            const popup = document.querySelector('#popup');
            popup.classList.add('has-filter');
            popup.classList.remove('hide');
            $("input:radio[name='report_title']:radio[value=1]").prop('checked', true); // 선택하기
            $("#target_no").val(${PostDTO.post_no});
            $("#type").val(type);
        }

        //팝업 닫기
        function closePopup() {
            const popup = document.querySelector('#popup');
            popup.classList.add('hide');
        }
        
      //신고창에서 신고 사유를 선택하는 경우
        $(".reportType").on("click", function () {
            // $("#phoneCheck").attr("disabled",false);
            if ($(this).val() == 5) { //기타 선택시 
                $("#reportReason").attr("disabled", false);//input창 열리기
                return;
            } $("#reportReason").attr("disabled", true); //input창 닫기
        })


        //신고창에서 신고 버튼 눌렀을 때 처리
        $(document).on("click", "#reportBtn", function () {
            var reportForm = $("#reportForm").serialize(); //form을 json으로 해서 보내기
            $.ajax({
                url: "/report/insertReport.do"
                , type: "post"
                , data: reportForm
            }).done(function (rs) {
                if (rs == "success") {
                    alert("신고 완료되었습니다.");
                } else {
                    alert("오류가 생겼습니다. 다시 시도해 주시길 바랍니다.");
                } closePopup();
            }).fail(function (rs) {
                console.log(rs);
            });
        })
        
        //'견적 보내기' 버튼 누르면 견적 팝업 띄우기
        document.getElementById("sendingMessage").onclick=function(){
        	const popup = document.querySelector('#popup_message');
            popup.classList.add('has-filter');
            popup.classList.remove('hide');
            $("input:radio[name='report_title']:radio[value=1]").prop('checked', true); // 선택하기
        }
      
        //취소 버튼 누르면 팝업 없애기
        function messeage_closePopup() {
            const popup = document.querySelector('#popup_message');
            popup.classList.add('hide');
        }
        
        //견적보내기 버튼 클릭 시 
        //유효성 검사 + 포인트 차감 처리
        document.getElementById("message_submitBtn").onclick=function(){
        	if($("#price").val()==""){
        		alert("견적 금액을 입력해 주시길 바랍니다.");
        		$("#price").focus();
        		return;
        	}else if($("#classContent").val()==""){
        		alert("서비스에 관해 구체적인 설명을 적어주세요.");
        		$("#classContent").focus();
        		return;
        	}else{
        		if(confirm("견적 전송 시 500p가 차감됩니다. 진행하시겠습니까?")){
        			let to_id = "${PostDTO.user_id}";
        			console.log(to_id);
                    let price = $("#price").val();
                    let classContent = $("#classContent").val();
                    let content = "<p style='text-align: left; '>* 제공 서비스 *</p><p style='text-align: left; '>: ${CategoryDTO.parent_group} - ${CategoryDTO.child_group}</p><p style='text-align: left; '><br></p><p style='text-align: left; '>*예상 견적 금액*</p><p style='text-align: left; '>: "+price+"</p><p style='text-align: left; '><br></p><p style='text-align: left; '>* 수업 관련 설명 *</p><p style='text-align: left; '>: "+classContent+"</p>"
        			$.ajax({
        				url : "/message/sendingExpertMessage.do"
        				,type: "post"
        				,data: {to_id:to_id, content:content}
        			}).done(function(data){
        				if(data=="success"){
        					console.log(data);
        				}else if(data="lessPoint"){
        					
        				}else if(data="fail"){
        					alert("알 수 없는 오류가 발생하였습니다. 관리자에게 문의 바랍니다.");
        				}
        			}).fail(function(rs){
        				alert("알 수 없는 오류가 발생하였습니다. 관리자에게 문의 바랍니다.");
        			});
        		}
        	}
        }
        
        
    </script>

</body>

</html>