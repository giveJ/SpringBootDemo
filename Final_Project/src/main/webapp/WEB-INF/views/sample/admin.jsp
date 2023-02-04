<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 시큐리티 태그 라이브러리 --> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/sample/admin page.jsp</h1>
	
	<P>principal : <sec:authentication property="principal"/></P>
	<P>MemberVO : <sec:authentication property="principal.member"/></P>	<!-- member: MemberVO랑 똑같음 -->
	<P>사용자 이름 : <sec:authentication property="principal.member.username"/></P>	 <!-- vo에 있는 username -->
	<P>사용자 아이디 : <sec:authentication property="principal.username"/></P>
	<P>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></P>
	
	
	<a href="/customLogoutGet">Logout</a>
	
</body>
</html>