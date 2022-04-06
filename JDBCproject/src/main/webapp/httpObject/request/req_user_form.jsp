<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8080/JSPbasic_/JSPobject/request/req_user.jsp" method="post">
	이름 : <input type="text" name="uname"> <br />
	아이디 : <input type="text" name="uid">  <br />
	비밀번호 : <input type="password" name="upw" placeholder="비밀번호">	<br />
	취미 : <br />
	<input type="checkbox" name="hobby" value="러닝">러닝<br />
	<input type="checkbox" name="hobby" value="헬스">헬스<br />
	<input type="checkbox" name="hobby" value="필라테스">필라테스<br />
	<input type="checkbox" name="hobby" value="하이킹">하이킹<br />
	<input type="checkbox" name="hobby" value="넷플릭스">넷플릭스<br />
	<hr />
	혈액형 : <br />
	<input type="radio" name="blood" value="A">A<br />
	<input type="radio" name="blood" value="B">B<br />
	<input type="radio" name="blood" value="O">O<br />
	<input type="radio" name="blood" value="AB">AB<br />
	지역 : <br />
	<select name="region">
		<option value="서울">서울</option>
		<option value="경기">경기</option>
		<option value="강원">강원</option>
		<option value="충청">충청</option>
		<option value="전라">전라</option>
		<option value="경상">경상</option>
		<option value="제주">제주</option>
	</select>
	<input type="submit" value="submit">
</body>
</html>