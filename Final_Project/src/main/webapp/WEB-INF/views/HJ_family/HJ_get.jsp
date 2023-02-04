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
		background-color: white;
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
   .dli{
   		text-align: center;
   }
   label{
   		font-size: x-large;
   		text-align: left;
   		font-weight: bold; 
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
   .form-group{
   		text-align: left;
   }
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		
		var operForm = $("#operForm");
		
		$("#modify").click(function(){
			var chk = confirm("수정하시겠습니까?");
			
			if(chk){
			operForm.append('<input type="hidden" name="fno" value="'+${vo.fno }+'">');
			}else{
				return;
			}
			operForm.submit();
		});
		

		$("#main").click(function(){
			operForm.attr("action", "/HJ_family/HJ_list");
			operForm.submit();
		});
		
		
	});
</script>
</head>
<body>
		<h1>보호중 아이정보</h1>
			<div class="panel-body">
				<div class="form-group">
					<img src="${vo.familyImg }" name="familyImg" id="img_get">
				</div>
				<div class="form-group">
					<label>종류</label>
					<input class="form-control" name="variety" value="${vo.variety }" readonly="readonly">
				</div>	
				<div class="form-group">
					<label>글 제목</label>
					<input class="form-control" name="f_title" value="${vo.f_title }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>등록날짜</label>
					<input class="form-control" name="f_date" value="${vo.f_date }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>나이</label>
					<input class="form-control" name=f_age value="${vo.f_age }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>성별</label>
					<input class="form-control" name=f_gender value="${vo.f_gender }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>몸무게</label>
					<input class="form-control" name=f_weight value="${vo.f_weight }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>털색</label>
					<input class="form-control" name=f_color value="${vo.f_color }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>발견장소</label>
					<input class="form-control" name=f_place value="${vo.f_place }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>특징</label>
					<input class="form-control" name=f_special value="${vo.f_special }" readonly="readonly">
				</div>
				<div class="form-group">
					<label>중성화 여부</label>
					<input class="form-control" name=f_check value="${vo.f_check }" readonly="readonly">
				</div>
				<div class="dli">
		 		<img src="../resources/images/getImg.png" width="500px" height="900px">
		 		</div>
				<div>
					<button id = "modify" type = "button" class = "btn btn-warning">수정</button>
					<button id = "main" type = "button" class = "btn btn-primary">목록으로</button>
				</div>
			</div>
				<!-- <div id="gogo">
					<input type="button" value="입양 신청하기" id="go">
				</div> -->
			
			
			<form action="/HJ_family/HJ_modify" method="get" id="operForm">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
				<input type="hidden" name="type" value="<c:out value='${cri.type}'/>" >
				<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>" >
			</form>
			
			
			
			<%@ include file="../include/footer.jsp" %>
</body>
</html>