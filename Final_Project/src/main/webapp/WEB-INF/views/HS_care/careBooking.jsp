<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>

<style type="text/css">
	.box {
		width: 800px;
		margin: auto;
	}
	#head {
		background-color: #5eaec9;
		color: #fff;
	}
	#btn {
		display: inline-block;
		border: 1px solid black;
		border-radius: 20px;
		padding: 0 17px;
		min-width: 72px;
		height: 35px;
		line-height: 33px;
		box-sizing: border-box;
		vertical-align: middle;
		color: #fff;
		font-size: large;
		text-align: center;
		font-weight: 500;
		background-color: #5eaec9;
	}
	qfs-cargo__flx>div .qfs-cont__box {
		margin-bottom: 1px;
	}
	.qfs-cargo .qfs-cont__box {
		position: relative;
		margin: 16px 0;
	}
	.qfs-cont__box {
		box-sizing: border-box;
		border-radius: 5px;
		box-shadow: 2px 2px 10px 0 rgb(0 0 0/ 10%);
		background-color: #fff;
		border: 1px solid #5eaec9;
	}
</style>
	<div class="box">
		<h1 style="padding: 10px;
		border-left: 10px solid #5eaec9;
		background-color: #e3f2fd; width: 800px; margin: auto;" >방문돌봄 예약신청</h1>
		<span>편안한 돌봄이 될 수 있도록 반려동물들이 좋아하는 것을 알려주시는 것이 좋습니다.</span> <br/>
		<form class="needs-validation" novalidate=""
			action="/HS_care/inputBooking" method="post" id="operForm" >
		<br/>
		<h4 style="text-align: left:;">회원 정보</h4>
		<br/>
			<div class="row">
				<div class="col">
					<label class="form-label">보호자 회원아이디</label> <input
						type="text" class="form-control" placeholder="로그인 시 회원정보 불러옴"
						size="80" readonly="readonly">
				</div>
				<div class="col">
					<label class="form-label">보호자 연락처</label> <input
						type="text" class="form-control" placeholder="로그인 시 회원정보 불러옴"
						 size="80" value="로그인 시 회원정보 불러옴" readonly="readonly">
				</div>
			</div>

			<br />
			<div class="row">
				<div class="col">
					<label class="form-label">반려동물 고유번호 </label> <input
						type="number" class="form-control" placeholder="로그인 시 회원정보 불러옴"
						readonly="readonly">
				</div>
				<div class="col">
					<label  class="form-label">반려동물 이름</label> <input
						type="text" class="form-control"placeholder="로그인 시 회원정보 불러옴"
						 readonly="readonly">
				</div>
			</div>
			<!-- <br/>
			<hr />
			
			<h4 style="text-align: left:;">담당 펫시터</h4>
			<div class="col">
				<select class="form-select" aria-label="Default select example" name="PST_NO">
					<option selected>:: 펫시터를 선택하세요. </option>
					<option value="1">강형욱 펫시터</option>
					<option value="2">나응식 펫시터</option>
					<option value="3">이창준 펫시터</option>
				</select>
			</div> -->
			
			<br/>
			<hr />
			<div class="col-12">
				<fieldset>
				<legend style="text-align: left:;">돌봄 예약일자</legend>
				<div class="row g-3">
					  <div class="col">
					    시작일<input type="date" class="form-control" name="START_DATE">
					  </div>
					  <div class="col">
					    종료일<input type="date" class="form-control" name="END_DATE">
					  </div>
					</div>
				</fieldset>
			</div>
			
			<br/>
			<hr/>
			<h4 style="text-align: left:;">돌봄 방문시간대</h4>
			<span >선택하신 시간대는 방문가능 펫시터가 사전 전화상담을 통해 조율합니다.</span> <br/>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="BK_TIME" id="inlineRadio1" value="오전(09:00 ~ 12:00)" checked>
				<label class="form-check-label" for="inlineRadio1">오전(09:00 ~ 12:00)</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="BK_TIME" id="inlineRadio2" value="오후1(12:00 ~ 15:00)">
				<label class="form-check-label" for="inlineRadio2">오후1(12:00 ~ 15:00)</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="BK_TIME" id="inlineRadio3" value="오후2(15:00 ~ 18:00)"> 
					<label class="form-check-label" for="inlineRadio3">오후2(15:00 ~ 18:00)</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="BK_TIME" id="inlineRadio3" value="야간(18:00 ~ 22:00)"> 
					<label class="form-check-label" for="inlineRadio3">야간(18:00 ~ 22:00)</label>
			</div>
			
			<br/>
			<hr/>
			<div class="addr"><h4 style="text-align: left:;">방문지 주소</h4>
				 우편번호 <input id="member_post" type="button" class="btn btn-link" value="주소검색" readonly onclick="findAddr()">
			</div>	  
				<label for="address" class="form-label">주소</label> <input
					type="text" class="form-control" id="member_addr" name="BK_ADDR1" readonly>
				 <label for="address" class="form-label">상세주소</label> <input
					type="text" class="form-control" name="BK_ADDR2" placeholder="상세주소를 입력하세요.">

			<hr class="my-4">
			<label for="address" class="form-label"><h4>돌봄 요청사항</h4></label>
			<textarea rows="10" cols="100" style="resize: none;" name="BK_CONTENT" placeholder="돌봄 관련 특별 요청사항을 상세히 기재해 주세요."></textarea>
			<br/>

			<hr class="my-4">
			<div class="d-grid gap-3 d-md-block" style="text-align: center;">
				<button class="btn btn-primary" type="submit">접수하기</button> 
				<!-- <button class="btn btn-primary" type="button" onclick="insert(this.form)">접수하기</button> -->
				<button class="btn btn-danger" type="reset">취소</button>
			</div>
		</form>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	/* 주소찾기 이벤트*/
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../include/footer.jsp" %>