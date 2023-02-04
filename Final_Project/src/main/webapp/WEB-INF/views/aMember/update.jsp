<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원가입</title>
</head>
<style>
	#container{
		width: 1000px;
		margin: 80px;
	}

	
	.container1 {
	margin-left: 15%;
	color: black;
	}


	.line {
		border: 4px solid #c0dff4;
		width: 80%;
		margin-right: 10%
	}
	
	
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/main";
						    
			})
			
			// 정보수정
			$("#submit").on("click", function(){
				
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
					
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				
				
				if($("#userTel").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#userTel").focus();
					return false;
				}
				
				if($("#userAdder").val()==""){
					alert("주소를 입력해주세요.");
					$("#userAdder").focus();
					return false;
				}
				
				
				if($("#userAge").val()==""){
					alert("나이를 입력해주세요.");
					$("#userAge").focus();
					return false;
				}
				
				
				
				if($("#userPass").val().length > 50){
					alert("비밀번호는 50자 미만입니다.");
					return false;
				}
				
				if($("#userName").val().length > 20){
					alert("이름은 20자 미만입니다.");
					return false;
				}
				
				if($("#userEmail").val().length > 30){
					alert("이메일은 30자 미만입니다.");
					return false;
				}
				
				if($("#userTel").val().length > 50){
					alert("전화번호는 50자 미만입니다.");
					return false;
				}
				
				
				
				
				alert("회원정보가 수정되었습니다. 다시 로그인 해주세요.");
				
			});
			
			
			
			// 회원탈퇴
			$("#byebye").on("click", function(){
				
				location.href = "/aMember/memberDeleteView";
						    
			})
			
		})
</script>



<body>
	<div class="container1">
		<h1>회원정보수정</h1>
		<div class="line"></div>
		<br />
		<h5>입력하신 회원정보를 토대로 예약 신청을 받고 있으니 정확한 정보를 기재해 주세요.</h5>
	<section id="container">
			<form action="/aMember/update" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="user_ID" value='${member.user_ID}' readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="user_PW" value='${member.user_PW}'/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="user_NAME" value='${member.user_NAME}'/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일</label>
					<input class="form-control" type="text" id="userEmail" name="user_EMAIL" value='${member.user_EMAIL}'/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">전화번호</label>
					<input class="form-control" type="text" id="userTel" name="user_TEL" value='${member.user_TEL}'/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">주소</label>
					<input class="form-control" type="text" id="userAdder" name="user_ADDR" value='${member.user_ADDR}' />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="useAge">나이</label>
					<input class="form-control" type="text" id="userAge" name="user_age" value='${member.user_age}' />
				</div>
				<div class="form-group has-feedback">
					<input type="checkbox">이용약관, 개인정보 수집 및 보관에 대해 동의합니다.
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">정보수정</button>
					<button class="cencle btn btn-danger" type="button" id="byebye">회원탈퇴</button>
					<button class="cencle btn btn-point" type="button">취소</button>
				</div>
			</form>
		</section> 	
	</div>

</body>
</html>


<%@ include file="../include/footer.jsp"%>