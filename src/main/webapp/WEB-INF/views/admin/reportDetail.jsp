<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/reportDetail.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> --> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <title>신고 상세</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <table class="cls-table">
                    <tbody>
                        <tr>
                            <td colspan="2">신고 상세 페이지</td>
                        </tr>
                        <tr class="smallRow">
                            <td>신고 대상</td>
                            <td>${map.USER_NICKNAME}</td>
                        </tr>
                        <tr class="smallRow">
                            <td>유형</td>
                            <td id="checkBoxWrapper">
                            	<input type="checkbox" onClick="return false;"/>게시글
                            	<input type="checkbox" onClick="return false;"/>댓글
                            	<input type="checkbox" onClick="return false;"/>쪽지
                            </td>
                        </tr>
                        <tr class="smallRow">
                            <td>분류</td>
                            <td>${map.I_REPORT_CONTENT}</td>
                        </tr>
                        <tr class="smallRow">
                            <td>신고일</td>
                            <td>${map.REPORT_DATE}</td>
                        </tr>
                        <c:if test="${map.REPORT_CONTENT ne null}">
                        	<tr>
	                            <td>사유</td>
	                            <td>${map.REPORT_CONTENT}</td>
	                        </tr>
                        </c:if>
                        <tr>
                            <td>내용</td>
                            <td>${map.CONTENT}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
		<div class="row">
			<div class="col-12 d-flex justify-content-end px-0">
				<button type="button" class="btn btn-outline-dark"
					id="addBlackListbtn">피신고자 블랙리스트 추가</button>
				<button type="button" class="btn btn-outline-dark"
					id="targetBlind"><del>신고 대상 블라인드</del></button>
			</div>
		</div>
    </div>
    
    <script>
    	// checkbox 처리
    	$(document).ready(function() {
    		const type = ${map.TYPE}
    		const report_no = ${map.REPORT_NO}
    		if(type == 1) {
    	    	$("#checkBoxWrapper").children().eq(0).prop("checked", true);
    	    	return;
    		}
    		if(type == 2) {
    	    	$("#checkBoxWrapper").children().eq(1).prop("checked", true);
    	    	return;
    		}
    		if(type == 3) {
    	    	$("#checkBoxWrapper").children().eq(2).prop("checked", true);
    	    	return;
    		}
    	});
    	// 블랙리스트 추가
    	$("#addBlackListbtn").on("click", function() {
    		const type = ${map.TYPE}
    		$.ajax({
    			url: "${pageContext.request.contextPath}/admin/addBlackList.do?type="+type+"&target_no="+${map.TARGET_NO},
    		}).done(function(rs){
    			if(rs) {
    				alert("블랙리스트 추가 성공");
    				location.href = "${pageContext.request.contextPath}/admin/changeReportStatus&report_no="+${map.REPORT_NO};
    				window.close();
    				return;
    			}
    			alert("블랙리스트 추가 실패");
    			window.close();
    		}).fail(function(e){
    			console.log(e);
    		});
    	});
    	// 블라인드 처리(걍 뺄까)
    </script>
</body>
</html>