<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();  
	for(Cookie cookie : cookies) { 
	String cookieName = cookie.getName();
	int i = cookie.getMaxAge(); 
    System.out.println(i);
	if((cookieName.equals("nuck92")) && (i != 0)) { 
		response.sendRedirect("http://localhost:8080/JSPbasic_/login/login_success.jsp"); }
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<form action="http://localhost:8080/JSPbasic_/login/cookie_login_check.jsp" method="post">
	<input type="text" placeholder="아이디" name="id" /> <br />
	<input type="password" placeholder="비밀번호" name="pw" /> <br />
	<input type="submit" />  <br />
	</form>
</body>
</html>