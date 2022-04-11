<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// db 연동
request.setCharacterEncoding("utf-8");
String upw = request.getParameter("pwUpdate");
String uname = request.getParameter("nameUpdate");
String uemail = request.getParameter("emailUpdate");
String originId = (String)session.getAttribute("id");

UserDAO dao = new UserDAO();
dao.userUpdateCheck(originId,upw,uname,uemail);
response.sendRedirect("loginWelcome.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정이 완료되었습니다.</h1>
</body>
</html>