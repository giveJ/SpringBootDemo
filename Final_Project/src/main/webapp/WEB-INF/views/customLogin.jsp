<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시큐리티 태그 라이브러리 --> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
        * {
            box-sizing: border-box;
        }
        .top-blank {
            background-color: #d7ecfa;
        }
        .top-blank-content {
            width: 500px;
            margin: auto;
            padding: 100px;
            text-align: center;
        }
        .content {
            background-color: white;
            height: 70vh;
            padding: 20px;
        }
        .login-form {
			width: 350px;
			padding: 20px;
			margin: 0 auto;
		}
		.screen-out {
			display: none;
		}
		.login-input {
			width: 100%;
			padding: 20px 10px;
			box-sizing: border-box;
			border: 0.5px solid #d7ecfa;
            margin-bottom: 5px;
		}
		.login-btn {
			width: 100%;
			/* padding: 12px 122px */
			padding: 2% 39% 2% 39%;
			border-radius: 5px;
			border: 2px solid #0270ba;
			background-color: #d7ecfa;
			font-size: 1.2em;
			margin-top: 50px;
		}
        .login-btn:hover {
			background-color: #d7ecfa;
            color: #0270ba;
            border: 2px solid #0270ba;
		}
		.login-append {
			overflow: hidden;
			margin-top: 20px;
		}
		.login-append .login-check {
			float: left;
            color: orangered;
		}
		.login-append .find-info {
			float: right;
		}
        .find-info {
            color: white;
        }
        .find-info .find-info-text {
            color: black;
            text-decoration: none;
        }
		.find-info .find-info-text:hover {
			color: #0270ba;
			font-weight: bold;
		}
		a{
			text-decoration-line: none;
			color: black;
		}
</style>
</head>
<body>
	<!-- <div style="width: 40%; text-align: center;"> -->
	<div style="text-align: center;">
	    <div class="top-blank">
	        <div class="top-blank-content">
	            <h1>smile paws</h1> 
	            <h2>${error }</h2>
				<h2>${logout }</h2>
	        </div>
	    </div>
	    <div class="content">
	        <form action="/login" method="post">
	            <fieldset class="login-form">
	                <legend class="screen-out">로그인 정보 입력폼</legend>
	                <input type="email" class="login-input" placeholder="id" autofocus="on">
	                <input type="password" class="login-input" placeholder="password" autocomplete="off">
					<!-- <input type="submit" class="login-btn" value="로그인"> -->
					<br/><br/>
	                <a href="#" class="login-btn">로그인</a>
	                <!--security가 POST 방식일 때 데이터 변조됐는지 확인하는 반드시 필요한 코드 -->
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	                <div class="login-append">
	                    <div class="login-check">
	                    	<label>
								<input type="checkbox" name="remember-me">아이디 저장
							</label>
	                        <!-- <input type="checkbox" id="keep-login">
	                        <label for="keep-login">아이디 저장</label> -->
	                    </div>
	                    <div class="find-info">
	                        <a href="#" class="find-info-text">아이디</a> 
	                        &nbsp;/&nbsp;
	                        <a href="#" class="find-info-text">비밀번호 찾기</a>
	                    </div>
	                </div>
	            </fieldset>
	        </form>
		</div>
	</div>
		
    
    <script type="text/javascript">
       $(".btn-success").on("click", function(e){
           e.preventDefault();
           $("form").submit();
       });
   </script>

</body>
</html>