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
	h1{
		text-align: center;
	}
   
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
/* $(function(){
	var formObj = $("form");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var oper = $(this).data("oper");
			
		if(oper == 'list'){
		}else if(oper == 'reset'){
			location.href='/family/list';
		}else{
			console.log("submit clicked");
		}
		formObj.submit();
	}); */
	
	$(function(){
	
		var operForm = $("#oper");
		
		
		$("#delete").click(function(){
		var chk = confirm("정말 삭제하시겠습니까?");
			if(chk){
			operForm.attr("action", "/HJ_review/HJ_review_remove");
			}else{
				return;
			}
			operForm.submit();
		});
		
		$("#reviewImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
		
	});
	
</script>
</head>
<body>

	<h1>아이들 정보 수정</h1>
	
	<form action="/HJ_review/HJ_review_modify" method="post" role="form" id="oper" enctype="multipart/form-data">
		<div class="form-group">
				<div class="form-group">
					<input class="form-control" name="rno" value="${vo.rno }" type="hidden">
				</div>	
			<table>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;"></td>
					<td></td>
				</tr>
				<tr>
					<td><img src="${vo.reviewImg }" name="reviewImg"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">제목</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="r_title" value="${vo.r_title }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">내용</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="r_content" value="${vo.r_content }"></td>
					<td></td>
				</tr>
				
			</table>
					<button class="btn_btn-warning" data-oper="modify">글 수정</button>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="button" value="글 삭제" id="delete">
					<input type="reset" value="취소">
			</div>
		
			<div class="inputArea">
				 <label for="reviewImg" style="font-weight: bold;">이미지</label><br/>
				 <input type="file" id="reviewImg" name="file" />
				 <div class="select_img"><img src="" /></div>
				<%=request.getRealPath("/") %>
			</div>
		
	</form>
	
	
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>