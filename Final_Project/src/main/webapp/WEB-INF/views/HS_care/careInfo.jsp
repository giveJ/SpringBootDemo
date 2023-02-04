<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>


<!-- 펫시터 소개 -->
<div class="wrap" style="margin: 10px 500px 10px;">
	<div class="petsitter_info1">
		<h1
			style="padding: 10px; border-left: 10px solid #5eaec9; background-color: #e3f2fd; width: 700px; font-weight: normal;">펫시터를
			소개합니다!</h1>
	</div>

	<div class="petsitter_info2">나와 우리 반려동물에게 꼭 맞는 펫시터를 찾아보세요!</div>

	<br /> <a type="button" class="btn btn-secondary btn-sm"
		href="/HS_care/carePstView">펫시터 등록</a> <br /> <br />
	<c:forEach var="pst" items="${list}">
		<!-- 펫시터 프로필 1-->
		<div class="card-group" style="width: 850px;">
			<div class="card" style="width: 18rem;">
				<img src="../resources/img/petsitter1.jpg" class="card-img-top"
					style="width: 281.86px; height: 222px; object-fit: cover;">
				<div class="card-body">
					<h5 class="card-title" style="font-weight: bold;"> <a href="/HS_care/viewPst?PST_NO=${pst.PST_NO}">${pst.PST_NAME}</a> </h5>
					<p class="card-text">${pst.PST_MYSELF}</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-clipboard-check"
							viewBox="0 0 16 16">
				  <path fill-rule="evenodd"
								d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
				  <path
								d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
				  <path
								d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
				</svg> 신원 인증 & 인성 검사 & 촬영 동의 완료</li>
					<li class="list-group-item"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-clipboard-check"
							viewBox="0 0 16 16">
				  <path fill-rule="evenodd"
								d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
				  <path
								d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
				  <path
								d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
				</svg> 자격 & 경력 : ${pst.PST_LICENSE}</li>
					<li class="list-group-item"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-clipboard-check"
							viewBox="0 0 16 16">
				  <path fill-rule="evenodd"
								d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
				  <path
								d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
				  <path
								d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
				</svg> 돌봄가능지역 : ${pst.PST_ADDR}</li>
				</ul>
			</div>
				</c:forEach>
		</div>
<!-- 이용후기 버튼 -->
	<a type="button" class="btn btn-primary-sm" href="/HS_care/careReply" >이용
		후기 보기 </a> 


<div>
	<br />
	<hr>

	<!-- 펫시터 소개글 -->
	<div class="accordion" id="accordionExample">
		<b style="font-size: x-large;">SmilePaws 방문돌봄 서비스</b>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">
					<strong>혼자 남겨진 반려동물을 생각하며, 외출을 망설인 적인 있으신가요?!</strong>
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<p>해외여행 . 명절 . 출장 등 직접 돌볼 수 없을 때 마음 편히 다녀 오실 수 있도록 도와드립니다.</p>
					<p>이제는 SmilePaws 펫시터에게 맡기고, 여러분의 소중한 일상을 마음 편히 보내세요.</p>
					<p>언제 어디서든 원하시는 방법으로 'SmilePaws' 방문 펫시터 서비스를 예약할 수 있어요.</p>
				</div>
			</div>
		</div>
	</div>
	<br />
	
	
		<hr>
		<!-- 예약 버튼 -->
		<div class="btn" style="margin: 20px 340px 20px;">
			<a type="button" class="btn btn-primary-sm" href="/HS_care/careBooking">서비스
				예약하기</a>
		</div>
</div>
<%-- <!-- 펫시터 프로필 상세보기 모달 -->
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