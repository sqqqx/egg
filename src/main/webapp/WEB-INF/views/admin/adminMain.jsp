<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<title>관리자 홈</title>
<style>
.top {
	height: 200px !important;
}

.bottom {
	width: 100%;
}

.sector {
	height: 400px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="main-Wrapper d-flex justify-content-center pt-5">

		<!--사이드 바-->
		<div class="cls-sideBar">
			<%@include file="/WEB-INF/views/admin/adminSidebar.jsp"%>
		</div>

		<!-- 본문 -->
		<div class="container">
			<div class="row px-2 py-3">
				<div class="col sector top"> 
					
				</div>
			</div>
			<div class="row py-3">
				<div class="col-6 sectorWrapper">
					<div class="sector bottom">
						<canvas id="line-chart" style="height: 350px; width: 550px"></canvas>
					</div>
				</div>
				<div class="col-6 sectorWrapper">
					<div class="sector bottom">
						<span id="getUserNickname">접속자 명단</span>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script>
		// 가입자 통계
       const json = JSON.stringify(${json});
       const items = JSON.parse(json);
		// console.log(items);
		
		let labelList = new Array();
		let valueList = new Array();
       
       for(let item of items) {
    	  console.log(item.date);
    	  labelList.push(item.date);
    	  valueList.push(item.count);
       } 
       new Chart(document.getElementById("line-chart"), {
    	   type: 'line',
    	   data: {
    	     // labels: [0,1,2,3,4,5,6],
    	     labels: labelList,
    	     datasets: [
   	    	  /*  { 
    	          data: [10,22,12,32,1,5,9,23],
    	          label: "방문자",
    	          borderColor: "#3e95cd",
    	          fill: false
    	       },  */
    	       { 
    	         // data: [2,1,0,2,1,0,6],
    	         data: valueList,
    	         label: "가입자",
    	         borderColor: "#8e5ea2",
    	         fill: false
    	       }
    	     ]
    	   },
    	   options: {
    		 responsive: false,
    	     title: {
    	       display: true,
    	       text: '방문자 & 가입자 통계'
    	     }
    	   }
    	 });
       
       // 접속자 명단
       /* ws.onmessage = function(e){
			console.log(e.data);
			let msgObj = JSON.parse(e.data);
			console.log(msgObj);
			// 가공해서 append로 넣기
		} */
  	</script>
</body>
</html>