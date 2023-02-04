<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 
<!-- js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<style type="text/css">
	h1 {
  font-size: 35px;
  text-align: center;
  padding: 4% 0px;
  letter-spacing: 1px;
}


/*div변경과 관련된 코드입니다.
색 등의 디자인은 보이기 위해서 표시해놨으니
스타일 추가 및 변경이 가능합니다.*/
.main input[type=radio] {
	display: none;
}
#tab-1:checked ~ .tab label:nth-child(1),
#tab-2:checked ~ .tab label:nth-child(2),
#tab-3:checked ~ .tab label:nth-child(3),
#tab-4:checked ~ .tab label:nth-child(4) {
	background-color:#6aafe6;
  box-shadow: none;
}
.content > div {
	display: none;
}
#tab-1:checked ~ .content div:nth-child(1),
#tab-2:checked ~ .content div:nth-child(2),
#tab-3:checked ~ .content div:nth-child(3),
#tab-4:checked ~ .content div:nth-child(4)  {
	display: block;
}
.main {
  margin: 0 auto;
  main-width:1380px;
  max-width: 90%;
  margin-top: 20px;
}
.tab {
  overflow: hidden;
}
.tab label {
    font-size: 18px;
    cursor: pointer;
    float: left;
    width: 25%;
    text-align: center;
    padding: 15px 0;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
.content {
  min-height: 250px;
}
.content > div{
   padding: 30px;
   line-height: 1.5;
   font-size: 17px;
}


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

.sec_cal .cal_nav .go-prev,
.sec_cal .cal_nav .go-next {
    display: block;
    width: 50px;
    height: 78px;
    font-size: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

.sec_cal .cal_nav .go-prev::before,
.sec_cal .cal_nav .go-next::before {
    content: "";
    display: block;
    width: 20px;
    height: 20px;
    border: 3px solid #000;
    border-width: 3px 3px 0 0;
    transition: border 0.1s;
}

.sec_cal .cal_nav .go-prev:hover::before,
.sec_cal .cal_nav .go-next:hover::before {
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
    display:flex;
    align-items: center;
    justify-content: center;
    width: calc(100% / 7);
    text-align: left;
    color: #999;
    font-size: 12px;
    text-align: center;
    border-radius:5px
}

.current.today {background: rgb(242 242 242);}

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

form{
	border: 1px solid lightgrey;
	width: 550px;
	height: 250px;
	text-align: left;
	padding: 20px;
	position: absolute;
	margin: 20px;
	}
	
.sub .res{
	border: 1px solid grey;
	width: 150px;
	height:50px;
	background-color: #6aafe6;
	border-radius: 15px;
	text-align: center;
	margin: 30px;
}
	
	.dateView{
		border: 1px solid lightgrey;
		width: 600px;
		height:550px;
		position: absolute;
		left: 800px;
		top: 300px;
		
	}
	
	#all{
		float: right;
	}
	#start{
		margin: 20px;
	}
	
	table{
		border: 1px solid lightgrey;
		border-collapse: collapse;
		margin-left: 20px;
	}
	
	tr{
		border: 1px solid lightgrey;
	}
	
	td{
		border: 1px solid lightgrey;
		padding: 20px;
		width: 1000px;
	}
	
	
	input[type="button"]{
    margin: 20px;
    
    
    
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


.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
    text-align: center;
    
    
}
.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
}
.w-btn-outline:active {
    transform: scale(1.5);
}
</style>
</head>
<body>
	<div class="main">
		<p> <strong>관리 및 설정</strong> </p>
  		<input type="radio" id="tab-1" name="show" checked/>
  		<input type="radio" id="tab-2" name="show" />
  		<input type="radio" id="tab-3" name="show" />
  		<input type="radio" id="tab-4" name="show" />
  		<div class="tab">
   		 	<label for="tab-1">신청자 내역 확인</label>
    		<label for="tab-2">클래스 일정 개별 등록</label>
    		<label for="tab-3">클래스 일정 일괄 등록</label>
    		<label for="tab-4">기타 프로필 수정</label>
  		</div>
  		<div class="content">
    		<div class="content-dis">
				<table>	
					<tr>
						<td>클래스 명 </td>
						<td>신청 클래스 일정	</td>
						<td>참여 인원</td>
						<td>금액</td>
						<td>유저명</td>
						<td>전화번호</td>
					</tr>
					<tr>
						<td>???</td>
						<td>???</td>
						<td>???</td>
						<td>???</td>
						<td>???</td>
					</tr>
				</table>
    		</div>
    		<div class="content-dis">
     			 <div class="css-1bre5jk">
     			 	<div class="jss1011">
     			 		<div class="jss1013">
     			 			<!-- <div class="jss1038">
     			 				<input type="button" class="w-btn-outline w-btn-blue-outline" value="날짜 개별 등록" id="selectOne">
     			 				<span class="MuiTouchRipple-root css-w0pj6f"></span>
     			 				<input type="button" class="w-btn-outline w-btn-blue-outline" value="날짜 한번에 입력" id="selectGroup">
     			 				
     			 			</div> -->
     			 		</div>
     			 	</div>
     			 </div>	
    			<div class="wrap">
    				<form action="/date/insert_date" method="post">
    					<div>
    						<strong>
    							<img alt="" src="../resources/svg/plus.svg" width="10px" height="10px"> 클래스 일정 개별 등록하기
    						</strong>
    					</div>
    					<div>
    						수업 진행 날짜 <input type="date" class="chooseDate" name="s_date">
    					</div>
    					<div>
    						<span>수업 시작 시간</span><input type="time" name="p_time_start[0]"> ~<span>수업 종료 시간</span> <input type="time" name="p_time_end[0]">  <button class="add_time"> 일정 추가</button>
    					</div>
    					<div class="add">
    						
    					</div>
    					<div>
    						<p>수강 최대 인원</p>
							<select name="class_max">
								<option value="0">인원 수 선택</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
								<option value="7">7명</option>
								<option value="8">8명</option>
								<option value="9">9명</option>
								<option value="10">10명</option>
								<option value="11">11명</option>
								<option value="12">12명</option>
								<option value="13">13명</option>
								<option value="14">14명</option>
								<option value="15">15명</option>
								<option value="16">16명</option>
								<option value="17">17명</option>
								<option value="18">18명</option>
								<option value="19">19명</option>
								<option value="20">20명</option>
								<option value="25">25명</option>
								<option value="30">30명</option>
							</select> 
    					</div>
    					<div>
    						<button type="submit" class="sub">일정 등록하기</button>
    						<button class="res"> reset</button>
    					</div>
    				</form>
    			</div>
    			<div  class="dateView">
    				<p><strong>개설된 클래스</strong></p>
    				<input type="date"> <button onclick="DateList">검색</button>
    				<div class="">
    					
    				</div>
    			</div>	
    		</div>
    		<div class="content-dis">
    			<form action="/date/insert_date" method="post">
    				<div>
    					<strong>
    						<img alt="" src="../resources/svg/plus.svg" width="10px" height="10px"> 클래스 일정 일괄 등록하기
    					</strong>
    				</div>
    				<div>
    					수업 진행 날짜 <input type="date" id="start"  class="chooseDate" > ~ <input type="date" id="end" >
     				</div>
     				<div class="hidden">
     				
     				</div>
    				<div>
    					<span>수업 시작 시간</span><input type="time" name="p_time_start[0]" > ~<span>수업 종료 시간</span> <input type="time" name="p_time_end[0]">  <button class="add_time"> 일정 추가</button>
    				</div>
    				<div class="add">
    						
    				</div>
    				<div>
    					<p>수강 최대 인원</p>
						<select name="class_max">
							<option value="0">인원 수 선택</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
							<option value="7">7명</option>
							<option value="8">8명</option>
							<option value="9">9명</option>
							<option value="10">10명</option>
							<option value="11">11명</option>
							<option value="12">12명</option>
							<option value="13">13명</option>
							<option value="14">14명</option>
							<option value="15">15명</option>
							<option value="16">16명</option>
							<option value="17">17명</option>
							<option value="18">18명</option>
							<option value="19">19명</option>
							<option value="20">20명</option>
							<option value="25">25명</option>
							<option value="30">30명</option>
						</select> 
    				</div>
    				<div>
    					<button type="submit" class="sub">일정 등록하기</button>
    					<button class="res"> reset</button>
    				</div>
    			</form>
    			<div  class="dateView">
    				<p><strong>개설된 클래스</strong></p>
    				<input type="date" name="s_date" class="searchT"> <button class="s_date_btn">검색</button>
    			</div>	
    		</div>
    		<div class="content-dis">
     			 Design의 body안 내용을 넣으세요.
   			</div>
    		<div>
   			</div>
    	</div>
    </div>
<script type="text/javascript" src="/resources/js/dateList.js"></script>    
<script type="text/javascript">
	
$(function() {
	
		//달력 오늘 날짜 이후만 선택 가능---------------------------------------------------------------------
		
			var day = $(this).val();
			console.log(day);
			
			var now = new Date();  //현재 시간
			var tomorrow = new Date(now.setDate(now.getDate() + 1));  //내일
			console.log(tomorrow);
			
			var d = new Date();
			console.log(d);
			
			var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			// new Date(today-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
			var today = new Date(now - timeOff).toISOString().substring(0, 10);
			console.log(today);
			
			
			var s = $(".chooseDate").attr("min", today);
			$("#start, #end").change(function(){
				var start = $("#start").val();
				var e = $("#end").attr("min" , start);
				var end = $("#end").val();
				console.log(end);
				dateList(start, end);  //함수 호출
				
				
			});
			
			function dateList(start, end) {  //함수
				console.log(start);
				console.log(end);
				
				
				// 두 날짜 차이 계산 실시
	    		var date1 = new Date(start);  //시작일
	    		var date2 = new Date(end);   //종료일
	    		
	    		var elapsedMSec = date2.getTime() - date1.getTime();  
	    		var elapsedDay = elapsedMSec / 1000 / 60 / 60 / 24;  
	    		var dateTerm = Number(elapsedDay) + 1;
	    		console.log(dateTerm);    		

	    		// 정규식 사용해 두 날짜 사이에 포함되는 리스트 출력 실시
	    		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);	
	    		var result = [];  //사이 날짜가 담길 배열	
	    		var curDate = new Date(start);  
	    		console.log(curDate);

	    		while(curDate <= new Date(end)) {
	    			var date = curDate.toISOString().split("T")[0];    			
	    			console.log(date);  //날짜 정보만 자름
	    			
	    			result.push(date); //배열에 추가
	    			curDate.setDate(curDate.getDate());  
	    			console.log(curDate.setDate(curDate.getDate() + 1));
	    		}	

	    		console.log(result.length);			
	    		var i = 0;
		    	str='';
	    		for(i; i < result.length; i++){
	    			
	    			str+='<input type="hidden" name="s_date['+i+']" value="'+result[i]+'">'
	    			
	    		}
	    			$(".hidden").append(str);
	    	};
			
			
			
			
		//-------------------------------------------------------------------------------------------
		

		
    	//수업 일정 추가 버튼------------------------------------------------------------------------------------------------------------------------------------------------------------------
   			var form = $("form");
			console.log(form);
			
			var cnt = 1;
			$(".add_time").click(function(e) {
				e.preventDefault();
				str =''
				str+='<div class="thisT">'
				str+='<div>수업 시작 시간 <input type="time" name="p_time_start['+cnt+']"> ~ 수업 종료 시간 <input type="time" name="p_time_end['+cnt+']"> <span class="del"><a>X</a></span></div>'
				str+='</div>'
				cnt++;
				$(".add").append(str);
			});
		
		//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
		
		
		//리셋버튼 이벤트---------------------------------------------------------------
			$(".res").click(function(e) {
				e.preventDefault();
				form[0].reset();
			});
	
			/*  $(".sub").click(function(e) {
				e.preventDefault();
				var date = $('input[type="date"]');
				var start = $('input[name="p_time_start[0]"]').val();
				var end = $('input[name="p_time_end[0]"]').val();
		
		
				var inputs = $(form).find("input");
				console.log(form.html());
		
				//form.submit();
			});   */
	 
		//--------------------------------------------------------------------------
		//추가된 input[type="time"]의 X버튼 누르면 화면에서 삭제------------------------------
			$(".add").on("click","span", function() {
				var t = $(this).closest("div");
				t.remove();
			});
		
		//---------------------------------------------------------------------------
	});
		//날짜 검색 버튼 누르면 해당 날짜에 대한 일정 쫘라락--------------------------------------------------------------
	/* 	
		var cnoValue = '${vo.cno}'
		console.log(cnoValue);
		
		$(".s_date_btn").on('click', function() {
			SelectS();
		});
	});

		function SelectS() {
			
			
			if ($(".searchT").val() == "") {
				alert("날짜를 입력하세요.");
				return;
			}
	
			$.ajax({  
				type : 'get',
				url : '/date/'+s_date+'get',
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
				
				});	 */
		
		//--------------------------------------------------------------------------------------------------
		
		
		
    </script>
</body>
</html>