<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("uname");
	String id = request.getParameter("uid");
	String pw = request.getParameter("upw");
	String[] hobby = request.getParameterValues("hobby");
	String blood = request.getParameter("blood");
	String region = request.getParameter("region");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= name %> <br />
	<%= id %>  <br />
	<%= pw %> <br />
	<%= Arrays.toString(hobby) %> <br />
	<%= blood %> <br />
	<%= region %>
</body>
</html>