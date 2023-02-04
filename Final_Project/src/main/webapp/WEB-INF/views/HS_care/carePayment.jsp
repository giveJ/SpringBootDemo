<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">
	 function update_page(f) {
		f.submit();
	} 
</script>
<div class="wrap">

	<p>
	<h1
		style="padding: 10px; border-left: 10px solid #5eaec9; background-color: #e3f2fd;">돌봄
		이용 후기</h1>
	<div class="pricing-header p-3 pb-md-4 mx-auto text-center"></div>
	<form class="needs-validation" novalidate=""
		action="/test_project/BKController" method="get">
		<div class="row g-3"></div>
		<div class="mb-3 row">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">보호자
					아이디 </label> <input class="form-control" name="user_ID"
					value="${view.user_ID}" readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">반려동물
					이름 </label> <input type="email" class="form-control" name="PET_NAME"
					value="${view.PET_NAME}" readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">담당
					펫시터 </label> <input type="email" class="form-control"
					value="" readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이용일자
				</label> <input type="text" name="START_DATE"
					class="form-control form-control-sm" value="${view.START_DATE}"
					readonly> <input type="text" name="END_DATE"
					class="form-control form-control-sm" value="${view.END_DATE}"
					readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">후기
					내용</label>
				<textarea name="RE_CONTENT" class="form-control"
					id="exampleFormControlTextarea1" rows="8" style="resize: none;"
					readonly>${view.RE_CONTENT}</textarea>
			</div>
		</div>

		<hr class="my-4">
		<div class="modal-footer">
			<button class="btn btn-secondary"
				data-bs-dismiss="modal">수정</button>&nbsp;&nbsp;
			<button class="btn btn-primary">삭제</button>&nbsp;&nbsp;
			<a type="button" href="/HS_care/careReply" class="btn btn-primary">뒤로가기</a>
		</div>
	</form>
</div>

	<script type="text/javascript">
	</script>
	<%@ include file="../include/footer.jsp" %>