<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    div {
        border: 1px solid grey;
        text-align: center;
    }
    #msg_head {
        font-size: 30pt;
    }
    textarea {
        resize: none;
        height: 300px;
    }
    button {
        width: 100%;
    }
</style>
</head>
<body>
    <div class="container">
        <form id="msgForm">
            <div class="row">
                <div class="col" id="msg_head"><p>쪽지 보내기</p></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label for="to_id">수신자</label>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="to_id" name="to_id" value="${dto.to_id}">
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" id="from_id" name="from_id" value="${dto.from_id}" hidden>
                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label>제목</label>
                </div>
                <div class="col-5">
                    <input type="text" class="form-control" id="title" name="title" placeholder="쪽지 제목을 입력해주세요">
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-1">
                    <label for="content">내용</label>
                </div>
                <div class="col-5">
                    <textarea class="form-control" id="content" name="content" placeholder="쪽지 내용을 입력해 주세요"></textarea>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-3">
                    <button type="button" class="btn btn-secondary" id="blankBtn">내용 초기화</button>
                </div>
                <div class="col-3">
                    <button type="button" class="btn btn-success" id="sendBtn">보내기</button>
                </div>
                <div class="col-3"></div>
            </div>
        </form>
    </div>

    <script>
        // 내용 초기화 버튼
        $("#blankBtn").on("click", function(){
            $("#content").val("");
        })

        // 보내기 버튼
        $("#sendBtn").on("click", function(){
            // 빈 칸 검사
            if($("#to_id").val === "") {
                alert("수신자 ID를 입력해주세요");
                return ;
            } else if($("#title").val() === "") {
                alert("쪽지 제목을 입력해주세요");
                return ;
            } else if($("#content").val() === "") {
                alert("쪽지 내용을 입력해주세요");
                return ;
            }

            // 쪽지 전송
            let data = $("#msgForm").serialize();
            $.ajax({
                url: "${pagecontext.request.contextPath}/message/sendMessage.do",
                type: "post",
                data: data
            }).done(function(rs){
                console.log(rs);
                if(rs === 'success') {
                	alert("쪽지 전송에 성공했습니다.");
                	window.close();
                } else if(rs === 'fail'){
                	alert("쪽지 전송에 실패했습니다.");
                }
            }).fail(function(e){
                console.log(e);
                alert("쪽지 전송 중에 에러가 발생했습니다.");
            })
        })
    </script>
</body>
</html>