<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	.wrap {
		width: 800px;
		margin: auto;
		
	}
	
	.needs-validation{
		width: 500px;
		margin: auto;
	}
	
</style>
<div class="wrap">

	<p>
	<h1
		style="padding: 10px; border-left: 10px solid #5eaec9; background-color: #e3f2fd;">돌봄
		이용 후기</h1>
	<div class="pricing-header p-3 pb-md-4 mx-auto text-center"></div>
	<form class="needs-validation" novalidate=""
		action="/HS_care/deleteReply" method="post" id="operForm">
		<div class="row g-3"></div>
		<div class="mb-3 row">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">후기 번호 
				</label> <input class="form-control" name="PST_REPLYNUM" id="PST_REPLYNUM"
					value="${view.PST_REPLYNUM}" disabled readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">보호자
					아이디 </label> <input class="form-control" name="user_ID"
						value ="${fn:substring(view.user_ID,0,fn:length(view.user_ID)-4)}****"
									disabled readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">반려동물
					이름 </label> <input type="email" class="form-control" name="PET_NAME"
					value="${view.PET_NAME}" disabled readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">담당
					펫시터 </label> <input type="email" class="form-control"
					value="${view.PST_NAME}" disabled readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이용일자
				</label> <input type="text" name="START_DATE"
					class="form-control form-control-sm" value="${view.START_DATE} ~ ${view.END_DATE}"
					disabled readonly> 
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">후기
					내용</label>
				<textarea name="RE_CONTENT" class="form-control"
					id="exampleFormControlTextarea1" rows="8" style="resize: none;"
					disabled readonly>${view.RE_CONTENT}</textarea>
			</div>
		</div>
		<hr class="my-4">
		<div class="modal-footer">
			<!-- 로그인 회원만 수정 및 삭제 가능하게 처리 예정 -->
			<button class="btn btn-light" id="deleteReply" data-oper="deleteReply">후기 삭제</button>&nbsp;&nbsp;
			<!-- 후기 목록으로 이동 -->
			<a type="button" href="/HS_care/careReply" class="btn btn-primary">뒤로가기</a>
		</div>
		</form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

/* $(function(){
	$("#deleteReply").on("click",function(e){
		$.ajax({
			url : '/HS_care/deleteReply',
			data : JSON.stringify({
				pst_REPLYNUM : $('#PST_REPLYNUM').val()
	        }),
	        contentType : "application/json; charset=UTF-8",
			type : 'DELETE',
			success : function(result){
				console.log(result);
			}
		});
	});  
});   */

$(function() {
	var operForm = $("#operForm");

	// 버튼 클릭 스크립트----------------------------------------------

	$("#deleteReply").click(function() {
		operForm.append('<input type="hidden" name="PST_REPLYNUM" value="'+${view.PST_REPLYNUM}+'">');
		alert("삭제됨");
		operForm.submit();
	});
});



	//결과창 출력을 위한 코드
	var result = '<c:out value="${result}"/>';
	// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때(데이터변경) 알림 메소드 실행
	if (result != '') {
		checkResult(result);
	}
	// 뒤로 가기 할 때 문제가 될 수 있으므로,
	// history 객체를 조작 ({정보를 담은 객체}, 뒤로 가기 버튼 문자열 형태의 제목, 바꿀 url)
	history.replaceState({}, null, null);
	function checkResult(result) {
		if (result === '' || history.state) { // 뒤로가기 방지
			return;
		}
		if (result === 'success') { // 수정 및 삭제
			alert("처리가 완료되었습니다");
			return;
		}
		if (result === 'ok') {
			alert("게시글이 등록되었습니다.");
		}
	}
</script>
	<%@ include file="../include/footer.jsp" %>