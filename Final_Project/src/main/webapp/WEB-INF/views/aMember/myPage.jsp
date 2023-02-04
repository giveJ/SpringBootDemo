<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.card-title{
	padding: 10px; border-left: 10px solid #5eaec9; background-color: #e3f2fd;  font-weight: normal;
}

</style>
<!-- 펫시터 소개 -->
<div class="wrap" style="margin: 10px 500px 10px;">
	<div class="petsitter_info1">
		<h1 style="padding: 10px; border-left: 10px solid #5eaec9; background-color: #e3f2fd; width: 700px; font-weight: normal;">
			MyPage</h1>
	</div>

	<div class="petsitter_info2">홍길동 보호자님의 마이페이지입니다.</div>
	<br />
	<div class="row">
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="card" style="width: 25rem;">
				<div class="card-body">
					<h5 class="card-title">보호자님 정보</h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">a</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">회원정보 수정</a> <a href="#"
						class="card-link">반려동물 등록</a>
				</div>
			</div>
			<div class="card" style="width: 25rem;">
				<div class="card-body">
					<h5 class="card-title">반려동물 프로필</h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">a</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">반려동물 수정</a> <a href="#"
						class="card-link">반려동물 삭제</a>
				</div>
			</div>
			<div class="card" style="width: 25rem;">
				<div class="card-body">
					<h5 class="card-title">돌봄서비스 예약 현황</h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">a</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">예약확인</a>
				</div>
			</div>
			<div class="card" style="width: 25rem;">
				<div class="card-body">
					<h5 class="card-title">클래스 예약 현황</h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">a</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">An item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">예약확인</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <!-- 상세보기 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">펫시터 프로필</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3 row">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">
							펫시터 이름 </label><input type="email" class="form-control" name="PET_NAME"
							value="${info.PET_NAME }" readonly>

					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">대표
							경력 </label> <input type="email" class="form-control" name="PET_NAME"
							value="${info.PET_NAME }" readonly>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">전문
							분야 </label> <input type="email" class="form-control" name="PET_NAME"
							value="${info.PET_NAME }" readonly>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">방문
							지역 </label> <input type="email" class="form-control"
							id="exampleFormControlInput1" readonly>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">자기소개</label>
						<textarea name="RE_CONTENT" class="form-control"
							id="exampleFormControlTextarea1" rows="5" style="resize: none;"
							readonly></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"> 
</script>

<%@ include file="../include/footer.jsp"%>