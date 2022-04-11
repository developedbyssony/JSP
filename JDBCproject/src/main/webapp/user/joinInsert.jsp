<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	// 1. 전달되는 데이터를 받으면 
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// session.setAttribute("id",uid);
	
	UserDAO dao = new UserDAO();
	dao.userJoinCheck(uid,upw,name,email);
	response.sendRedirect("userform.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>가입이 완료되었습니다.</h1>
	<a href="userUpdateform.jsp">회원정보수정</a>
</body>
</html>