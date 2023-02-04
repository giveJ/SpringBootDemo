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
</head>
<body>
	<div class="box">
		<h1 style="padding: 10px;
		border-left: 10px solid #5eaec9;
		background-color: #e3f2fd; width: 800px; margin: auto;" >방문 돌봄 서비스</h1>
		<br>
		<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
			<h1 class="display-5 fw-normal">
				<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70"
					fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
  <path
						d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z" />
</svg>
				서비스 예약 정보
			</h1>

			<p class="fs-6 text-muted">예약이 완료되었습니다. 이용해주셔서 감사합니다.</p>
		</div>
		<br>
		<form class="needs-validation" novalidate=""
			action="/test_project/BKController" method="post">
			<div class="row g-3" id="tess">
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>예약 번호</b></label><br>
					<span id="cc-name" name="bk_no" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>예약일</b></label><br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-number" class="form-label"><b>회원아이디</b></label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>연락처</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-number" class="form-label"><b>반려동물 번호</b></label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>반려동물 이름</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>돌봄 일자</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>돌봄 방문시간</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>방문지 주소</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-6">
					<label for="cc-name" class="form-label"><b>담당 펫시터</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
				<div class="col-md-7">
					<label for="cc-number" class="form-label"><b>돌봄 요청사항</b> </label> <br>
					<span id="cc-name" name="name" required="" readonly>${view.bk_no}</span>
				</div>
			</div>
			<hr class="my-4">
			<div class="d-grid gap-3 d-md-block" style="text-align: center;">
				<button type="button" class="btn btn-success" style="width: 150px;">MyPage 이동</button>
			</div>
		</form>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<%@ include file="../include/footer.jsp" %>