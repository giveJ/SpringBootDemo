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
			
		
			.line {
			border: 4px solid #c0dff4;
			width: 80%;
			margin-right: 10%
			}
			
			
			.notice_header{
				background-color:#f9f9f9;
				padding: 20px;
			}
			
			.notice_container{
				width: 60%;
				margin-left: 200px;
			}
			
			
			#modify{
				color : white;
				background-color: #c0dff4;
				padding: 5px;
				border: none;
				text-align: left;
				margin-left: 44%;
			}
			
			#remove, #list{
				color : white;
				background-color: #c0dff4;
				padding: 5px;
				border: none;
				text-align: left;
				margin-left: 10px;
			}
			
			.form-control{
				width: 580px;
				height: 30px;
			}
		
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	


$(function(){
		
		var operForm = $("#operForm");
		
		$("button").on("click",function(e){
			
			e.preventDefault();	// 기본 이벤트 삭제 (기능 정지)
			
			var oper = $(this).data("oper");
			
			if(oper == 'remove'){
				operForm.attr("action","/JJ_notice/remove");
			
			} else if (oper == 'list'){
				
				operForm.attr("action", "/JJ_notice/list");
				operForm.attr("method","get");
				
				var pageNumTag = $("input[name=pageNum]").clone();	//객체 복사 : empty 로 내용 날려도 남아있음
				var amountTag = $("input[name=amount]").clone();
								
				operForm.empty();	//내부 비워주기 : url에 다 뜨기 때문에 form태그 안에 있는 내용 싹 다 날리는것
				
				// 수정 페이지에서 목록으로 이동하기 위함
				operForm.append(pageNumTag);
				operForm.append(amountTag); 
			} 
				operForm.submit();
				
			
			
			
		});
	});
	
</script>
<body>
	
	<div class="container1">
		<h1>공지사항 수정-삭제</h1>
		<div class="line"></div><br/><br/><br/><br/><br/>
		
			<form action="/JJ_notice/modify" method="post" id="operForm">
				<div class="notice_container">
					<input type="hidden" name="no" value="${notice.no }">
				
					<input class="form-control" name="title" value="${notice.title}">
					<br/><br/>
					<div class="notice_header">
						작성자 : smilepaws &nbsp;&nbsp;&nbsp; 작성일 : ${notice.regdate}
					</div>
					<br/><br/><br/><br/>
					<div class="notice_content">
						<textarea name="content" rows="30px" cols="80px">${notice.content}</textarea>
					</div>
					<br/><br/><br/><br/>
					<div class="btn">
						<button id="modify" type="submit" data-oper="modify">글 수정</button>
						<button id="remove" type="submit" data-oper="remove">글 삭제</button>
						<button id="list" type="submit" data-oper="list">목록</button>
						<input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }"> 
					</div>
				</div>
			</form>
		</div>
</body>
</html>
		

<%@ include file="../include/footer.jsp" %> 