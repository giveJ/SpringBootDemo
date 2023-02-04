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
			
</style>
<body>
	<div class="container1">
		<h1>문의사항 수정</h1>
		
		<div class="line"></div>
			<br/><br/><br/>
		<div class="inner">
					<form action="/JJ_qnaBoard/modify" method="post" id="operForm">
						<input type="hidden" name="bno" value="${qnaBoard.bno}">
						<input type="hidden" name="regdate" value="${qnaBoard.regdate}">
						<input type="hidden" name="secret" value="${qnaBoard.secret}">
						<div class="category">
						카테고리*<br/>
						<input type="text" name="category" value="${qnaBoard.category}" readonly="readonly">
						</div>
						<div class="secret">
						비밀글 여부<br/>
						<input type="radio" name="secret" value="0">전체공개
						<input type="radio" name="secret" value="1">비밀글 
						</div><br/><br/>
						
						<div class="qna">
						작성자<br/>
						<input type="text" name="writer" value="${qnaBoard.writer}"><br/><br/>
						질문작성<br/>
					<input type="text" name="title" value="${qnaBoard.title }"><br/><br/>
					<textarea rows="30px" cols="80px" name="content">${qnaBoard.content }</textarea><br/><br/>
					</div>
					<button class="regBtn" data-oper="modify">글 수정</button>
					<button class="reset" data-oper="remove">글 삭제</button>
					<button class="btn-success" data-oper="list">목록</button>
					
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				<%-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
				 --%>
				</form>
			
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		
		$(function(){
			
			var operForm = $("#operForm");
				
		
			$("button").click(function(e){
				e.preventDefault();	// 기본 이벤트 삭제 (기능 정지)
				
				var oper = $(this).data("oper");
				
				if(oper == 'remove'){
					operForm.attr("action","/JJ_qnaBoard/remove");
					
					
				}else if(oper == 'list'){
					
					operForm.attr("action", "/JJ_qnaBoard/list");
					operForm.attr("method","get");
					
					/* 
					var pageNumTag = $("input[name=pageNum]").clone();	//객체 복사 : empty 로 내용 날려도 남아있음
					var amountTag = $("input[name=amount]").clone();
					
									
					operForm.empty();	//내부 비워주기 : url에 다 뜨기 때문에 form태그 안에 있는 내용 싹 다 날리는것
					
					// 수정 페이지에서 목록으로 이동하기 위함
					operForm.append(pageNumTag);
					operForm.append(amountTag); 
					 */
					
					
				}
				
			 	operForm.submit();
		
			});
		});
		
		
		
		
		function go(f){
			
			var formObj = $("form");
			
			if(f.title.value=='' || f.content.value==''|| f.writer.value==''){
				alert("제목,내용,작성자를 반드시 입력해주세요.")
				return;
			}
			
			if(f.secret.value==''){
				alert("비밀글 여부를 선택해주세요.")
				return;
			}
			
			
			var int_cnt = 0;
			for(var i=0; i<f.category.length; i++){
				if(f.category[i].checked){
					int_cnt++;
				}
			}
			
			if(int_cnt == 0 ){
				alert("카테고리는 반드시 한 개 선택해야 합니다.")
				return;
			}
			
			if(int_cnt > 1){
				alert("카테고리는 반드시 한 개만 선택해야 합니다.")
				return;
			}
				
			
			// 게시글 등록
			alert("게시글이 수정되었습니다.");
			formObj.submit();
		
			
		} 

</script>	
</body>
</html>
<%@ include file="../include/footer.jsp" %> 