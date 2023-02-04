<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1,h3{
		text-align: center;
	}
	.register{
		text-align: center;
		margin: auto;
		width: 750px;
	}
	input[type="text" i]{
		width: 250px;
		height: 50px;
		text-align: center;
		border-radius: 15px;
	}
	textarea{
		background-color: gainsboro;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	var formObj = $("form");
	
	
	$("button").click(function(e){
		e.preventDefault();
		
		var oper = $(this).data("oper");
		
		var a_name = $("#a_name").val();
		var a_age = $("#a_age").val();
		var a_job = $("#a_job").val();
		var a_phone = $("#a_phone").val();
		var a_member = $("#a_member").val();
		var a_addr = $("#a_addr").val();
		var a_pet = $("#a_pet").val();
		
		
		
		if(a_name == ''){
			alert("성함을 입력하세요");
			$("#a_name").focus();
			return;
		}
		
		if(a_age == ''){
			alert("나이를 입력하세요");
			$("#a_age").focus();
			return;
		}
		
		if(a_job == ''){
			$("#a_job").focus();
			alert("직업을 입력하세요");
			return;
		}
		
		if(a_phone == ''){
			$("#a_phone").focus();
			alert("전화번호를 입력하세요");
			return;
		}
		
		if(a_member == ''){
			$("#a_member").focus();
			alert("가족구성원을 입력하세요");
			return;
		}
		
		if(a_addr == ''){
			$("#a_addr").focus();
			alert("거주지역을 입력하세요");
			return;
		}
		
		if(a_pet == ''){
			$("#a_pet").focus();
			alert("희망하는 아이를 입력하세요");
			return;
		}
		
		var chk = confirm("신청하시겠습니까?");
		
		if(oper == 'list'){
		}else if(oper == 'reset'){
			location.href='/HJ_adopt/HJ_adopt_list';
			formObj[0].reset();
		}else{
			console.log("submit clicked");
		}
		
		if(chk == 0){
			return;
		}
	formObj.submit();
	});
	
	
});


</script>
</head>
<body>

	<form action="/HJ_adopt/HJ_adopt_register" method="post" role="form">
		<div>
			<h1>입양 신청</h1>
			<h3 style="font-size: small;">입양신청을 해주시면 보호소에서 확인 후 연락드리겠습니다.</h3>
		</div>
		<div class="register">
			<table>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">신청자 성함</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_name" id="a_name"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">신청자 나이</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_age" id="a_age"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">신청자 직업</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_job" id="a_job"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">전화번호</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_phone" id="a_phone"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">가족구성원</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_member" id="a_member"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">거주지역/주거형태</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_addr" id="a_addr" placeholder="OO시 OO구/(원룸, 아파트, 단독주택)"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">희망하는 아이</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name="a_pet" id="a_pet"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: large; font-weight: bold;">안내문</td>
					<td></td>
				</tr>
				<tr>
					<td><textarea cols="100" rows="12" readonly="readonly" style="resize: none;">- 입양신청을 해주시면 보호소에서 확인 후 연락드리겠습니다.
- 입양은 선착순으로 진행되지 않으며, 개별 연락 후 조건에 맞는 분에게 입양하게 될 예정입니다.
- 나이는 일정한 수입이 있는 25세 이상, 60세 이하여야 하며 19세 미만은 부모님이 직접 입양을 신청하셔야 합니다.
- 입양이 확정될 경우 별도의 입양계약서/입양 책임비에 대한 절차가 있음을 알려드립니다.
- 입양책임비는 입양에 대한 최소한의 책임감을 담보하기 위해 받기로 결정하였습니다. 하지만 저희는 귀중한 아이들의 생명이 영리적인 목적으로 사용되길 원치 않습니다. 입양비는 입양 전 접종비 등 실비에 사용되며, 그 외 금액은 보증금 형식으로 보관하여 입양 6개월에서 1년 후 아이들이 잘 정착한 것을 확인한 뒤 돌려드리고자 합니다. 단, 입양 후 파양 시 입양책임비는 돌려드리지 않습니다.</textarea></td>
					<td></td>
				</tr>
			</table>
			
			
					<button class="btn btn-primary" data-oper="register">신청</button>
				
					<input type="reset" value="취소">
		</div>
	</form>
	

<%@ include file="../include/footer.jsp" %>

</body>
</html>