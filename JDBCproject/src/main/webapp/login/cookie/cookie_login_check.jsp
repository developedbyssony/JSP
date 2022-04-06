<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if(id.equals("nuck")) {
	if(pw.equals("abcdefg")) {
		Cookie user = new Cookie("nuck",id);
		response.addCookie(user);
		response.sendRedirect("http://localhost:8080/JSPbasic_/login/login_success.jsp");		
	} else {
		response.sendRedirect("http://localhost:8080/JSPbasic_/login/login_fail_password.jsp");
	}} else {
		response.sendRedirect("http://localhost:8080/JSPbasic_/login/login_fail_id.jsp");
	}
%>	
</body>
</html>