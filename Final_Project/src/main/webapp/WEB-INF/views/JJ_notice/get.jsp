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
			
			
			#listBtn{
				color : white;
				background-color: #c0dff4;
				padding: 5px;
				border: none;
				text-align: left;
				margin-left: 44%;
			}
			
			#listBtn2{
				color : white;
				background-color: #c0dff4;
				padding: 5px;
				border: none;
				text-align: left;
				margin-left: 10px;
			}
			
			
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var operForm = $("#operForm");
		
		// 버튼 클릭 스크립트----------------------------------------------
		
		$("#listBtn2").click(function(){
			
			operForm.append('<input type="hidden" name="no" value="'+${notice.no }+'">');
			operForm.submit();
			
			});
		
		
		
		$("#listBtn").click(function(){
				
			operForm.attr("action", "/JJ_notice/list");
			operForm.submit();
			
			});
			
		});
		
		
	
</script>
<body>
	
	<div class="container1">
		<h1>공지사항</h1>
		<div class="line"></div><br/><br/><br/><br/><br/>
			
			<div class="notice_container">
				<h3>${notice.title}</h3>
				<div class="notice_header">
					작성자 : smilepaws &nbsp;&nbsp;&nbsp; 작성일 : ${notice.regdate}
				</div>
				<br/><br/><br/><br/>
				<div class="notice_content">
					${notice.content}
				</div>
				<br/><br/><br/><br/>
				<div>
					<button id="listBtn" data-oper="list">목록보기</button>
					
					<c:if test="${member.user_grade eq 1}">
						<button id="listBtn2" data-oper="update">수정</button>
					</c:if>
				</div>
				
			 	<form action="/JJ_notice/modify" method="get" id="operForm">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				</form>
			
				
			</div>
		</div>

</body>
</html>
		

<%@ include file="../include/footer.jsp" %> 