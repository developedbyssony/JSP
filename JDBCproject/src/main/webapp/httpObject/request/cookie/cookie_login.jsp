<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
 * { margin: 10px; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- form을 이용해
	목적지 : cookie_login_check.jsp, 메서드 : post 
	name : id, name : pw를 submit 버튼을 통해 전달합니다. --%>
	<form action="http://localhost:8181/JSPbasic/jspobject/request/cookie/cookie_login_check.jsp" method="post">
		<input type="text" name="id" placeholder="아이디" /> <br />
		<input type="password" name="pw" placeholder="비밀번호" /> <br />
		<input type="submit" value="login" />
	</form>
</body>
</html>