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
				width:50px;
			}
			
			th:nth-of-type(2) {
				width:400px;
			}
			
			th:nth-of-type(3) {
				width:100px;
			}
			
			th:nth-of-type(4) {
				width:100px;
			}	
			
			td:nth-of-type(1) {
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
				text-align: left;
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
				margin-left: 35%;
			}
			
			
			/* ------------------검색--------- */
			
			.searchInput{
				width: 15%;
				height: 40px;
				margin-left: 5%;
				border: 2px solid #fcd11e;
				border-radius: 24px;
				letter-spacing: 0;
				text-align: left;
				background-image: url(../resources/img/board/ICON-24px-Search.svg);
				background-repeat: no-repeat;
				background-size: 24px;
				background-position: 98% 50%;
				
			
			}
			
			.search{
				position: relative;
				width: 100%;
				height: 72px;
				padding: 16px 0;
			}
			
		
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var actionForm = $("#actionForm");	// 데이터 전송을 위한 form 태그
		
		// 새 게시글 등록 버튼 클릭 이벤트
		$("#regBtn").click(function(){
			
			
			actionForm.attr("action","/JJ_notice/insert");
			actionForm.submit();
		});
		
		
		// 상세보기 페이지 이동 버튼 클릭 이벤트 (게시글 제목 누를 시에 )
		$(".move").click(function(e){
			//<a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
			e.preventDefault();	// 기본 href 경로 이동 방지
			actionForm.attr("action","/JJ_notice/get");
			
		 	var str ='';
			str +='<input type="hidden" name="pageNum" value="'+ ${pageMaker.cri.pageNum }+'">';
			str +='<input type="hidden" name="amount" value="' + ${pageMaker.cri.amount }+ '">';
			str +='<input type="hidden" name="no" value="' + $(this).attr("href")+'">';
			
			actionForm.html(str);
			actionForm.submit();
			
		});
		
		
		//------------페이징
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			actionForm.attr("action","/JJ_notice/list");	
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			/* actionForm.find("input[name='amount']").val($(this).attr('href')); */
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
		
		
		
		
		$(".searchInput").keydown(function(key) {
			if( key.keyCode == 13 ){
				alert("enter");
			}
		});
		
		
		
		
		
		
		
		
	});
</script>
<body>
	
	
	<div class="container1">
		<br/><br/>
		<h2>공지사항</h2>
		<div class="line"></div>
			<br/><br/><br/>
			<c:if test="${member.user_grade eq 1}">
				<button id="regBtn">공지사항 작성</button>
			</c:if>
				<br/><br/><br/><br/>
				
				<div class="search">
					<input type="text" placeholder="  찾으시는 글이 있으신가요?"
					maxlength="130" class="searchInput" enterkeyhint="search" value="">
				</div>
				<br/><br/>
				
				
			<form method="get">
				<table class="notice">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${list }">
								<tr>
									<td><c:out value="${notice.no}"></c:out></td>
									<td>
										<a class="move" href="${notice.no }">
											<c:out value="${notice.title }"></c:out>
										</a>
									</td>
									<td><c:out value="smilepaws"></c:out></td>
									<td><fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
						</c:forEach>
					</tbody>
					</table>
					
					<br/><br/><br/><br/>
				
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
							<li class="paginate_button next" id="paging">
								<a href="${pageMaker.endPage+1 }"> &gt;</a>
							</li>
						</c:if>		
					</ul>
				</div>		
				 <br/><br/><br/>
			</form>
				<!-- 임시로 데이터 전달 -->
			 	<form action="/JJ_notice/list" method="get" id="actionForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
				
				<!-- 
				<form action="/JJ_notice/list" method="get" id="startForm">
				<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="10">
				</form> -->
				
   
		</div>
</body>

<iframe id="google_esf" name="google_esf" src="https://googleads.g.doubleclick.net/pagead/html/r20230201/r20190131/zrt_lookup.html"
style="display: none;"
></iframe>
</html>
		



<%@ include file="../include/footer.jsp" %> 