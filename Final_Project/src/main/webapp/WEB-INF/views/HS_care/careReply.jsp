<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
   .profil{
   		  margin: 20px 400px 10px;
   }
   
   .box {
		width: 900px;
		margin: auto;
		text-align: center;
	}
	
	.nine h1 {
	text-align: center;
	font-size: 50px;
	text-transform: uppercase;
	color: #222;
	letter-spacing: 1px;
	font-family: "Raleway";
	font-weight: 400;
}

.nine h1 span {
	margin-top: 5px;
	font-size: 15px;
	color: #444;
	word-spacing: 1px;
	font-weight: normal;
	letter-spacing: 2px;
	text-transform: uppercase;
	font-family: "Raleway", sans-serif;
	font-weight: 500;
	display: grid;
	grid-template-columns: 1fr max-content 1fr;
	grid-template-rows: 27px 0;
	grid-gap: 20px;
	align-items: center;
}

.nine h1 span:after, .nine h1 span:before {
	content: " ";
	display: block;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
	height: 5px;
}

#petimg{
	width: 250px;
	height: 200px;
	margin: 10px 110px 10px;
}
</style>
<body>
   
   <!-- 펫시터 소개 -->
   <div class="petsitter_info1" style="margin: 20px 300px 10px;">
	   	<h1 style="padding: 10px;
		border-left: 10px solid #5eaec9;
		background-color: #e3f2fd; width: 800px; margin: auto;">smilePaws 펫시터 후기</h1>
   </div>
   
   <br/><br/>

	<div class="wrap">
		<div class="box">
			<div class="nine">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">후기 번호</th>
							<th scope="col">보호자 아이디</th>
							<th scope="col">반려동물 이름</th>
							<th scope="col">담당 펫시터</th>
							<th scope="col">작성일</th>
							<th scope="col">이용후기</th>
						</tr>
					</thead>
					<!-- 이용후기 리스트 불러오기 -->
					<tbody>
						<c:forEach var="reply" items="${list}">
							<tr>
								<td><c:out value="${reply.PST_REPLYNUM}"></c:out></td>
								<%-- <td><c:out value="${reply.user_ID}"></c:out></td> --%>
								<td> <!-- 회원 아이디 마스킹 처리 -->
									<c:out value="${fn:substring(reply.user_ID,0,fn:length(reply.user_ID)-2)}****"></c:out>
								</td>
								<td><c:out value="${reply.PET_NAME}"></c:out></td>
								<td><c:out value="${reply.PST_NAME}"></c:out></td>
								<td><c:out value="${reply.RE_DATE}"></c:out></td>
								<td><a class="btn btn-outline-secondary btn-sm"
									href="/HS_care/careReplyView?PST_REPLYNUM=${reply.PST_REPLYNUM}">내용 보기<svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-right"
											viewBox="0 0 16 16">
  										<path fill-rule="evenodd"
												d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
									</svg>
								</a></td>
								<!-- data-bs-toggle="modal" data-bs-target="#exampleModal" -->
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<%-- 		<!-- 페이징 -->
			<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage-1}">&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
							<li
								class="paginate_button ${pageMaker.cri.pageNum==num? 'active':''}">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button "><a
								href="${pageMaker.endPage+1}">&gt;</a></li>
						</c:if>
					</ul>
				</nav>
				 --%>

				<%-- 	<form action="/care/careReply" method="get" id="actionForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form> --%>

				
				<!-- 후기 상세보기 모달 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">이용 후기
									상세</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="mb-3 row">
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">보호자
											아이디 </label> <input class="form-control" name="user_ID"
											value="${info.user_ID }" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">반려동물
											이름 </label> <input type="email" class="form-control" name="PET_NAME"
											value="${info.PET_NAME }" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">담당
											펫시터 </label> <input type="email" class="form-control"
											id="exampleFormControlInput1" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">이용일자
										</label> <input type="text" name="START_DATE"
											class="form-control form-control-sm"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default"
											placeholder="시작일" readonly> <input type="text"
											name="END_DATE" class="form-control form-control-sm"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default"
											placeholder="종료일" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">이용후기</label>
										<textarea name="RE_CONTENT" class="form-control"
											id="exampleFormControlTextarea1" rows="5"
											style="resize: none;" readonly></textarea>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">수정</button>
								<button type="button" class="btn btn-primary">삭제</button>
							</div>
						</div>
					</div>
				</div>

				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop" id="modalReply">후기 작성하기</button>
			</div>
		</div>
	</div>

	<!-- 후기 등록 모달 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/HS_care/careReply" method="post">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">이용 후기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-lg">
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">보호자
								아이디 </span> <input type="text" name="user_ID" value="asdf2"
								class="form-control form-control-sm"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" readonly>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">반려동물
								이름 </span> <input type="text" name="PET_num" value="1"
								class="form-control form-control-sm"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" readonly>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">
								담당펫시터 </span> <input type="text" name="PST_NO" value="1"
								class="form-control form-control-sm" 
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" readonly>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">이용일자
							</span> <input type="text" name="START_DATE" value="2023-01-01"
								class="form-control form-control-sm"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" placeholder="시작일" readonly>
							<input type="text" name="END_DATE"	value="2023-01-10"
								class="form-control form-control-sm"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-default" placeholder="종료일" readonly>
						</div>

						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">이용후기</label>
							<textarea name="RE_CONTENT" class="form-control"
								id="exampleFormControlTextarea1" rows="5" style="resize: none;"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button id='modalRegisterBtn' type="submit"
							class="btn btn-primary" data-oper="inputReply">후기 등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$("#modalReply").click(function() {
		var re_content = $('#re_content').val();
		
		$.ajax({
			url : '/HS_care/inputReply',
			data : JSON.stringify({
				user_id = $('#user_id').val();
				pet_num = $('#pet_num').val();
				pst_no = $('#pst_no').val();
				start_date = $('#start_date').val();
				end_date = $('#end_date').val();
				re_content = $('#re_content').val();
			}),
			contentTy
		})
	});
</script>
	<%@ include file="../include/footer.jsp" %>