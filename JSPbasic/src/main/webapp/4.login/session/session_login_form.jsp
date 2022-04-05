<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 이미 로그인한 사람이 로그인 페이지를 들어올 수도 없게 해야 합니다.
	// 로그인한 사람이 들어오는 경우, session_login_ok.jsp로 보내주세요.
	request.setCharacterEncoding("utf-8");   
	String a = (String)session.getAttribute("s_id");
	
	if(a != null) {
		response.sendRedirect("session_login_ok.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8080/JSPbasic_/login/session/session_login_check.jsp" method="post">
		<input type="text" name="id">
		<input type="password" name="pw">
		<input type="submit" value="submit">
	</form>
</body>
</html>