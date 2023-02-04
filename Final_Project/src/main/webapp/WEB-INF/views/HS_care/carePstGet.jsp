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

	<h1 style="padding: 10px; border-left: 10px solid #5eaec9; background-color: #e3f2fd;">
		펫시터 Info
	</h1>
	<div class="pricing-header p-3 pb-md-4 mx-auto text-center"></div>
	<form class="needs-validation" novalidate=""
		action="/HS_care/updatePst" method="post" id="operForm">
		<div class="row g-3"></div>
		<div class="mb-3 row">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">펫시터 번호
				</label> 
				<input class="form-control" name="PST_NO" value="${pst.PST_NO}" disabled readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">펫시터 이름
				</label> 
				<input class="form-control" name="PST_NAME" value="${pst.PST_NAME}" disabled readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">자기 소개
				</label> 
				<input class="form-control" name="PST_MYSELF" value="${pst.PST_MYSELF}">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">자격증 및 경력 
				</label> 
				<textarea class="form-control" id="exampleFormControlTextarea1"name="PST_LICENSE" rows="3">${pst.PST_LICENSE}"</textarea>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">활동지역 
				</label> 
				<input class="form-control" name="PST_ADDR" value="${pst.PST_ADDR}">
			</div>
		</div>

		<hr class="my-4">
		<div class="modal-footer">
			<button class="btn btn-light" type="submit" disabled>수정</button>&nbsp;&nbsp;
			<button class="btn btn-light" id="deletePst" data-oper="deletePst" disabled>삭제</button>&nbsp;&nbsp; 
			<!-- 후기 목록으로 이동 -->
			<a type="button" href="/HS_care/outputPst" class="btn btn-primary">뒤로가기</a>
		</div>
	</form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
 	$(function() {
		var operForm = $("#operForm");

		// 버튼 클릭 스크립트----------------------------------------------

		$("#replyModify").click(function() {
			operForm.append('<input type="hidden" name="PST_REPLYNUM" value="'+${view.PST_REPLYNUM}+'">');
			operForm.submit();
		});
	}); 
</script>
<%@ include file="../include/footer.jsp" %>