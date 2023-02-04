<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style type="text/css">
			
	.container1{
		margin-left: 15%;
		color: black;
	}
	
	.line {
		border: 4px solid #c0dff4;
		width: 80%;
		margin-right: 10%
		}
		
		
	.regBtn, .reset, .btn-success{
		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
		}
	
	
	[type="text"]{
		width: 580px;
		height: 30px;
	}
	
	.inner{
		margin-left: 200px;
	}
	
	.form-control{
		width: 580px;
	}
			
</style>
<body>
	<div class="container1">
		<h1>문의사항 등록</h1>
		
		<div class="line"></div>
			<br/><br/><br/>
		<div class="inner">
					<form action="/JJ_qnaBoard/insert" method="post" role="form">
						<div class="category">
						카테고리 선택<br/>
						<input type="radio" name="category" value="돌봄">돌봄
						<input type="radio" name="category" value="용품">용품
						<input type="radio" name="category" value="클래스">클래스
						<input type="radio" name="category" value="가족찾기">가족찾기<br/><br/><br/>
						</div>
						<div class="secret">
						비밀글 여부<br/>
						<input type="radio" name="secret" value="0">전체공개
						<input type="radio" name="secret" value="1">비밀글
						</div><br/><br/>
						
						<div class="qna">
						작성자<br/>
						<input class="form-control" style="width: 580px;" name="writer" value="${member.user_ID}" readonly="readonly"/>
						질문작성<br/>
					<input type="text" placeholder="제목을 입력해주세요." name="title" class="form-control"><br/><br/>
					<textarea rows="30px" cols="580px" placeholder="5자 이상의 질문 내용을 입력해주세요." name="content" id="content_value" class="form-control"></textarea><br/><br/>
					</div>
					<button class="regBtn" data-oper="register">전송</button>
					<button class="reset" data-oper="reset">취소</button>
					<button class="btn-success" data-oper="list">목록으로 이동 </button>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
				
				</form>
			
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		
		$(function(){
			
			var formObj = $("form");
			
			
			var amount = '${cri.amount}';
			var pageNum = '${cri.pageNum}'; 
			
			
			// 버튼 클릭 스크립트----------------------------------------------
			
			$("button").click(function(e){
				e.preventDefault();	// 기본 이벤트 삭제 (기능 정지)
				
				var oper = $(this).data("oper");
				
			
				if(oper == 'list'){
					location.href= '/JJ_qnaBoard/list?pageNum=' + pageNum + '&amount=' + amount;
					
				}else if(oper == 'reset'){
					formObj[0].reset();
				
				}else{
					
					var category_value = $("input[name='category']:radio:checked");
					var secret_value = $("input[name='secret']:radio:checked");
					var writer_value = $("input[name='writer']").val();
					var title_value = $("input[name='title']").val();
					var content_value = $("#content_value").val();
						
						
						if(category_value.length < 1){
							alert("카테고리를 선택해주세요.")
							return false;
						}
						
						if(secret_value.length < 1){
							alert("비밀글 여부를 선택해주세요.")
							return false;
						}
					
						
						if(writer_value == ''){
							alert("작성자를 입력하세요");
							return false;
						}
						
					
						if(title_value == ''){
							alert("제목을 입력하세요");
							return false;
						}
						
						if(content_value == ''){
							alert("내용을 입력하세요");
							return false;
						}
					
					
					
					
					// 게시글 등록
					formObj.submit();
					
				}
				
				
		
			});
		});
		
		
		

</script>	
</body>
</html>
<%@ include file="../include/footer.jsp" %> 