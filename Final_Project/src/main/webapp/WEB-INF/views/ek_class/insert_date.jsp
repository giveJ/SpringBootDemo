<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 내 클래스 확인 페이지</title>
<style type="text/css">
/* section calendar */
.sec_cal {
	width: 360px;
	margin: 0 auto;
	font-family: "NotoSansR";
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

.current:hover {
	background-color: lightblue;
}

.active-color {
	background-color: skyblue;
}

form {
	margin-left: 700px;
	text-align: center;
}

.clicked {
	background-color: skyblue;
}

button {
    margin: 20px;
    text-align: center;

}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
}
.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}
.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}
.w-btn-outline:active {
    transform: scale(1.5);
}


</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	
	$(function(){
			var form = $("form")
			
			$("#selectOne").click(function(e) {
				str=""
				str+='<div class="sec_cal">'
				str+='<div class="cal_nav">'
				str+='<a href="javascript:;" class="nav-btn go-prev">prev</a>'
				str+='<div class="year-month"></div>'
				str+='<a href="javascript:;" class="nav-btn go-next">next</a>'
				str+='</div>'
				str+='<div class="cal_wrap">'
				str+='<div class="days">'
				str+='<div class="day">MON</div>'
				str+='<div class="day">TUE</div>'
				str+='<div class="day">WED</div>'
				str+='<div class="day">THU</div>'
				str+='<div class="day">FRI</div>'
				str+='<div class="day">SAT</div>'
				str+='<div class="day">SUN</div>'
				str+='</div>'
				str+='<div class="dates"></div>'
				str+='</div>'
				str+="</div>"
				$(".time").html(str);	
				
				// 날짜 정보 가져오기
				var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
				var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
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

					console.log(prevDate, prevDay, nextDate, nextDay);

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
				
				
				$(".current").click(function handleClick(event) {
					console.log(event.target.classList);
					var current = document.getElementsByClassName("day current");
					if(event.target.classList[1] === "clicked"){
						event.target.classList.remove("clicked")
					}else{
						for(var i = 0; i < current.length; i++ ){
							current[i].classList.remove("clicked");
						}
						event.target.classList.add("clicked")
					}
					
					function init() {
						for(var i =0; i<current.length; i++){
							current[i].addEventListener("click", handleClick)
						}
					}
					
					init();
					
					var date = $(this).html()
					console.log(date);
					var month = $(".year-month").html()
					console.log(month)
					$(".chooseDate").val( month +"."+ date)
						
				});
			
				var cnt = 1;
				$(".add_time").click(function(e) {
					e.preventDefault();
					
					
					str =''
					str+='<div>'
					str+='<input type="time" name="p_time_start['+cnt+']"> ~ <input type="time" name="p_time_end">'
					str+='</div>'
					
					cnt++;
					$(".add").append(str);
				});
						
				});
			
				$("#selectGroup").click(function() {
					
				});
			
			$(".sub").click(function(e) {
				e.preventDefault();
				
				
				var name=$('input[name="p_time_start[0]"]').val();
				console.log(name);
				console.log(form.html())
				form.submit();
				
			});
			
			$(".res").click(function(e) {
				e.preventDefault();
				form[0].reset();
			});
			
			
			});
			
		
</script>
</head>
<body>

	<div>
		<button id="selectOne" class="w-btn-outline w-btn-blue-outline" >개별 입력</button>
		<button id="selectGroup" class="w-btn-outline w-btn-blue-outline">범위 입력</button>
		<div class="time"></div>
		<form action="insert_date" method="post">
			<fieldset
				style="width: 450px; height: 500px; background-color: lightgrey;">
				<div class="addTime">
					<span>클래스 일정 등록하기</span>
					<p>날짜를 선택 후 클래스를 개설해주세요</p>

				</div>
				<div class="choice">
					<input type="text" value="선택된 날짜가 없습니다" name="s_date" class="chooseDate">
					<div class="range">
					
					</div>
				</div>
				<div>
					<span> 수업시작시간 </span> 
					<input type="time" name="p_time_start[0]"> 
					<span>수업종료시간 </span>
					<input type="time" name="p_time_end[0]">
					<button class="add_time">일정 추가</button>
					<div class="add">
					
					</div>
				</div>
				<div>
				<!-- 	<span>최대 수강 인원</span> <input type="number" name="class_max"> -->
				</div>
				<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
				<br /> <br />

			</fieldset>
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br /> <br />
			<button class="sub">일정 추가 완료</button>
			<button class="res">리셋</button>
			<input type="hidden" value="${vo.cno }" >
			
		</form>
	</div>



</body>


</html>
<%@ include file="../include/footer.jsp"%>