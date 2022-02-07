<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <!-- 기존 부트스트랩 코드 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <!-- 썸머노트 : include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- 썸머노트 : include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <title>클래스 등록</title>
    <style>
        .container {
            margin: 0 auto;
            width: 900px;
            text-align: center;
        }

        /* 		.note-editor {
			height: 100%;
			margin: 0;
		}
 */
        .row {
            text-align: center;
        }

        table {
            table-layout: fixed;
        }

        td {
            vertical-align: middle;
        }

        .contentName {
            width: 90px;
            text-align: center;
            vertical-align: middle;
            font-weight: bold;
            border-right: 1px solid #80808050;
        }

        .category {
            height: 100%;
            font-size: 15px;
            margin-right: 1px;
            width: calc(100%/ 2.1);
        }

        #selectBox {
            display: flex;
            justify-content: left;
        }

        span {
            width: 5px;
        }

        #product {
            width: 80%;
            display: inline-block
        }

        #searchProduct {
            text-align: left;
        }

        .note-editable.panel-body {
            overflow-x: hidden;
            overflow-y: scroll;
        }

        #blankForHeader {
            height: 90px;
        }

        .thumbNailImg {
            width: 300px;
            height: 170px;
            padding: 10px;
        }

        #thumbNailImg {
            width: 100%;
            height: 100%;
              object-fit: contain;
        }

        .priceArea {
            width: 100%;
            text-align: left;
        }

        #price {
            width: 20%;
            display: inline;
        }

        #priceSpan {
            margin-left: 8px;
        }

        #stock {
            display: inline;
            width: 20%;
        }
    </style>
    <script>

        //썸머노트 사진 url을 변경해 주는 함수
        function sendFile(file, el) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "/image/getPicUrl.do",
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function (data) {
                    console.log(data);
                    $(el).summernote('editor.insertImage', data.sys_name);
                }
            });
        }


    </script>
</head>

<body>
    <div id="blankForHeader"></div>
    <div class="container">
        <div class="row">
            <div class="wrapper">
                <h2 class="text-center">상품 등록</h2>
                <form action="/product/modify.do?product_no=${ProductDTO.product_no}" method="post" id="modifyForm" ENCTYPE="multipart/form-data">
                    <table class="table table-striped">
                        <tr>
                            <td class="contentName">상품명</td>
                            <td><input type="text" class="form-control" name="name" id="product_name" value="${ProductDTO.name}">
                            </td>
                        </tr>
                        <tr>
                            <td class="contentName">썸네일</td>
                            <td>
                                <div class="thumbNailImg"><img src="${pageContext.request.contextPath}/productThumbnail/${ProductDTO.image_path}" id="thumbNailImg" ></div>
                                <input type="file" class="form-control" name="thumbNail" id="thumbNail"
                                    accept=".gif, .jpg, .png, .JPEG">
                            </td>
                        </tr>
                        <tr>
                            <td class="contentName">상품 가격</td>
                            <td>
                                <div class="priceArea"><input type="text" class="form-control" name="price" id="price"
                                        placeholder="0" onkeyup="inputNumberFormat(this)"><span id="priceSpan">원</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="contentName">재고</td>
                            <td>
                                <div class="priceArea"><input type="number" class="form-control" name="stock" id="stock"
                                        placeholder="0" onkeyup="inputNumberFormat(this)" value=${ProductDTO.stock}><span id="priceSpan">개</span>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="contentName">상품 소개</td>
                            <td>
                                <div><textarea id="summernote" name="content">${ProductDTO.content}</textarea></div>

                            </td>
                            <script>

                                //썸머노트 게시판을 띄워주는 함수, 높이값이나 지원 언어 등의 정보 + 이미지 업로드 처리 방식 (상단 스크립트 부분 속 함수) 
                                $(document).ready(function () {
                                    $('#summernote').summernote({
                                        placeholder: '강의에 대한 상세 설명을 넣어주세요.',
                                        minHeight: 600,
                                        maxHeight: null,
                                        focus: false,
                                        lang: 'ko-KR',
                                        /* disableResizeEditor: true */

                                        callbacks: { // 콜백을 사용
                                            // 이미지를 업로드할 경우 이벤트를 발생
                                            onImageUpload: function (files, editor, welEditable) {
                                                sendFile(files[0], this);
                                            }
                                        }
                                    });
                                    $('.note-statusbar').hide();
                                });
                            </script>
                        </tr>
                        <tr>

                            <td colspan="2" class="text-center">
                                <button type="button" class="btn btn-success" id="modify">수정</button>
                                <button type="button" class="btn btn-warning" id="reset">새로
                                    작성</button>
                                <button type="button" class="btn btn-primary">취소</button>
                            </td>
                        </tr>

                    </table>
                </form>
            </div>
        </div>
    </div>
    <script>


        //reset버튼 눌렀을 경우 데이터 처리
        $("#reset").on("click", function () {
            if (confirm("입력된 데이터가 모두 삭제됩니다. 정말 새로 쓰시겠습니까?")) {
                location.reload();
            }
        })


        //등록 버튼 눌렀을 때
        
        $("#modify").on("click", function () {
            if ($("#product_name").val() == "") {
                alert("상품명을 입력해 주세요.");
            } else if ($("#price").val() == "") {
                alert("가격을 입력해 주세요.");
            } else if ($("#summernote").val() == "") {
                alert("상품 설명을 입력하여 주세요.");
            } else {
            	let price = $("#price").val()
            	price = cf_getNumberOnly (price);
            	if($("#product_name").val()=="${ProductDTO.name}" &&
            	   price==${ProductDTO.price}&&
            	   $("#stock").val()==${ProductDTO.stock}&&
            	   $("#thumbNail").val()==""){
            		alert("변경 사항이 없습니다. 상품 목록으로 이동합니다.");
            		location.href="/product/toWrite.do"
            	}else{
            		console.log("변경사항 있음")
            		$("input[name='price']")[0].value = price;
            		$("#modifyForm").submit(); 
            	} 
            }
            return;
        })


        //썸네일 파일 선택되면 위에 띄워주는 함수
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#thumbNailImg').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        
        
        // 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
        $("#thumbNail").change(function () {
            readURL(this);
        });
        
        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }

        function comma(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        }
        
        
        function cf_getNumberOnly (str) {
            var len      = str.length;
            var sReturn  = "";

            for (var i=0; i<len; i++){
                if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
                    sReturn += str.charAt(i);
                }
            }
            return sReturn;
        }
        $(document).ready(function(){
        	$("#price").val(comma(uncomma(${ProductDTO.price})));
        	
        })
    </script>
</body>

</html>