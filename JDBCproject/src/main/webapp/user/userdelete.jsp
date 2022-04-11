<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String getdata = (String)session.getAttribute("id");
if(getdata == null) { 
	response.sendRedirect("userform.jsp"); } 
else { 
	//3) 로그인 했다면 회원 탈퇴 로직 실행
	session.invalidate(); 
	UserDAO dao = new UserDAO();
	dao.userDelete(getdata);
	response.sendRedirect("userform.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>탈퇴되셨습니다.</h1>
</body>
</html>