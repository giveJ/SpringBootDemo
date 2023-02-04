<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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
	
	
	
	.fail{
		color: red;
		
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">

	$(function(){
		
		// 취소
		$(".cencle").on("click", function(){
			location.href = "/";
		})
		
		
		// 탈퇴 진행
		$("#submit").on("click", function(){
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}	
			
			$.ajax({
				url : "/aMember/passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						alert("비밀번호를 확인해주세요.");
						return;
						
					}else{
						alert("회원탈퇴 후 데이터 복구가 불가능합니다.");
						alert("회원탈퇴가 완료되었습니다.");
						
						$("#delForm").submit();
						
					}
			
				}
			}) // ajax end-------------------
		}); // 탈퇴 진행 end-------------------

	})
		
			
</script>



<body>
	<div class="container1">
		<h1>회원탈퇴</h1>
		<div class="line"></div>
		<br />
		<h5>회원 탈퇴 후 데이터는 모두 삭제됩니다.</h5>
		
		
		<section id="container">
			<form action="/aMember/delete" method="post" id="delForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="user_ID" value="${member.user_ID}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="user_PW" />
						<div class="fail">
							<c:if test="${msg == false}">
								비밀번호를 확인해주세요.
							</c:if>
						</div>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="user_NAME" value="${member.user_NAME}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			
		</section>
	</div>
</body>
</html>


<%@ include file="../include/footer.jsp"%>