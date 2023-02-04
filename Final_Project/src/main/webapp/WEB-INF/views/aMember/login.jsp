<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Insert title here</title>
<style type="text/css">


	#container{
		border: 1px solid gray;
		padding: 20px;
		margin-top: 30px;
	}
	
	.wrap{
		margin-left: 20%;
		margin-right: 10%;
		margin-top: 5%;
	}
	
	
	.wrap-img{
		float: left;
	}

	.wrap-div{
		width: 500px;
		margin-left: 100px;
		text-align: left;
		float: left;
	}
	
	 .login-box{
   		border: 1px solid #c0dff4;
   		padding: 20px;
   		width : 500px;
   		padding: 20px;
   }
   
   
   .login-box-btn{
   		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
   }
   
    .login-box-btn:hover {
   		color : white;
		background-color: #c0dff4;
		padding: 5px;
		border: none;
		text-align: left;
		cursor: pointer;
   }
   
	#back{
		cursor: pointer;
	}
	
</style>
</head>
<body>
	<div class="wrap">
		<div class="wrap-img">
			<img src="../resources/img/smilepaws_logo.png" width="500px" height="500px" >
		</div>
		<div class="wrap-div">
			<form action="/aMember/login" method="post">
				<section id="container">
					<h1>Login</h1>
					<br/><br/><br/>
					<div class="form-group has-feedback">
						<label class="control-label" for="userId">아이디</label>
						<input class="form-control" type="text" id="userId" name="user_ID" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPass">비밀번호</label>
						<input class="form-control" type="password" id="userPass" name="user_PW" />
					</div>
					
					<!-- <input type="checkbox"> ID 저장 -->
					<br/><br/>
					<div class="form-group has-feedback">
						<button class="btn btn-info" type="submit" id="login" style="width: 100%;">로그인</button>
					</div>
					<br/>
					아직 가입 전인가요 ? <a href="/aMember/register">회원가입</a> <br/><br/>
					<a id="back">이전</a>
				</section>
			</form>
		</div>
	</div>
	<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	// 로그인
	$(".btn-info").on("click", function(e){
	    e.preventDefault();
	    
	    
		if($("#userId").val()=="" ){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}	
			
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}
	    
		
		   $("form").submit();
	});
	
	
	// 뒤로가기
	$("#back").on("click",function(e){
		window.history.back();
	});

</script>
 
</body>
</html>