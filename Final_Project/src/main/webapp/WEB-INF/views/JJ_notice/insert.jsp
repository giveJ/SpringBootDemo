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
		<h1>공지사항 등록</h1>
		
		<div class="line"></div>
			<br/><br/><br/>
		<div class="inner">
					<form action="/JJ_notice/insert" method="post" role="form">
					<input type="text" placeholder="제목" name="title"><br/><br/>
					<textarea rows="30px" cols="80px" placeholder="내용을 입력해주세요." name="content" id="content_value"></textarea><br/><br/>
				
					<button class="regBtn" data-oper="register" >전송</button>
					<button class="reset" data-oper="reset">취소</button>
					<button class="btn-success" data-oper="list">목록으로 이동 </button>
					
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				
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
					location.href= '/JJ_notice/list?pageNum=' + pageNum + '&amount=' + amount ;	
					
				}else if(oper == 'reset'){
					formObj[0].reset();
					
				}else{
					
					var title_value = $("input[name='title']").val();
					var content_value = $("#content_value").val();
						
					
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