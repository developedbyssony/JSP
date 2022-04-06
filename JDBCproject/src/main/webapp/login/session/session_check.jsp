<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	세션에 저장된 데이터는 브라우저 창이 종료할 때까지 혹은
	세션의 유효시간이 만료되기 전까지 웹어플리케이션의 모든
	JSP 페이지에서 사용할 수 있습니다.
	
	세션에 저장될 데이터를 가져오려면 session객체의
	getAttribute()메서드를 사용하며
	매개값으로 가져온 데이터의 세션명을
	적어주면 됩니다. (request.getParameter()와 유사)
	*/
	String userId = (String)session.getAttribute("id_session");
	String userName = (String)session.getAttribute("name_session");
	System.out.println(userId);
	System.out.println(userName);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>안녕..</h1>
<% 
   out.println("id_session : " + userId); %>  <br />
<% out.println("name_session : " +userName);
%>
</body>
</html>