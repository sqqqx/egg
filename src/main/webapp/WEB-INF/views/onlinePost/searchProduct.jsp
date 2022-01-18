<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>상품 검색</title>
<style>
	#title{
		width: 90px;
	}
	#search{
		width: 70%;
	}
	th{
	   vertical-align : middle;
	   text-align : center;
	}
	#searchArea{
	   text-align : left;
	}
	td{
	   text-align : center;
	}
</style>
</head>
<body>
	<table class="table">
		<thead>
		  <tr>
			<th id="title">상품 검색</th>
			<th colspan="3" id="searchArea">
			    <input type="text" id="search" placeholder="상품번호/상품명/상세설명 으로 검색">
			    <button type="button" class="btn btn-info" id="searchBtn">검색</button>
			</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>재고 수량</th>
		  </tr>
		  
		  
		  <!-- <tr>
			<th>2</th>
			<td>Jacob</td>
			<td>Thornton</td>
			<td>@fat</td>
		  </tr>
		  <tr>
			<th>3</th>
			<td colspan="2">Larry the Bird</td>
			<td>@twitter</td>
		  </tr> -->
		</tbody>
	  </table>
	  <script>
	      $("#searchBtn").on("click",function(){
	    	  let value = $("#search").val();
	    	  $.ajax({
	    		  url : "/onlinePost/searchProduct.do"
	    		  ,type : "post"
	    		  ,data : {value:value}
	    	  }).done(function(data){
	    		  data.forEach(function(element){
	    				 var option= "<option>"+element+"</option>"
	    				 $("#category2").append(option);
	    		  })
	    	  }).fail(function(){
	    		  
	    	  })
	      })
	  </script>
</body>
</html>