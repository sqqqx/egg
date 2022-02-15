<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<style>
		#title {
			text-align: center;
			font-size: 50pt;
		}
        #photoBtnBox {
            display: none;
        }

        .sub_location, .category2{
            display: none;
        }

        #introduction {
            width: 100%;
            height: 500px;
            resize: none;
        }

        .row {
            margin-bottom: 20px;
        }
        #addCategoryBtn, #delCategoryBtn, #confirmBtn, #cancelBtn {
            margin-left: 20px;
            width: 15%;
        }
        input {
            border: none;
            display: inline-block;
        }
        #cgListBox {
            margin: 10px auto;
            border: 3px solid grey;
            border-radius: 10px;
            width: 80%;
            height: 300px;
            text-align: center;
        }
        
    </style>
<head>
<meta charset="UTF-8">
<title>능력자 전환요청 페이지</title>
</head>
<body>
		<!-- 회원 정보 조회 -->
    <div class="container-fluid" id="myInfo">
        <div class="row">
        	<!-- 좌측 프로필 부분 -->
            <%@include file="/WEB-INF/views/member/profileSection.jsp" %>
            
            <div class="col-1"></div>
            
            <!-- 우측 능력자 전환 부분 -->
            <div class="col-8" id="userBox">
           		<form action="${pagecontext.request.contextPath}/member/convertExpert.do" enctype="multipart/form-data" method="post" id="ceForm">
            		<div class="row" id="title"><p>능력자 전환</p></div>
	                <div class="row">
	                    <div class="col-2">
	                        활동지역
	                    </div>
	                    <div class="col-2">
	                        <select name="location1" id="location1" class="main_location">
	                            <option value="" hidden>도 / 시</option>
	                            <option value="seoul">서울특별시</option> <option value="busan">부산광역시</option> <option value="daegu">대구광역시</option>
	                            <option value="incheon">인천광역시</option> <option value="gwangju">광주광역시</option> <option value="daejeon">대전광역시</option>
	                            <option value="ulsan">울산광역시</option> <option value="sejong">세종특별자치시</option> <option value="gyeonggi">경기도</option>
	                            <option value="gangwon">강원도</option> <option value="chungbuk">충청북도</option> <option value="chungnam">충청남도</option>
	                            <option value="jeonbuk">전라북도</option> <option value="jeonnam">전라남도</option> <option value="gyeongbuk">경상북도</option>
	                            <option value="gyeongnam">경상남도</option> <option value="jeju">제주특별자치도</option>
	                        </select>
	                    </div>
	                    <div class="col-2">
	                        <select name="location2" id="location2" class="sub_location seoul">
	                            <option value="" hidden>서울특별시</option>
	                            <option value="종로구">종로구</option>	<option value="중구">중구</option>	<option value="용산구">용산구</option>
	                            <option value="성동구">성동구</option>	<option value="광진구">광진구</option>	<option value="동대문구">동대문구</option>
	                            <option value="중랑구">중랑구</option>	<option value="성북구">성북구</option>	<option value="강북구">강북구</option>
	                            <option value="도봉구">도봉구</option>	<option value="노원구">노원구</option>	<option value="은평구">은평구</option>
	                            <option value="서대문구">서대문구</option>	<option value="마포구">마포구</option>	<option value="양천구">양천구</option>
	                            <option value="강서구">강서구</option>	<option value="구로구">구로구</option>	<option value="금천구">금천구</option>
	                            <option value="영등포구">영등포구</option>	<option value="동작구">동작구</option>	<option value="관악구">관악구</option>
	                            <option value="서초구">서초구</option>	<option value="강남구">강남구</option>	<option value="송파구">송파구</option>
	                            <option value="강동구">강동구</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location busan">
	                            <option value="" hidden>부산광역시</option>
	                            <option value="중구">중구</option>	<option value="서구">서구</option>	<option value="동구">동구</option>
	                            <option value="영도구">영도구</option>	<option value="부산진구">부산진구</option>	<option value="동래구">동래구</option>
	                            <option value="남구">남구</option>	<option value="북구">북구</option>	<option value="해운대구">해운대구</option>
	                            <option value="사하구">사하구</option>	<option value="금정구">금정구</option>	<option value="강서구">강서구</option>
	                            <option value="연제구">연제구</option>	<option value="수영구">수영구</option>	<option value="사상구">사상구</option>
	                            <option value="기장군">기장군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location daegu">
	                            <option value="" hidden>대구광역시</option>
	                            <option value="중구">중구</option>	<option value="동구">동구</option>	<option value="서구">서구</option>
	                            <option value="남구">남구</option>	<option value="북구">북구</option>	<option value="수성구">수성구</option>
	                            <option value="달서구">달서구</option>	<option value="달성군">달성군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location incheon">
	                            <option value="" hidden>인천광역시</option>
	                            <option value="중구">중구</option>	<option value="동구">동구</option>	<option value="미추홀구">미추홀구</option>
	                            <option value="연수구">연수구</option>	<option value="남동구">남동구</option>	<option value="부평구">부평구</option>
	                            <option value="계양구">계양구</option>	<option value="서구">서구</option>	<option value="강화군">강화군</option>
	                            <option value="옹진군">옹진군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location gwangju">
	                            <option value="" hidden>광주광역시</option>
	                            <option value="동구">동구</option>	<option value="서구">서구</option>	<option value="남구">남구</option>
	                            <option value="북구">북구</option>	<option value="광산구">광산구</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location daejeon">
	                            <option value="" hidden>대전광역시</option>
	                            <option value="동구">동구</option>	<option value="중구">중구</option>	<option value="서구">서구</option>
	                            <option value="유성구">유성구</option>	<option value="대덕구">대덕구</option>	
	                        </select>
	                        <select name="location2" id="location2" class="sub_location ulsan">
	                            <option value="" hidden>울산광역시</option>
	                            <option value="중구">중구</option>	<option value="남구">남구</option>	<option value="동구">동구</option>
	                            <option value="북구">북구</option>	<option value="울주군">울주군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location sejong">
	                            <option value="" hidden>세종특별자치시</option>
	                            <option value="가람동">가람동</option>	<option value="한솔동">한솔동</option>	<option value="도담동">도담동</option>
	                            <option value="어진동">어진동</option>	<option value="보람동">보람동</option>	<option value="소담동">소담동</option>
	                            <option value="반곡동">반곡동</option>	<option value="나성동">나성동</option>	<option value="새롬동">새롬동</option>
	                            <option value="다정동">다정동</option>	<option value="아름동">아름동</option>	<option value="종촌동">종촌동</option>
	                            <option value="고운동">고운동</option>	<option value="대평동">대평동</option>		
	                        </select>
	                        <select name="location2" id="location2" class="sub_location gyeonggi">
	                            <option value="" hidden>경기도</option>
	                            <option value="수원시">수원시</option>	<option value="고양시">고양시</option>	<option value="용인시">용인시</option>
	                            <option value="성남시">성남시</option>	<option value="부천시">부천시</option>	<option value="화성시">화성시</option>
	                            <option value="안산시">안산시</option>	<option value="남양주시">남양주시</option>	<option value="안양시">안양시</option>
	                            <option value="평택시">평택시</option>	<option value="시흥시">시흥시</option>	<option value="파주시">파주시</option>
	                            <option value="의정부시">의정부시</option>	<option value="김포시">김포시</option>	<option value="광주시">광주시</option>
	                            <option value="광명시">광명시</option>	<option value="군포시">군포시</option>	<option value="하남시">하남시</option>
	                            <option value="오산시">오산시</option>	<option value="양주시">양주시</option>	<option value="이천시">이천시</option>
	                            <option value="구리시">구리시</option>	<option value="안성시">안성시</option>	<option value="포천시">포천시</option>
	                            <option value="의왕시">의왕시</option>	<option value="양평군">양평군</option>	<option value="여주시">여주시</option>
	                            <option value="동두천시">동두천시</option>	<option value="가평군">가평군</option>	<option value="과천시">과천시</option>
	                            <option value="연천군">연천군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location gangwon">
	                            <option value="" hidden>강원도</option>
	                            <option value="춘천시">춘천시</option>	<option value="원주시">원주시</option>	<option value="강릉시">강릉시</option>
	                            <option value="동해시">동해시</option>	<option value="태백시">태백시</option>	<option value="속초시">속초시</option>
	                            <option value="삼척시">삼척시</option>	<option value="홍천군">홍천군</option>	<option value="횡성군">횡성군</option>
	                            <option value="영월군">영월군</option>	<option value="평창군">평창군</option>	<option value="정선군">정선군</option>
	                            <option value="철원군">철원군</option>	<option value="화천군">화천군</option>	<option value="양구군">양구군</option>
	                            <option value="인제군">인제군</option>	<option value="고성군">고성군</option>	<option value="양양군">양양군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location chungbuk">
	                            <option value="" hidden>충청북도</option>
	                            <option value="청주시">청주시</option>	<option value="충주시">충주시</option>	<option value="제천시">제천시</option>
	                            <option value="보은군">보은군</option>	<option value="옥천군">옥천군</option>	<option value="영동군">영동군</option>
	                            <option value="증평군">증평군</option>	<option value="진천군">진천군</option>	<option value="괴산군">괴산군</option>
	                            <option value="음성군">음성군</option>	<option value="단양군">단양군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location chungnam">
	                            <option value="" hidden>충청남도</option>
	                            <option value="천안시">천안시</option>	<option value="공주시">공주시</option>	<option value="보령시">보령시</option>
	                            <option value="아산시">아산시</option>	<option value="서산시">서산시</option>	<option value="논산시">논산시</option>
	                            <option value="계룡시">계룡시</option>	<option value="당진시">당진시</option>	<option value="금산군">금산군</option>
	                            <option value="부여군">부여군</option>	<option value="서천군">서천군</option>	<option value="청양군">청양군</option>
	                            <option value="홍성군">홍성군</option>	<option value="예산군">예산군</option>	<option value="태안군">태안군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location jeonbuk">
	                            <option value="" hidden>전라북도</option>
	                            <option value="전주시">전주시</option>	<option value="군산시">군산시</option>	<option value="익산시">익산시</option>
	                            <option value="정읍시">정읍시</option>	<option value="남원시">남원시</option>	<option value="김제시">김제시</option>
	                            <option value="완주군">완주군</option>	<option value="진안군">진안군</option>	<option value="무주군">무주군</option>
	                            <option value="장수군">장수군</option>	<option value="임실군">임실군</option>	<option value="순창군">순창군</option>
	                            <option value="고창군">고창군</option>	<option value="부안군">부안군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location jeonnam">
	                            <option value="" hidden>전라남도</option>
	                            <option value="목포시">목포시</option>	<option value="여수시">여수시</option>	<option value="순천시">순천시</option>
	                            <option value="나주시">나주시</option>	<option value="광양시">광양시</option>	<option value="담양군">담양군</option>
	                            <option value="곡성군">곡성군</option>	<option value="구례군">구례군</option>	<option value="고흥군">고흥군</option>
	                            <option value="보성군">보성군</option>	<option value="화순군">화순군</option>	<option value="장흥군">장흥군</option>
	                            <option value="강진군">강진군</option>	<option value="해남군">해남군</option>	<option value="영암군">영암군</option>
	                            <option value="무안군">무안군</option>	<option value="함평군">함평군</option>	<option value="영광군">영광군</option>
	                            <option value="장성군">장성군</option>	<option value="완도군">완도군</option>	<option value="진도군">진도군</option>
	                            <option value="신안군">신안군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location gyeongbuk">
	                            <option value="" hidden>경상북도</option>
	                            <option value="포항시">포항시</option>	<option value="경주시">경주시</option>	<option value="김천시">김천시</option>
	                            <option value="안동시">안동시</option>	<option value="구미시">구미시</option>	<option value="영주시">영주시</option>
	                            <option value="영천시">영천시</option>	<option value="상주시">상주시</option>	<option value="문경시">문경시</option>
	                            <option value="경산시">경산시</option>	<option value="군위군">군위군</option>	<option value="의성군">의성군</option>
	                            <option value="청송군">청송군</option>	<option value="영양군">영양군</option>	<option value="영덕군">영덕군</option>
	                            <option value="청도군">청도군</option>	<option value="고령군">고령군</option>	<option value="성주군">성주군</option>
	                            <option value="칠곡군">칠곡군</option>	<option value="예천군">예천군</option>	<option value="봉화군">봉화군</option>
	                            <option value="울진군">울진군</option>	<option value="울릉군">울릉군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location gyeongnam">
	                            <option value="" hidden>경상남도</option>
	                            <option value="창원시">창원시</option>	<option value="진주시">진주시</option>	<option value="통영시">통영시</option>
	                            <option value="사천시">사천시</option>	<option value="김해시">김해시</option>	<option value="밀양시">밀양시</option>
	                            <option value="거제시">거제시</option>	<option value="양산시">양산시</option>	<option value="의령군">의령군</option>
	                            <option value="함안군">함안군</option>	<option value="창녕군">창녕군</option>	<option value="고성군">고성군</option>
	                            <option value="남해군">남해군</option>	<option value="하동군">하동군</option>	<option value="산청군">산청군</option>
	                            <option value="함양군">함양군</option>	<option value="거창군">거창군</option>	<option value="합천군">합천군</option>
	                        </select>
	                        <select name="location2" id="location2" class="sub_location jeju">
	                            <option value="" hidden>제주특별자치도</option>
	                            <option value="제주시">제주시</option>	<option value="서귀포시">서귀포시</option>
	                        </select>
	                    </div>
	                </div>
                	<div class="row">
                    	<div class="col-2">
                        	자기소개
                    	</div>
                    	<div class="col-8">
	                        <textarea name="introduction" id="introduction"></textarea>
    	                </div>
        	        </div>
            	    <div id="categoryBox">
                    <div class="row">
                        <div class="col-2">카테고리 선택</div>
                        <div class="col-2">
                            <select name="category1" class="category1">
                                <option value="c10">운동</option>
                                <option value="c20">요리</option>
                                <option value="c30">외국어</option>
                                <option value="c40">IT</option>
                                <option value="c50">라이프</option>
                                <option value="c60">드로잉</option>
                                <option value="c70">공예</option>
                                <option value="c80">아동교육</option>
                            </select>
                        </div>
                        <div class="col-2">
	                            <select name="category2" class="c10 category2">
	                                <option value="11">요가</option>
	                                <option value="12">필라테스</option>
	                                <option value="13">피트니스</option>
	                                <option value="14">스트레칭</option>
	                                <option value="15">발레</option>
	                                <option value="16">사이클</option>
	                                <option value="19">기타</option>
	                            </select>
	                            <select name="category2" class="c20 category2">
	                                <option value="21">아시안</option>
	                                <option value="22">서양</option>
	                                <option value="23">제빵</option>
	                                <option value="24">비건</option>
	                                <option value="25">음료</option>
	                                <option value="26">다이어트식</option>
	                                <option value="29">기타</option>
	                            </select>
	                            <select name="category2" class="c30 category2">
	                                <option value="31">영어</option>
	                                <option value="32">중국어</option>
	                                <option value="33">스페인어</option>
	                                <option value="34">일본어</option>
	                                <option value="35">불어</option>
	                                <option value="36">독일어</option>
	                                <option value="39">기타</option>
	                            </select>
	                            <select name="category2" class="c40 category2">
	                                <option value="41">프로그래밍</option>
	                                <option value="42">정보보안</option>
	                                <option value="43">모바일App개발</option>
	                                <option value="44">머신러닝</option>
	                                <option value="45">데이터분석</option>
	                                <option value="46">게임개발</option>
	                                <option value="49">기타</option>
	                            </select>
	                            <select name="category2" class="c50 category2">
	                                <option value="51">뷰티</option>
	                                <option value="52">명상</option>
	                                <option value="53">반려동물</option>
	                                <option value="54">타로,사주</option>
	                                <option value="55">댄스</option>
	                                <option value="56">인문학</option>
	                                <option value="59">기타</option>
	                            </select>
	                            <select name="category2" class="c60 category2">
	                                <option value="61">펜,연필</option>
	                                <option value="62">마카</option>
	                                <option value="63">색연필</option>
	                                <option value="64">수채화</option>
	                                <option value="65">캘리그라피</option>
	                                <option value="66">아크릴화</option>
	                                <option value="67">디지털드로잉</option>
	                                <option value="69">기타</option>
	                            </select>
	                            <select name="category2" class="c70 category2">
	                                <option value="71">뜨개질,자수</option>
	                                <option value="72">패브리공예</option>
	                                <option value="73">종이공예</option>
	                                <option value="74">플라워공예</option>
	                                <option value="75">비누캔들</option>
	                                <option value="76">나무,라탄공예</option>
	                                <option value="79">기타</option>
	                            </select>
	                            <select name="category2" class="c80 category2">
	                                <option value="81">자연,과학</option>
	                                <option value="82">신체,건강</option>
	                                <option value="83">수학,코딩</option>
	                                <option value="84">기타</option>
	                            </select>
                        	</div>
                        	<button type="button" id="addCategoryBtn" class="btn btn-success">카테고리 추가</but>
                        	<button type="button" id="delCategoryBtn" class="btn btn-danger">카테고리 삭제</but>        
                   		</div>
                    <div class="row" id="cgListBox">
						
					</div>
           	  	</div>
                <div class="row justify-content-center">
                    <button type="button" id="cancelBtn" class="btn btn-secondary">돌아가기</but>
                    <button type="button" id="confirmBtn" class="btn btn-primary">전환신청</but>
                </div>
                <div class="row" hidden>
                    <div class="col">
                    	<input type="text" name="expert_id" value="${loginSession.user_id}"/>
                        <input type="text" id="active_area" name="active_area"/>
                    </div>
                </div>  
           	</form>
           </div>
       </div>
    </div>
    
    <script>
	    // 카테고리 추가 버튼
	    $("#addCategoryBtn").on("click", function(){
	        let parentCn = $(".category1 option:selected").val();
	        let childCn = $("." + parentCn + " option:selected").val();
	        // 중복검사
	        if($("#cgListBox #childCn2").val() === childCn || $("#cgListBox #childCn1").val() === childCn){
	            console.log("중복된 카테고리 입니다.");
	            alert("중복된 카테고리 입니다.");
	            return ;
	        }  
	        if($("#cgListBox div").is("#cate3")){
	            alert("카테고리 설정은 최대 3개까지 가능합니다.");
	            return ;
	        } else if($("#cgListBox div").is("#cate2")) {
	            addCt(3, parentCn, childCn);
	        } else if($("#cgListBox div").is("#cate1")){
	            addCt(2, parentCn, childCn);
	        } else {
	            addCt(1, parentCn, childCn);
	        }
	    })
	    
	    // 카테고리 삭제 버튼
	    $("#delCategoryBtn").on("click", function(e){
	        if($("#cgListBox div").is("#cate3")){
	            $("#cgListBox div").remove("#cate3");
	            return ;
	        } else if($("#cgListBox div").is("#cate2")) {
	            $("#cgListBox div").remove("#cate2");
	            return ;
	        } else if($("#cgListBox div").is("#cate1")){
	            $("#cgListBox div").remove("#cate1");
	            return ;
	        } else {
	            alert("삭제할 카테고리가 없습니다.");
	        }
	    })
	    
	    // 카테고리 대분류 선택 시 소분류 창 보이기
	    $("#categoryBox select").on("click", function(e){ 
	        console.log($(e.target).val());
	        let cn = $(".category1").val();
	        let disNon = $(".category2").css("display", "none");
	        if(cn === "c10") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c20") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c30") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c40") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c50") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c60") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c70") {
	            disNon
	            $("." + cn).css("display", "block");
	        } else if(cn === "c80") {
	            disNon
	            $("." + cn).css("display", "block");
	        }
	    })
    
	    // 카테고리 추가 함수
		    let i = 0;
		    function addCt(i, parentCn, childCn) {
		        $("#cgListBox").append($("<div id='cate" + i + "' class='row'>"
		        + "<input type='text' class='col-4' value='"+ i + "번째 카테고리: " 
		        + $(".category1 option:selected").html() + " > " 
		        + $("." + parentCn + " option:selected").html() + "'/>"
		        + "<input type='checkbox' class='col-3' name='categoryNumbers' id='childCn" + i + "' value='" + childCn + "' checked hidden/>"
		        + "<input type='file' class='col-3 form-control searchFile' name='careerFiles" + "' id='searchFile" + i +"'/>"
		        + "</div>"));
		    }
		    
		    $(document).on("click", function(e){
		    	console.log($(e.target).parents());
		    	console.log($(e.target));
		    })
		    
		    
		 // 파일 선택
	        $("#cgListBox #cate1 #searchFile1").change(function(e) {
	        	console.log("증명파일 선택");
	            //Get count of selected files
	            var countFiles = $(this)[0].files.length;

	            var filePath = $(this).val();
	            console.log("파일경로: " + filePath);
	            var extn = filePath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();

	            // 확장자 유효성 검사
	            if (extn !== "gif" || extn !== "png" || extn !== "jpg" || extn !== "jpeg" || extn !== "pdf") {
	            	alert("gif, png, jpg, jpeg, pdf 파일만 선택가능합니다.");
	            	$(this).val("");
	            }
	            
	        });     
	    
	   // 도/시 선택
	    let sl = "";
	    $(".main_location").on("click", function(){
	        let sl = $(".main_location").val();
	        console.log(sl);
	        $(".sub_location").css("display", "none");
	        $("." + sl).css("display", "inline");
	    });
	    
        // 돌아가기 버튼
        $("#cancelBtn").on("click", function(){
        	$(location).attr("href", "${pagecontext.request.contextPath}/member/toUserInformation?user_id=${loginSession.user_id}");
        })
        
        // 전환신청 버튼
        $("#confirmBtn").on("click", function(){
        	console.log("전환신청버튼 클릭");
        	sl = $(".main_location").val();
        	
        	// 주소 input태그에 입력
            if($("#location1").val() === 'seoul'){
                $("#active_area").val("서울특별시 " + $("."+sl).val());
            } else if($("#location1").val() === 'busan'){
                $("#active_area").val("부산광역시 " + $("."+sl).val());
            } else if($("#location1").val() === 'daegu'){
                $("#active_area").val("대구광역시 " + $("."+sl).val());
            } else if($("#location1").val() === 'incheon'){
                $("#active_area").val("인천광역시 " + $("."+sl).val());
            } else if($("#location1").val() === 'gwangju'){
                $("#active_area").val("광주광역시 " + $("."+sl).val());
            } else if($("#location1").val() === 'daejeon'){
                $("#active_area").val("대전광역시 " + $("."+sl).val());
            } else if($("#location1").val() === 'ulsan'){
                $("#active_area").val("울산광역시 " + $("."+sl).val());
            } else if($("#location1").val() === 'sejong'){
                $("#active_area").val("세종특별자치시");
            } else if($("#location1").val() === 'gyeonggi'){
                $("#active_area").val("경기도 " + $("."+sl).val());
            } else if($("#location1").val() === 'gangwon'){
                $("#active_area").val("강원도 " + $("."+sl).val());
            } else if($("#location1").val() === 'chungbuk'){
                $("#active_area").val("충청북도 " + $("."+sl).val());
            } else if($("#location1").val() === 'chungnam'){
                $("#active_area").val("충청남도 " + $("."+sl).val());
            } else if($("#location1").val() === 'jeonbuk'){
                $("#active_area").val("전라북도 " + $("."+sl).val());
            } else if($("#location1").val() === 'jeonnam'){
            	$("#location1").children("[value*=jeonnam]").prop("selected", true);
                $("#active_area").val("전라남도 " + $("."+sl).val());
            } else if($("#location1").val() === 'gyeongbuk'){
                $("#active_area").val("경상북도 " + $("."+sl).val());
            } else if($("#location1").val() === 'gyeongnam'){
                $("#active_area").val("경상남도 " + $("."+sl).val());
            } else if($("#location1").val() === 'jeju'){
                $("#active_area").val("제주특별자치도 " + $("."+sl).val());
            }
        	
         // 유효성 검사
        	// 지역
        	if($("#active_area").val() === "") {
        		alert("지역을 입력해주세요");
        		return ;
        	}
        	
        	// 자기소개
        	if($("#introduction").val() === ""){
        		alert("자기소개를 입력해주세요");
        		return ;
        	}
        	
        	// 카테고리
        	if(!$("#cgListBox div").is("#cate1")) {
        		alert("카테고리를 선택해주세요");
        		return ;
        	}
        	
        	// 증명파일
        	let filePath = "";
        	if($("#cgListBox div").is("#cate3")){
        		filePath = $("#cgListBox #cate3 #searchFile3").val(); 
        		if(filePath === ""){
        			alert("3번째 카테고리 증명파일을 선택해주세요");
    	            return ;	
        		}
	        } else if($("#cgListBox div").is("#cate2")){
	        	filePath = $("#cgListBox #cate2 #searchFile2").val(); 
        		if(filePath === ""){
        			alert("2번째 카테고리 증명파일을 선택해주세요");
    	            return ;	
        		}
	        } else if($("#cgListBox div").is("#cate1")){
	        	filePath = $("#cgListBox #cate1 #searchFile1").val(); 
        		if(filePath === ""){
        			alert("1번째 카테고리 증명파일을 선택해주세요");
    	            return ;	
        		} 
	        }
        	
        	
        	filePath = $("#cgListBox #cate1 #searchFile1").val();
        	console.log("첫번째 경로: " + filePath);
        	let extn = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
        	console.log("첫번째 확장자: " + extn);
        	if (extn !== "gif" && extn !== "png" && extn !== "jpg" && extn !== "jpeg" && extn !== "pdf") {
            	alert("gif, png, jpg, jpeg, pdf 파일만 선택가능합니다.");
            	$("#cgListBox #cate1 #searchFile1").val("");
            	return ;
            }
        	filePath = $("#cgListBox #cate2 #searchFile2").val();
        	if(filePath !== undefined) {
        		console.log("두번째 경로: " + filePath);
            	extn = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
            	console.log("두번째 확장자: " + extn);
            	if (extn !== "gif" && extn !== "png" && extn !== "jpg" && extn !== "jpeg" && extn !== "pdf") {
                	alert("gif, png, jpg, jpeg, pdf 파일만 선택가능합니다.");
                	$("#cgListBox #cate2 #searchFile2").val("");
                	return ;
                }
        	}
        	filePath = $("#cgListBox #cate3 #searchFile3").val();
        	if(filePath !== undefined) {
        		console.log("세번째 경로: " + filePath);
            	extn = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
            	console.log("세번째 확장자: " + extn);
            	if (extn !== "gif" && extn !== "png" && extn !== "jpg" && extn !== "jpeg" && extn !== "pdf") {
                	alert("gif, png, jpg, jpeg, pdf 파일만 선택가능합니다.");
                	$("#cgListBox #cate3 #searchFile3").val("");
                	return ;
                }
        	}
        	$("#ceForm").submit();
        })
        
    </script>
</body>
</html>
