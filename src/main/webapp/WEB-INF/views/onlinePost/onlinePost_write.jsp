<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		.note-editor {
			height: 100%;
			margin: 0;
		}

		.row {
			text-align: center;
		}

		td {
			vertical-align: middle;
		}

		.contentName {
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
	</style>
	<script>
	
	function sendFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/onlinePost/getPicUrl.do",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				console.log(data);
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
		/* function sendFile(file, editor) {
			// 파일 전송을 위한 폼생성
			data = new FormData();
			data.append("file", file);
			$.ajax({ // ajax를 통해 파일 업로드 처리
				data: data,
				type: "POST",
				url: "/onlinePost/getChildCategory.do",
				cache: false,
				contentType: false,
				processData: false,
				success: function (data) { // 처리가 성공할 경우
					// 에디터에 이미지 출력
					$(editor).summernote('editor.insertImage', data.url);
				}
			});
		} */


		/* function sendFile(file, editor) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data: form_data,
				type: "POST",
				url: '/onlinePost/getChildCategory.do',
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (url) {
					$(editor).summernote('editor.insertImage', url);
						/* $image.css('width', "25%");
					}
				}
			)}; */


	</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="wrapper">
				<h2 class="text-center">클래스 등록</h2>
				<form action="/onlinePost/write.do" method="post" id="writeForm">
					<table class="table table-striped">
						<tr>
							<td class="contentName" id="categories">카테고리</td>
							<!-- <td><input type="text" class="form-control" name="category_no" id="category_no"></td> -->
							<td id="selectBox"><span></span> <select class="form-select category"
									aria-label="Default select example" id="category1">
									<option selected>대분류</option>
									<c:forEach items="${list}" var="category">
										<option value="${category}">${category}</option>
									</c:forEach>
								</select> <span></span> <select class="form-select category"
									aria-label="Default select example" id="category2" name="category_no" disabled>
									<option selected>소분류</option>

								</select></td>
						</tr>
						<tr>
							<td class="contentName">작성자<br>닉네임
							</td>
							<td><input type="text" name="user_id" id="user_id" value="id" hidden> <input type="text"
									class="form-control" name="user_nickname" id="user_nickname" value="관리자" readonly>
							</td>
						</tr>
						<tr>
							<td class="contentName">강의명</td>
							<td><input type="text" class="form-control" name="title" id="title"></td>
						</tr>

						<tr>
							<td class="contentName">강의 소개</td>
							<td><textarea id="summernote" name="content"></textarea></td>
							<script>
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
							<td class="contentName">연결 상품</td>
							<td id="searchProduct"><input type="text" class="form-control" id="product"
									placeholder="상품을 검색해 주세요." readonly> <input type="text" name="product_no"
									id="product_no" hidden>
								<button type="button" class="btn btn-info" id="searchBtn">상품
									검색</button>
							</td>
						</tr>

						<tr>

							<td colspan="2" class="text-center">
								<button type="button" class="btn btn-success" id="insert">등록</button>
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
		/* $('.summernote').summernote({
			height: 400,
			lang: "ko-KR",
			minHeight: null,
			maxHeight: null,
			focus: true,
			callbacks: {
				console.log("암히어2")
				onImageUpload: function (files, editor, welEditable) {
					console.log("암히어1")
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], this);
					}
				}
			}
		}); */

		/* function sendFile(file, editor) {
			console.log("암히어3");
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({

				data: form_data,
				crossDomain: true,
				type: "POST",
				url: '/onlinePost/getPicUrl.do',
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false
			}).done(function (url) {
				console.log("성공함");
				$(editor).summernote('insertImage', url, function ($image) {
					$image.css('width', "25%");
				})
			}).fail(function (e) {
				console.log("실패요");
				console.log(e);
			}); */
			/* 
				success: function (url) {
					$(editor).summernote('insertImage', url, function ($image) {
						$image.css('width', "25%");
					});
				} 

		}*/



		console.log($("#category2 option:selected").val());
		$("#reset").on("click", function () {
			if (confirm("입력된 데이터가 모두 삭제됩니다. 정말 새로 쓰시겠습니까?")) {
				$("#category_no").val("");
				$("#title").val("");
				($(".note-editable").children()).remove();
			}
		})

		$("#category1").on("change", function () {
			console.log($("#category1").val());
			let bigCategory = $("#category1").val()
			if (bigCategory != "대분류") {
				$.ajax({
					url: "/onlinePost/getChildCategory.do"
					, type: "post"
					, data: { bigCategory: bigCategory }
				}).done(function (rs) {
					console.log(rs);
					$("#category2").attr("disabled", false); //소분류 입력 가능하게 열기
					$('#category2').children('option:not(:first)').remove(); //'소분류'라는 항목을 뺀 전체 항목 지우기
					 rs.forEach(function (dto) {
						var option = "<option value='" + dto.category_no + "'>" + dto.child_group + "</option>"
						$("#category2").append(option);
					}) 
				}).fail(function (e) {
					console.log("실패했어유ㅋㅋ");
				})
			} else {
				$("#category2").attr("disabled", true);
			}
		})

		/*  $("#category2").on("change",function(){
			 console.log($("#category2 option:selected").val());
		 }); */

		function popup() {
			var url = "/onlinePost/toSearchProduct.do";
			var name = "searchProduct";
			window.open(url, name, "height=1000,width=1000");
		}

		$("#searchBtn").on("click", function () {
			popup();
		})

		$("#insert").on("click", function () {
			if ($("#category2 option:selected").val() == '소분류') {
				alert("카테고리를 설정하여 주세요.");
			} else if ($("#title").val() == "") {
				alert("제목을 입력하세요.");
			} else if ($("#content").val() == "") {
				alert("강의 내용을 입력하여 주세요.");
			} else if ($("#product_no").val() == "") {
				alert("연결 상품을 선택하여 주세요.");
			} else {
				$("#writeForm").submit();
			}
			return;
		})








	</script>
</body>

</html>