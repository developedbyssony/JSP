<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// try~catch 구문을 이용해서 int a = 3 / 0;이 에러가 났을때
	// 브라우저 화면에 "에러가 발생했습니다."라는 문장이 띄워지도록 코드를 작성해보세요.
	// 에러가 나지 않았다면 나눗셈 결과를 body 태그 안에 출력되게 만들어주세요.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	try { 
		int a = 3 / 0;
		out.println("나눗셈 결과 : " + a);				} 
    catch(Exception e) { %>
	<h1>에러가 발생했습니다!</h1>
	 <% } finally { %>
	<h1> <% a %> </h1>
	 <% } %>
</body>
</html>