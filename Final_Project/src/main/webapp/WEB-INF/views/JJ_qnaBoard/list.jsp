<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
			
			.container1{
				margin-left: 15%;
				color: black;
			}
			
			/* -------------테이블 css------------ */
			
			
			table {
			    margin-left: 5%;
			    width: 70%;
			    border-top: 1px solid white;
			    border-collapse: collapse;
			    font-size: 14px;
			    font-family: "Nanum Gothic"
			  }
			 
			th, td {
			    border-bottom: 1px solid #8b8d94;
			    padding: 5px;
			    text-align: center;
			  }
			  
			td a{
				padding: 5px;
				text-decoration: none;
				color: black;
				}
			
			thead { 
				color: black;	
			}
			
			th:nth-of-type(1) {
				width:70px;
			}
			
			th:nth-of-type(2) {
				width:100px;
			}
			
			th:nth-of-type(3) {
				width:500px;
			}
			
			th:nth-of-type(4) {
				width:100px;
			}	
			
			
			td:nth-of-type(1) {
				color: gray;
			}
			
			td:nth-of-type(2) {
				color: gray;
			}
			
			td:nth-of-type(3) {
				color: gray;
			}
			
			td:nth-of-type(4) {
				color: gray;
			}	
			
			/* -------------테이블 css end------------ */
			
			.line {
			border: 4px solid #c0dff4;
			width: 80%;
			margin-right: 10%
			}
			
			
			#regBtn{
				color : white;
				background-color: #c0dff4;
				padding: 5px;
				border: none;
				margin-left: 1300px;
			}
			
			/* ------------------페이징 관련 css-------------- */
			
			ul li{
				text-decoration: none;
				list-style-type: none;
			
			}
			
			#paging a{
				color: black;
			    display: block;
			    text-align: center;
			    width: 2px;
			    padding: 2px;
			
			}
			
			.pull-right{
				margin-left: 5%;
			}
			
			.pagination{
				margin-left: 17%;
			}
			
			
		/* ------------------카테고리 css------------------ */	
			
			.categoryMenu{
				margin-left: 50px;
			}
			
			
			
			 .category-list li a{
			      color: black;
			      display: block;
			      text-align: center;
			      width: 70px;
			      padding: 5px;
			   }
			   
			 #category-total{
			      border-bottom: 4px solid #fcd11e;
			      font-weight: bold;
			      color: black;
			      display: block;
			      text-align: center;
			      width: 70px;
			   }
			
			
		
			ul li{
				text-decoration: none;
				list-style-type: none;
				padding: 15px;
			
			}
			
			#paging a{
				color: black;
			    display: block;
			    text-align: center;
			    width: 2px;
			    padding: 2px;
			
			}
			
			.pull-right{
				margin-left: 350px;
			}
/* ------------------------------------------------------------- */

			.category-list li{
				padding: 5px;
				margin: 20px;
				color: gray;
				border-bottom: 1px solid lightgray;
				font-size: 15px;
				
					
			}
			
			.category-list li:hover {
				color: black;
				cursor: pointer;
				font-weight: bolder;
				font-size: large;
			}
			
			
</style>
</head>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	 $(function(){
		
		var actionForm = $("#actionForm");	// 데이터 전송을 위한 form 태그
		
		// 새 게시글 등록 버튼 클릭 이벤트
		$("#regBtn").click(function(e){
			
			if(${empty member}){
				alert("글쓰기는 회원만 가능합니다.");
				e.preventDefault();	// 기본 href 경로 이동 방지
				location.href="../aMember/login";
				
			}else{
				actionForm.attr("action","/JJ_qnaBoard/insert");
				actionForm.submit();
			}
		});
		
		
		// 상세보기 페이지 이동 버튼 클릭 이벤트 (게시글 제목 누를 시에 )
		$(".move").click(function(e){
			e.preventDefault();	
			
			// 비밀글 여부
			var secret_number = $(this).attr("data-rno");
			
			// 글 작성자
			var secret_user = $(this).attr("data-rno2");
			
			// 로그인 아이디
			var user_ID = $("input[name='user_ID']").val();
			
			// 관리자 코드
			var user_grade = $("input[name='user_grade']").val();
			
			// 비밀글인 경우
			if(secret_number == 1){
				if(user_grade == 1 || user_ID == secret_user){
					actionForm.attr("action","/JJ_qnaBoard/get");
					
				 	var str ='';
					
					str +='<input type="hidden" name="pageNum" value="'+ ${pageMaker.cri.pageNum }+'">';
					str +='<input type="hidden" name="amount" value="' + ${pageMaker.cri.amount }+ '">'; 
					str +='<input type="hidden" name="bno" value="' + $(this).attr("href")+'">';
					str +='<input type="hidden" name="secret" value="' + $(this).attr("data-rno")+'">';
					str +='<input type="hidden" name="writer" value="' + $(this).attr("data-rno2")+'">';
					
					actionForm.html(str); 
					actionForm.submit();
					
				}else{
					// 글 열람X
					alert("비밀글입니다.");
					return false;
				} 
				
			}else{
				// 비밀글이 아닌 경우 글 열람 O
				actionForm.attr("action","/JJ_qnaBoard/get");
				
			 	var str ='';
				
				str +='<input type="hidden" name="pageNum" value="'+ ${pageMaker.cri.pageNum }+'">';
				str +='<input type="hidden" name="amount" value="' + ${pageMaker.cri.amount }+ '">'; 
				str +='<input type="hidden" name="bno" value="' + $(this).attr("href")+'">';
				str +='<input type="hidden" name="secret" value="' + $(this).attr("data-rno")+'">';
				str +='<input type="hidden" name="writer" value="' + $(this).attr("data-rno2")+'">';
				
				actionForm.html(str); 
				actionForm.submit();
			}
			
		});
		
		
		//------------페이징
		$(".paginate_button a").click(function(e){
			
			e.preventDefault();
			actionForm.attr("action","/JJ_qnaBoard/list");	//get으로 갔다가 list로 감
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			
			actionForm.submit();
		});
		
		
		// 결과창 출력을 위한 코드
		var result = '<c:out value="${result}"/>';
		// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때 (데이터 변경) 알림 메소드 실행
		
		if(result != ''){
			checkResult(result);
		}
		
		// 뒤로가기 할 때 문제가 될 수 있으므로.
		// history 객체를 조작({정보를 담은 객체}, 뒤로가기버튼 문자열 형태의 제목, 바꿀 url)
		history.replaceState({},null, null);
		
		function checkResult(result){
			if(result === '' || history.state){ //뒤로 가기 방지
				return;	
			}
			
			if(result === 'success'){	// 수정 및 삭제
				alert("처리가 완료되었습니다.");
				return;
			}
			
			if(result === 'ok'){		// 삽입
				alert("게시글이 등록되었습니다.");
			}
		}
		
		
		// 카테고리 -----------------------------
		
		
		$(".category-list").on("click","li",function(){
			// 1. 카테고리 가져오기
			category_value = $(this).attr("value");
			
			var str ='';
			str += '<input type="hidden" name="category" value="' + category_value + '">';
			actionForm.append(str);
			actionForm.submit();
		}); 
		

	}); 
	
	
	
	  
</script>
<body>
	
	<div class="container1">
		<br/><br/>
		<h2>문의사항</h2>
		<div class="line"></div>
			<br/><br/><br/>
						<button id="regBtn">문의하기</button>
				<div class="categoryMenu">
					<ul class="category-list">
						<li class="category" value="돌봄">돌봄</li>
						<li class="category" value="용품">용품</li>
						<li class="category" value="클래스">클래스</li>
						<li class="category" value="가족찾기">가족찾기</li>
					</ul>
				</div>
				
				
				<br/><br/><br/><br/><br/><br/>
		 	<form method="get">
		 		<input type="hidden" name="user_ID" value="${member.user_ID}">
		 		<input type="hidden" name="user_grade" value="${member.user_grade}">
				<table class="qnaBoard">
					<thead>
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>진행상태</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>비밀글</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="qnaBoard" items="${list }">
								<tr>
									<td><c:out value="${qnaBoard.bno}"></c:out></td>
									<td>
										<c:out value="${qnaBoard.category}"></c:out>
									<td>
										<a class="move" href="${qnaBoard.bno }" data-rno= "${qnaBoard.secret}" data-rno2="${qnaBoard.writer }">
											<c:out value="${qnaBoard.title }"></c:out>
										</a>
									</td>
									<td>
										<c:choose>
											<c:when test="${qnaBoard.replyCnt > 0}">
												<p style="color: green; margin-bottom: 0;">완료</p>
											</c:when>
											<c:otherwise>
												<p style="color: orange; margin-bottom: 0;">미완료</p>
											</c:otherwise>
										</c:choose>
									</td>
									<td><c:out value="${qnaBoard.writer }"></c:out></td>
									<td><fmt:formatDate value="${qnaBoard.regdate}" pattern="yyyy-MM-dd"/></td>
									<td>
										<c:choose>
											<c:when test="${qnaBoard.secret eq 1}">
												<img src="../resources/img/board/lock.png" width="30px" height="30px">
											</c:when>
											<c:otherwise>
												<img src="../resources/img/board/open.png" width="30px" height="30px">
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
						</c:forEach>
					</tbody>
					</table>
					
				<br/><br/><br/><br/><br/>
		 	<!-- page -->
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous" id="paging">
								<a href="${pageMaker.startPage-1}"> &lt;</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
							<li class="paginate_button ${pageMaker.cri.pageNum==num? 'active':'' }" id="paging">
								<a href="${num }">${num }</a>	
							</li>
						</c:forEach>
								
						<c:if test="${pageMaker.next }">
							<li class="paginate_button" id="paging">
								<a href="${pageMaker.endPage+1 }"> &gt;</a>
							</li>
						</c:if>		
					</ul>
				</div>		
				 <br/><br/><br/>
			</form> 
				<!-- 임시로 데이터 전달 -->
			 	<form action="/JJ_qnaBoard/list" method="get" id="actionForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
		</div>
</body>
</html>


<%@ include file="../include/footer.jsp" %> 