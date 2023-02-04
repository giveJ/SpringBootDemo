<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1{
		text-align: center;
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
</style>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		var formObj = $("form");
		
		var amount = '${cri.amount}';
		var pageNum = '${cri.pageNum}';
		
		$("button").click(function(e){
			e.preventDefault();
			
			var oper = $(this).data("oper");
				
			
			var r_title = $("#r_title").val();
			var r_content = $("#r_content").val();
			var reviewImg = $("#reviewImg").val();
			
			if(r_title == ''){
				alert("제목을 입력하세요");
				$("#r_title").focus();
				return;
			}
			
			if(r_content == ''){
				alert("내용을 입력하세요");
				$("#r_content").focus();
				return;
			}
			
			
			var chk = confirm("등록하시겠습니까?");
			
			if(oper == 'list'){
			}else if(oper == 'reset'){
				location.href='/HJ_review/HJ_review_list';
				formObj[0].reset();
			}else{
				console.log("submit clicked");
			}
			
			if(chk == 0){
				return;
			}
			
		formObj.submit();
		});
		
		// 파일이 등록되면 현재화면에서 어떤 이미지인지 볼 수 있도록 해주는 역할
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
	<form action="/HJ_review/HJ_review_register" method="post" role="form" enctype="multipart/form-data">
		<div>
			<h1>후기 및 사진등록</h1>
		</div>
		<div class="register">
			<table>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">제목</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="r_title" id="r_title"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">내용</td>
					<td></td>
				</tr>
				<tr>
					<td><textarea name="r_content" rows="3" style="resize: none;" id="r_content"></textarea></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
			
			<div class="inputArea">
				 <label for="reviewImg" style="font-weight: bold;">이미지</label><br/>
				 <input type="file" id="reviewImg" name="file" />
				 <div class="select_img"><img src="" /></div>
				<%=request.getRealPath("/") %>
			</div>
			
			
					<button class="btn btn-primary" data-oper="register">등록</button>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="reset" value="취소">
		</div>
	</form>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>