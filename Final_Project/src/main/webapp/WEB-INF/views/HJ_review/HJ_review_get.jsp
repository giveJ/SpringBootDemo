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
	h1,label{
		text-align: center;
	}
	.panel-body{
		width: 25%;
		margin: auto;
		text-align: center;
	}
	label{
		margin: auto;
	}
	#modify{
		text-align: left;
	}
	 [type="button"] {
      padding: 15px;
      background-color: skyblue;
      border: 1px;
      border-radius: 5px;
   }
   
   [type="button"]:hover {
      padding: 15px;
      background-color: skyblue;
      border: 1px;
      cursor: pointer;
      color: white;
      border-radius: 5px;
   }
   #gogo{
	  margin: auto;
	  text-align: center;
	  margin-top: 20px;
   }
   #go{
   	width: 25%;
   	font-size: large;
   	font-weight: bold;
   }
   .form-group{
   	   padding: 10px;
   }
   #img_get{
   		margin: auto;
   		width: 100%;
   }
    .form-control{
   		width: 100%;
   		height: 50px;
   		border-radius: 15px;
   		font-weight: bold;
   		text-align: center;
   		font-size: large;
   		margin: auto;
   }
   #r_content{
   		height: 200px;
   }
   label{
   		font-size: small;
   		text-align: left;
   		font-weight: bold; 
   }
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		var operForm = $("#operForm");
		
		$("#modify").click(function(){
			var chk = confirm("수정하시겠습니까?");
			
			if(chk){
			operForm.append('<input type="hidden" name="rno" value="'+${vo.rno }+'">');
			}else{
				return;
			}
			operForm.submit();
		});
		

		$("#main").click(function(){
			operForm.attr("action", "/HJ_review/HJ_review_list");
			operForm.submit();
		});
		
		
	});
</script>
</head>
<body>
		<h1>입양사진 및 후기</h1>
			<div class="panel-body">
				<div class="form-group">
					<img src="${vo.reviewImg }" name="reviewImg" id="img_get">
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="r_title" value="${vo.r_title }" readonly="readonly">
				</div>	
				<div class="form-group">
					<label>내용</label>
					<input class="form-control" name="r_content" value="${vo.r_content }" readonly="readonly" id="r_content">
				</div>
				<div class="form-group">
					<label>등록날짜</label>
					<input class="form-control" name="r_date" value="${vo.r_date }" readonly="readonly">
				</div>
				
				<div>
					<button id = "modify" type = "button" class = "btn btn-warning">수정</button>
					<button id = "main" type = "button" class = "btn btn-primary">목록으로</button>
				</div>
			</div>
			
			<form action="/HJ_review/HJ_review_modify" method="get" id="operForm">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</form>
			
			
			
		<%@ include file="../include/footer.jsp" %>	
</body>
</html>