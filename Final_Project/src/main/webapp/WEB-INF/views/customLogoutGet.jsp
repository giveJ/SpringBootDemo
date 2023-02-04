<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Custom Logout Page</h1>
	
	<form action="/customLogout" method="post">	<!-- 정보가 넘어가니 당연히 POST 방식 -->
		<input type="hidden" name="${_crsf.parameterName }" value="${_crsf.token } ">
		<input type="submit">
	</form>
	
</body>
</html>