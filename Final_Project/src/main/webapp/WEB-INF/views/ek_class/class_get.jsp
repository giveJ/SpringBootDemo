<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<style type="text/css">
.class-data li {
	list-style-type: none;
	margin: 40px;
	width: 900px;
	height: 200px;
}

.search_div {
	width: 100%;
	height: 50px;
}

.search_content {
	text-align: center;
}

.middle_content {
	margin: auto;
	height: 500px;
}

/* 달력 영역 css  start------------------------------------------------------------ */
.sec_cal {
	width: 300px;
	margin: 0 auto;
	font-family: "NotoSansR";
	position: fixed;
	top: 250px;
	right: 0;
	float: right;
}

.sec_cal .cal_nav {
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: 700;
	font-size: 48px;
	line-height: 78px;
}

.sec_cal .cal_nav .year-month {
	width: 300px;
	text-align: center;
	line-height: 1;
}

.sec_cal .cal_nav .nav {
	display: flex;
	border: 1px solid #333333;
	border-radius: 5px;
}

.sec_cal .cal_nav .go-prev, .sec_cal .cal_nav .go-next {
	display: block;
	width: 50px;
	height: 78px;
	font-size: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sec_cal .cal_nav .go-prev::before, .sec_cal .cal_nav .go-next::before {
	content: "";
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	transition: border 0.1s;
}

.sec_cal .cal_nav .go-prev:hover::before, .sec_cal .cal_nav .go-next:hover::before
	{
	border-color: #ed2a61;
}

.sec_cal .cal_nav .go-prev::before {
	transform: rotate(-135deg);
}

.sec_cal .cal_nav .go-next::before {
	transform: rotate(45deg);
}

.sec_cal .cal_wrap {
	padding-top: 40px;
	position: relative;
	margin: 0 auto;
}

.sec_cal .cal_wrap .days {
	display: flex;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
}

.sec_cal .cal_wrap::after {
	top: 368px;
}

.sec_cal .cal_wrap .day {
	display: flex;
	align-items: center;
	justify-content: center;
	width: calc(100%/ 7);
	text-align: left;
	color: #999;
	font-size: 12px;
	text-align: center;
	border-radius: 5px
}

.current.today {
	background: rgb(242, 242, 242);
}

.sec_cal .cal_wrap .dates {
	display: flex;
	flex-flow: wrap;
	height: 290px;
}

.sec_cal .cal_wrap .day:nth-child(7n -1) {
	color: #3c6ffa;
}

.sec_cal .cal_wrap .day:nth-child(7n) {
	color: #ed2a61;
}

.sec_cal .cal_wrap .day.disable {
	color: #ddd;
}

.dates :hover {
	background-color: lightgreen;
}

/* 달력 영역 css  end------------------------------------------------------------ */
/* 내용 영역 css start------------------------------------------------------------ */
.middle_content {
	width: 500px;
	height: 800px;
	margin: 0;
}

.middle_content_inner {
	width: 500px;
	height: 800px;
	margin: 0;
}

.class_content {
	width: 500px;
}

.button_und {
	width: auto;
	margin: 0;
	padding: 0;
	font-size: 12px;
	min-width: 70px;
	overflow-y: auto;
}

.btn {
	margin: auto;
	width: 900px;
}

.jss528 {
	top: 4rem;
	z-index: 50;
	position: sticky;
	background: #FAFAFA;
	margin-top: 30px;
	overflow-y: auto;
}

jss254 {
	background: #FAFAFA;
}

.css-pc1mzd {
	overflow: hidden;
	min-height: 48px;
	display: flex;
}

.css-12qnib {
	position: relative;
	display: inline-block;
	flex: 1 1 auto;
	white-space: nowrap;
	overflow: auto hidden;
}

.css-15hia5t.Mui-selected {
	opacity: 1;
}

.jss256 {
	color: #1F283D;
	font-weight: 700;
}

.jss255 {
	width: 60px;
	min-width: 100px;
	word-spacing: -1px;
}

.css-15hia5t {
	display: inline-flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	box-sizing: border-box;
	-webkit-tap-highlight-color: transparent;
	background-color: transparent;
	outline: 0px;
	border: 0px;
	margin: 0px;
	border-radius: 0px;
	cursor: pointer;
	user-select: none;
	vertical-align: middle;
	appearance: none;
	text-decoration: none;
	font-family: "Noto Sans KR", serif;
	font-weight: 500;
	font-size: 0.875rem;
	line-height: 1.25;
	text-transform: uppercase;
	max-width: 360px;
	min-width: 90px;
	position: relative;
	min-height: 48px;
	flex-shrink: 0;
	padding: 12px 16px;
	overflow: hidden;
	white-space: normal;
	text-align: center;
	flex-direction: column;
	color: inherit;
	opacity: 0.6;
}

button {
	appearance: auto;
	writing-mode: horizontal-tb !important;
	font-style:;
	font-variant-ligatures:;
	font-variant-caps:;
	font-variant-numeric:;
	font-variant-east-asian:;
	font-weight:;
	font-stretch:;
	font-size:;
	font-family:;
	text-rendering: auto;
	color: buttontext;
	letter-spacing: normal;
	word-spacing: normal;
	line-height: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: center;
	align-items: flex-start;
	cursor: default;
	box-sizing: border-box;
	background-color: buttonface;
	margin: 0em;
	padding: 1px 6px;
	border-width: 2px;
	border-style: outset;
	border-color: buttonborder;
	border-image: initial;
}

.css-12qnib {
	position: relative;
	display: inline-block;
	flex: 1 1 auto;
	white-space: nowrap;
	overflow: auto hidden;
}

.css-54rhrc {
	position: absolute;
	height: 2px;
	bottom: 0px;
	width: 100%;
	transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	background-color: rgb(242, 131, 22);
}

.css-k008qs {
	display: flex;
}

hr {
	display: block;
	unicode-bidi: isolate;
	margin-block-start: 0.5em;
	margin-block-end: 0.5em;
	margin-inline-start: auto;
	margin-inline-end: auto;
	overflow: hidden;
	border-style: inset;
	border-width: 1px;
}

.css-39bbo6 {
	margin: 0px;
	flex-shrink: 0;
	border-width: 0px 0px thin;
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.12);
}
/* 내용 영역 css end------------------------------------------------------------ */
</style>
</head>
<body>
	<br />
	<hr />
	<br />
	<%-- 강의 상세 페이지 ---------------------------------------------------------------------------------------------------- --%>
	<div class="middle_content">
		<div class="middle_content_inner">
			<div class="top"></div>
			<ul class="class-data">
				<li data-cno="${lvo.cno}">
					<div>
						<input type="hidden" id="1">
						<c:out value="${lvo.class_name }"></c:out>
						<br /> <br />
						<c:out value="${lvo.class_tel }"></c:out>
						<br /> <br />
						<c:out value="${lvo.class_type }"></c:out>
						<br /> <br />
						<c:out value="${lvo.class_intro }"></c:out>
						<br /> <br />
						<c:out value="${lvo.class_detail }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.class_runtime }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.class_price }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.tutor_intro }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.tutor_nickname }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.keyword }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.class_loc }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.class_loc_detail }"></c:out>
						<br /> <br /> <br /> <br />
						<c:out value="${lvo.class_start }"></c:out> ~ <c:out value="${lvo.class_end }"></c:out>
						<br /> <br /> <br /> <br />
					</div>
				</li>
			</ul>
		</div>
	</div>
	<%-- 사이드 달력 영역 start-------------------------------------------------------------------------------------------------------------- --%>


	<div class="sec_cal">
		<div class="cal_nav">
			<a href="javascript:;" class="nav-btn go-prev">prev</a>
			<div class="year-month"></div>
			<a href="javascript:;" class="nav-btn go-next">next</a>
		</div>
		<div class="cal_wrap">
			<div class="days">
				<div class="day">MON</div>
				<div class="day">TUE</div>
				<div class="day">WED</div>
				<div class="day">THU</div>
				<div class="day">FRI</div>
				<div class="day">SAT</div>
				<div class="day">SUN</div>
			</div>
			<div class="dates"></div>
		</div>
	</div>
	<div class="schedule">
		<div class="time"></div>
	</div>



	<%-- 사이드 달력 영역 end-------------------------------------------------------------------------------------------------------------- --%>
	<%-- 지도 api --%>
	<div id="map" style="width: 500px; height: 350px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	7840c10e2735fd68e9d55828eb8a339f&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(function() {

			//클래스 상세 내역-----------------------------------------------------------------------------------------

			//클래스 상세 내역-----------------------------------------------------------------------------------------

			//달력 영역 start------------------------------------------------------------------------------------------	

			$(document).ready(function() {
				calendarInit();
			});
			/*
			 달력 렌더링 할 때 필요한 정보 목록 

			 현재 월(초기값 : 현재 시간)
			 금월 마지막일 날짜와 요일
			 전월 마지막일 날짜와 요일
			 */

			function calendarInit() {

				// 날짜 정보 가져오기
				var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
				var utc = date.getTime()
						+ (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
				var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
				var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

				var thisMonth = new Date(today.getFullYear(), today.getMonth(),today.getDate());
				// 달력에서 표기하는 날짜 객체

				var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
				var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
				var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
				console.log(currentDate);

				// kst 기준 현재시간
				// console.log(thisMonth);

				// 캘린더 렌더링
				renderCalender(thisMonth);

				function renderCalender(thisMonth) {

					// 렌더링을 위한 데이터 정리
					currentYear = thisMonth.getFullYear();
					currentMonth = thisMonth.getMonth();
					currentDate = thisMonth.getDate();

					// 이전 달의 마지막 날 날짜와 요일 구하기
					var startDay = new Date(currentYear, currentMonth, 0);
					var prevDate = startDay.getDate();
					var prevDay = startDay.getDay();

					// 이번 달의 마지막날 날짜와 요일 구하기
					var endDay = new Date(currentYear, currentMonth + 1, 0);
					var nextDate = endDay.getDate();
					var nextDay = endDay.getDay();

					// console.log(prevDate, prevDay, nextDate, nextDay);

					// 현재 월 표기
					$('.year-month').text(currentYear + '.' + (currentMonth + 1));

					// 렌더링 html 요소 생성
					calendar = document.querySelector('.dates')
					calendar.innerHTML = '';

					// 지난달
					for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
						calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i+ '</div>'
					}
					// 이번달
					for (var i = 1; i <= nextDate; i++) {
						calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
					}
					// 다음달
					for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
						calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
					}

					// 오늘 날짜 표기
					if (today.getMonth() == currentMonth) {
						todayDate = today.getDate();
						var currentMonthDate = document.querySelectorAll('.dates .current');
						currentMonthDate[todayDate - 1].classList.add('today');
					}
				}

				// 이전달로 이동
				$('.go-prev').on('click', function() {
					thisMonth = new Date(currentYear, currentMonth - 1, 1);
					renderCalender(thisMonth);
				});

				// 다음달로 이동
				$('.go-next').on('click', function() {
					thisMonth = new Date(currentYear, currentMonth + 1, 1);
					renderCalender(thisMonth);
				});

				 $(".dates").click(
						function() {
							str = '';
							str += '<button>원하는 강의 시간 추가</button>';

							$(".schedule").append(str);
							$("button").click(
									function(e) {
										e.preventDefault();
										str1 = '';
										str1 += '<form>';
										str1 += '<input type="time">' + '~'
												+ '<input type="time">';
										str1 += '</form>';
										str1 += '<input type="submit">';

										$(".time").append(str1);

									});

						}); 
			}

			//달력 영역 end------------------------------------------------------------------------------------------	
			//지도 api  ------------------------------------------------------------------------------------------------------
			var location = '${lvo.class_loc }'
			console.log(location);
			var name = '${lvo.class_name}'
			console.log(name)
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   		 	mapOption = {
        		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        		level: 3 // 지도의 확대 레벨
    		};  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(location, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
     		if (status === kakao.maps.services.Status.OK) {

        		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
        		var marker = new kakao.maps.Marker({map: map,position: coords});

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
    	    var infowindow = new kakao.maps.InfoWindow({
        	    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
        	});
        	infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	    map.setCenter(coords);
    	} 	
	});    
			//지도 api  ------------------------------------------------------------------------------------------------------
});
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>