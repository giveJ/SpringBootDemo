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
			operForm.attr("action", "/HJ_family/HJ_remove");
			}else{
				return;
			}operForm.submit();
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
	<h1>아이들 정보 수정</h1>
	
	<form action="/HJ_family/HJ_modify" method="post" role="form" id="oper" enctype="multipart/form-data">
		<div class="form-group">
				<div class="form-group">
					<input class="form-control" name="fno" value="${vo.fno }" type="hidden">
				</div>	
			<table>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;"></td>
					<td></td>
				</tr>
				<tr>
					<td><img src="${vo.familyImg }" name="familyImg"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">종류</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="variety" value="${vo.variety }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">제목</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_title" value="${vo.f_title }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">등록날찌</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_date" value="${vo.f_date}" readonly="readonly"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">나이</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_age" value="${vo.f_age }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">성별</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_gender" value="${vo.f_gender }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">몸무게</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_weight" value="${vo.f_weight }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">털색</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_color" value="${vo.f_color }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">발견장소</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_place" value="${vo.f_place }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">특징</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_special" value="${vo.f_special }"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">중성화 여부</td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-group" name="f_check" value="${vo.f_check }"></td>
					<td></td>
				</tr>
			</table>
			
			<div class="inputArea">
				 <label for="familyImg" style="font-weight: bold;">이미지</label><br/>
				 <input type="file" id="familyImg" name="file" />
				 <div class="select_img"><img src="" /></div>
				<%=request.getRealPath("/") %>
			</div>
			
					<button class="btn btn-warning" data-oper="modify">글 수정</button>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="type" value="${cri.type}" >
					<input type="hidden" name="keyword" value="${cri.keyword}" >
					<input type="button" value="글 삭제" id="delete">
					<input type="reset" value="취소">
		</div>
		
			
		
		
	</form>
	
	
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>