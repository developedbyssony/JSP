<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
String getdata = (String)session.getAttribute("id");
if(getdata != null) { response.sendRedirect("loginWelcome.jsp"); } 
-->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <form action="getUserInfo.jsp" method="get" /> -->
<form action="userLoginCheck.jsp" method="post" />
	<input type="text" placeholder="아이디를 입력해주세요." name="userid" /> <br />
	<input type="password" placeholder="패스워드를 입력해주세요." name="userpw" /> <br />
	<input type="submit" value="제출" />
	<a href="joinForm.jsp">회원가입</a>
</form>
</body>
</html>