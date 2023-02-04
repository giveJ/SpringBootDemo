<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container1 {
	margin-left: 15%;
	color: black;
}

	/* -------------테이블 css------------ */
	table {
		margin-left: 10%;
		width: 900px;
		font-family: "Nanum Gothic"
	}
	
	/* -------------기본 라인 & 버튼----------- */
	.line {
		border: 4px solid #c0dff4;
		width: 80%;
		margin-right: 10%
	}
	
	#regBtn {
		color: white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: center;
		width: 150px;
		border-radius: 10px;
	}
	
	/* ------------------페이징 관련 css-------------- */
	ul li {
		text-decoration: none;
		list-style-type: none;
	}
	
	#paging a {
		color: black;
		display: block;
		text-align: center;
		width: 2px;
		padding: 2px;	
	}
	
	.pull-right {
		margin-left: 350px;
	}
	
	/* ------------------카테고리 css------------------ */
	.categoryMenu {
		margin-left: 50px;
	}
	
	.category-list li a {
		color: black;
		display: block;
		text-align: center;
		width: 70px;
		padding: 5px;
	}
	
	#category-total {
		border-bottom: 4px solid #fcd11e;
		font-weight: bold;
		color: black;
		display: block;
		text-align: center;
		width: 70px;
	}
	
	#category {
		color: black;
		padding: 10px;
		border: 1px solid skyblue;
		text-align: left;
		border-radius: 30px;
		background-color: white;
		cursor: default;
	}
	
	ul li {
		text-decoration: none;
		list-style-type: none;
		padding: 15px;
	}
	
	#paging a {
		color: black;
		display: block;
		text-align: center;
		width: 2px;
		padding: 2px;
	}
	
	.pull-right {
		margin-left: 350px;
	}
	
	.category-list li {
		padding: 5px;
		margin: 20px;
		color: gray;
		border-bottom: 1px solid lightgray;
		font-size: 18px;
	}
	
	.category-list li:hover {
		color: black;
		cursor: pointer;
		font-weight: bolder;
		font-size: large;
	}
	
	/* ----------------------animalType Box*/
	.community-content1 {
		float: left;
	}
	
	.community-content2 {
		float: left;
		margin-left: 230px;
	}
	
	.footer {
		clear: both;
	}
	
	.community-content2-box {
		padding: 20px;
		border-radius: 20px;
		text-align: center;
	}
	
	#search {
		color: white;
		background-color: #c0dff4;
		padding: 3px;
		border: none;
		text-align: center;
		border-radius: 10px;
		width: 100px;
	}
	
	#box1 {
		margin: 10px;
	}
	
	/* ----------------------------------- */
	.move {
		text-decoration-line: none;
		color: black;
	}
	
	.move:hover {
		font-weight: bold;
		cursor: pointer;
		color: skyblue;
	}






</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	 $(function(){
		
		var pageNum =  ${pageMaker.cri.pageNum };
		var amount= ${pageMaker.cri.amount };
		 
		 
		var actionForm = $("#actionForm");	// 데이터 전송을 위한 form 태그
		
		// 새 게시글 등록 버튼 클릭 이벤트
		$("#regBtn").click(function(e){
			
			if(${empty member}){
				alert("글쓰기는 회원만 가능합니다.");
				e.preventDefault();	// 기본 href 경로 이동 방지
				location.href="../aMember/login";
			}else{
				actionForm.attr("action","/JJ_comBoard/insert");
				actionForm.submit();
				
			}
			
			
			
		});
		
		
		// 상세보기 페이지 이동 버튼 클릭 이벤트 (게시글 제목 누를 시에 )
		$(".move").click(function(e){
			//<a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
			e.preventDefault();	// 기본 href 경로 이동 방지
			actionForm.attr("action","/JJ_comBoard/get");
			
			var str ='';
			str +='<input type="hidden" name="pageNum" value="'+ ${pageMaker.cri.pageNum }+'">';
			str +='<input type="hidden" name="amount" value="' + ${pageMaker.cri.amount }+ '">';
			str +='<input type="hidden" name="bno" value="' + $(this).attr("href")+'">';
			
			actionForm.html(str);
			actionForm.submit();
			
		});
		
		
		//------------페이징
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			actionForm.attr("action","/JJ_comBoard/list");	//get으로 갔다가 list로 감
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
		
		

		// 카테고리 ----------------------------------------------------------//////////
		
		
		
		$(".category-list").on("click","li",function(){
			
			
			
			
			
			// 1. 카테고리 가져오기
			postType_value = $(this).attr("value");
			//alert(postType_value);
			var str  = '<input type="hidden" name="postType" value="' + postType_value + '">';
			actionForm.append(str);
			actionForm.submit();
		}); 
		
		
		
		$("#search").on("click", function(e){
			e.preventDefault(); // 기본 이벤트 해제 (submit 방지)
			
		    // 1. 카테고리 가져오기
		 	var animalType_value = $("input[name='animalType']:radio:checked").val();
		  
			
		 	if(animalType_value==null){
				alert("동물유형을 선택해주세요.");
				return false;
			}
		   
		 	
		    if(animalType_value=='dog'){
		    	animalType = '강아지';
		    }else if(animalType_value=='cat'){
		    	animalType = '고양이';
		    }else if(animalType_value=='small'){
		    	animalType = '소동물';
		    }else{
		    	animalType = '기타';
		    }
		    
		    var pt = '${pt}';
		    
		    
		    // 2. 카테고리 전달하기
		    actionForm.attr("action","/JJ_comBoard/list");
		    var str  = '<input type="hidden" name="postType" value="' + pt + '">';
		    str += '<input type="hidden" name="animalType" value="' + animalType + '">';
		    actionForm.append(str);
		    actionForm.submit();
		
		});
		
		
	}); 
	
</script>
<body>

	<div class="container1">
		<br/><br/>
		<h2>커뮤니티</h2>
		<div class="line"></div>
		<br />
		<br />
		<br />

		<div class="categoryMenu">
			<ul class="category-list">
				<li class="postType" value="qna">Q&A</li>
				<li class="postType" value="lounge">일상</li>
			</ul>
		</div>
		<br/>
		<div class="community-box">
			<br />
			<br />
			<br />
			<br />
			
				
			<br/><br/>
			
			<div class="community-content1">
				<form method="get">
					<table class="community">
						<c:forEach var="comBoard" items="${list }">
							<tr>
								<td style="font-size: 25px; font-weight: bold;">
								<c:choose>
									<c:when test="${comBoard.postType eq 'qna'}"> Q&A </c:when>
									<c:otherwise> 일상 </c:otherwise>
								</c:choose>
								</td>
								<td>
									<button id="category" data-oper="list">
										<c:choose>
											<c:when test="${comBoard.animalType eq '강아지'}">
												<img src="../resources/img/board/dog.png" width="30px"
													height="30px">
											</c:when>
											<c:when test="${comBoard.animalType eq '고양이'}">
												<img src="../resources/img/board/cat.png" width="30px"
													height="30px">
											</c:when>
											<c:when test="${comBoard.animalType eq '소동물'}">
												<img src="../resources/img/board/small.png" width="30px"
													height="30px">
											</c:when>
											<c:otherwise>
												<img src="../resources/img/board/other.png" width="30px"
													height="30px">
											</c:otherwise>
										</c:choose>
										<c:out value="${comBoard.animalType}"></c:out>
									</button>
								</td>

							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td colspan=3 style="font-weight: bold; font-size: 22px">
								<a class="move" href="${comBoard.bno }">
								<c:out value="${comBoard.title}"></c:out>
								</a></td>
							</tr>
							<tr>
								<td colspan=3 style="color: gray;">
								<c:out value="${comBoard.content}"></c:out></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>댓글 : <c:out value="${comBoard.replycnt}"></c:out></td>
								<td><c:out value="${comBoard.writer}"></c:out></td>
								<td><fmt:formatDate value="${comBoard.regdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td colspan="20"><hr /></td>
							</tr>
						</c:forEach>
					</table>

					<br />
					<!-- page -->
					<div class="pull-right">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous" id="paging"><a
									href="${pageMaker.startPage-1}"> &lt;</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" step="1">
								<li
									class="paginate_button ${pageMaker.cri.pageNum==num? 'active':'' }"
									id="paging"><a href="${num }">${num }</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="paginate_button" id="paging"><a
									href="${pageMaker.endPage+1 }"> &gt;</a></li>
							</c:if>
						</ul>
					</div>
					<br />
					<br />
					<br />
				</form>
				<!-- 임시로 데이터 전달 -->
				<form action="/JJ_comBoard/list" method="get" id="actionForm">
					<input type="hidden" name="pageNum"value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
			</div>
			<!-- end community-content -->


			<div class="community-content2">
				<button id="regBtn">글쓰기</button>
				<br />
				<br />
				<div class="community-content2-box" style="border: 1px solid gray;">
					<b>동물유형</b> <br />
					<br />
					<form name="myForm">
						<input type="radio" id="box1" name="animalType" value="dog">강아지<br />
						<input type="radio" id="box1" name="animalType" value="cat">고양이<br />
						<input type="radio" id="box1" name="animalType" value="small">소동물<br />
						<input type="radio" id="box1" name="animalType" value="other">기&nbsp;&nbsp;&nbsp;타<br />
						<br />
						<input type="submit" id="search" value="적용">
						
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
</body>
</html>




<%@ include file="../include/footer.jsp"%>
