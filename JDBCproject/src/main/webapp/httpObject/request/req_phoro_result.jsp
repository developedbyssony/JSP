<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String photo = request.getParameter("pic");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(photo.equals("1번그림")) { %>
	1번 그림을 골랐습니다. <br />
	 <img src="01.svg">
	<% } else if(photo.equals("2번그림")) { %> 
	2번 그림을 골랐습니다. <br />
	 <img src="02.svg"> <% } %>	
</body>
</html>