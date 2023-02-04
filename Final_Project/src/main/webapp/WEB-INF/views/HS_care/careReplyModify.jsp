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
	<form class="needs-validation" >
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
					id="FormControlTextarea1" rows="8" style="resize: none;"
					>${view.RE_CONTENT}</textarea>
			</div>
		</div>
		<hr class="my-4">
		<div class="modal-footer">
			<!-- 로그인 회원만 수정 및 삭제 가능하게 처리 예정 -->
			<button class="btn btn-light" id="updateReply" type="button">수정</button>&nbsp;&nbsp;
			<!-- 후기 목록으로 이동 -->
			<a type="submit" href="/HS_care/careReply" class="btn btn-primary">뒤로가기</a>
		</div>
		</form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var url = $('#PST_REPLYNUM').val();
		$('#updateReply').on('click', function(e) {
			$.ajax({
				url : '/HS_care/updateReply',
				data : JSON.stringify({
					pst_REPLYNUM : $('#PST_REPLYNUM').val(),
					re_CONTENT : $('#FormControlTextarea1').val()
				}),
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				dataType : 'json',
				success : function(result) {
					alert("수정됨")
					location.href = "/HS_care/careReply"
				}
			});
		});
	});
</script>
<%@ include file="../include/footer.jsp" %>