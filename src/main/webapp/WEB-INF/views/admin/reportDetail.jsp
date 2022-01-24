<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/admin/reportDetail.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>신고 상세</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <table class="cls-table">
                    <tbody>
                        <tr>
                            <td colspan="2">신고 상세 페이지(css미완성)</td>
                        </tr>
                        <tr class="smallRow">
                            <td>신고자</td>
                            <td>${map.USER_NICKNAME}</td>
                        </tr>
                        <tr class="smallRow">
                            <td>대상</td>
                            <c:choose>
                                <c:when test="${map.TYPE eq 1}">
                                    <div class="col-3">
                                        <td>게시글</td>
                                    </div>
                                </c:when>
                                <c:when test="${map.TYPE eq 2}">
                                    <div class="col-3">
                                        <td>댓글</td>
                                    </div>
                                </c:when>
                                <c:when test="${map.TYPE eq 3}">
                                    <div class="col-3">
                                        <td>쪽지</td>
                                    </div>
                                </c:when>
                            </c:choose>
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
                            <td>${map.REPORT_CONTENT}</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>${map.CONTENT}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>