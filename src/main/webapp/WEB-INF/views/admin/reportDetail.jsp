<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
<!-- <link rel="stylesheet" href="/resources/css/admin/reportDetail.css"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>신고 상세</title>
<style>
.container {
    max-width: 650px;
    padding-top: 50px;
    padding-bottom: 50px;
    padding: 32px;
    background: #fff;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
table, tr, td {
        border: 1px solid lightgray;
        box-sizing: border-box;
        border-radius: 5px;
    }
    .container {
        text-align: center;
    }
    .cls-table {
    	width: 100%;
        height: 600px;
    }
    .cls-body > tr:nth-child(1) > td {
    	height: 10%;
    }
    .smallRow > td{
    	height: 5%;
    }
    tbody > tr:nth-child(6) > td {
    	height: 15%;
    }
    .cls-body > tr:nth-child(1) > td{
		
	}
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <table class="cls-table">
                    <tbody class="cls-body">
                        <tr>
                            <td colspan="2">신고 조회</td>
                        </tr>
                        <tr class="smallRow">
                            <td>피신고자</td>
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
                        <tr>
                            <td>사유</td>
                            <c:choose>
                            	<c:when test="${map.REPORT_CONTENT ne null}">
                            		<td>${map.REPORT_CONTENT}</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>X</td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td>신고 대상</td>
                            <td>${map.CONTENT}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row pt-2">
		<div class="col-12 d-flex justify-content-center px-0">
			<button type="button" class="btn btn-outline-dark"
				id="addBlackListbtn">피신고자 블랙리스트 추가</button>
			<button type="button" class="btn btn-outline-dark"
				id="redirectTarget">해당 신고 대상으로 이동</button>
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
    	// 신고 대상으로 이동
    	$("#redirectTarget").on("click", function() {
    		const type = ${map.TYPE}
    		let target_no = ${map.TARGET_NO}
    		let checkViewCount = 1;
    		if(type == 1) {
    			redirect(target_no, checkViewCount);
    	    	return;
    		}
    		if(type == 2) {
    			target_no = ${map.POST_NO}
    			redirect(target_no, checkViewCount);
    	    	return;
    		}
    		if(type == 3) {
    			alert("쪽지에는 접근할 수 없습니다.");
    	    	return;
    		}
    	});
    	// 페이지 이동
    	function redirect(target_no, checkViewCount) {
        	target_no = parseInt(target_no);
        	if (!getCookie(target_no)) {
                setCookie(target_no);
                checkViewCount = 0;
            }
			//opener.location.href = "${pageContext.request.contextPath}/admin/toPostDetail?post_no="+target_no+"&checkViewCount="+checkViewCount;
			opener.location.href = "${pageContext.request.contextPath}/admin/toPostDetail?post_no="+target_no+"&checkViewCount="+checkViewCount;
			window.close();
        }
    	// 조회수 중복 방지
        function setCookie(post_no) {
            const expireDate = new Date();
            expireDate.setDate(expireDate.getDate() + 1);
            const key = "post_no_" + post_no;
            document.cookie = key + "=" + post_no + ";Expires" + expireDate;
        }
        function getCookie(post_no) {
            const key = "post_no_" + post_no;
            const value = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
            // console.log(value[2]);
            return value ? true : false;
        }
        
    </script>
    </body>
</html>