<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date = new Date();
		List<String> name = new ArrayList<>();
		name.add("허준");
		name.add("홍길동");
		name.add("허준");
		
		name.remove(1);
		name.remove("허준");
		
		out.println("멤버 목록 :" + name + "<br/>");
	%>
	현재 시간 정보 : <%= date.getHours() %>시 <%= date.getMinutes() %>분 <%= date.getSeconds() %>초
	
	
</body>
</html>