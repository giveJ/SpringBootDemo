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
	h1,.register{
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
   table{
   		margin: auto;
   }
   input[type="text"] {
   		border-radius: 10px;
   		padding: 10px;
   		width: 300px;
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
			
			var variety = $("#variety").val();
			var f_title = $("#f_title").val();
			var familyImg = $("#familyImg").val();
			
			
			if(variety == ''){
				alert("종류를 입력하세요");
				$("#variety").focus();
				return;
			}
			
			if(f_title == ''){
				alert("제목을 입력하세요");
				$("#f_title").focus();
				return;
			}
			
			
			
			var chk = confirm("등록하시겠습니까?");
			
			if(oper == 'list'){
			}else if(oper == 'reset'){
				location.href='/HJ_family/HJ_list';
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
		$("#familyImg").change(function(){
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
	<form action="/HJ_family/HJ_register" method="post" role="form" enctype="multipart/form-data">
		<div>
			<h1>아이들 등록</h1>
		</div>
		<div class="register">
			<table>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">종류</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="variety" id="variety"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">제목</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_title" id="f_title"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">나이</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_age" id="f_age"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">성별</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_gender" id="f_gender"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">몸무게</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_weight" id="f_weight"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">털색</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_color" id="f_color"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">발견장소</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_place" id="f_place"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">특징</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_special" id="f_special"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">중성화 여부</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_check" id="f_check"></td>
					<td></td>
				</tr>
				<!-- <tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">원본 이미지</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="familyImg"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">썸네일</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="f_Img"></td>
					<td></td>
				</tr> -->
			</table>
			
			<div class="inputArea">
				 <label for="familyImg" style="font-weight: bold;">이미지</label><br/>
				 <input type="file" id="familyImg" name="file" />
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