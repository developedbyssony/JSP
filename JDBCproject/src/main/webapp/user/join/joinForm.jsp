<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="userJoinCheck.jsp" method="post">
		<input type="text" placeholder="아이디를 입력해주세요" name="uid"/> <br />
		<input type="text" placeholder="비밀번호를 입력해주세요" name="upw" /> <br />
		<input type="text" placeholder="이름을 입력해주세요" name="name" /> <br />
		<input type="text" placeholder="이메일을 입력해주세요" name="email" /> <br />
		<input type="submit" value="가입하기"/>
	</form>
</body>
</html>