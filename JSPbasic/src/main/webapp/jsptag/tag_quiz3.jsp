<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 int j = (int)(Math.random() * 8) + 2; // ( * 곱하는 값 -> 실제로는 0~7범위) + 2 = 2~9 사이의 난수 발생
	%>
	<h1> 랜덤 구구단 <%= j %> 단 </h1>
	<p> 이번에 나온 구구단은 <%= j %>단 입니다. </p>
	<% for(int i=1; i<10; i++) { %>
			<%= j %> * <%= i %> = <%= j * i %>
			<br />
	<% } %>
</body>
</html>