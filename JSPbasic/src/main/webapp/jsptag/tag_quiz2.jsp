<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int r = 0;
	%>
	<%
		r++;
	%>
	페이지 누적 요청수 <%= r %> <br />
	매 10번째 방문자에게는 기프티콘을 드립니다. <br />
	<% if(r > 9) { %>
		당첨되셨습니다!!
	<% } %>
</body>
</html>