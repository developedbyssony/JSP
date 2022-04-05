<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");   
	String a = (String)session.getAttribute("s_id");

	// 로그인 안 한 사용자가 접근할 경우 강제로 로그인창으로 보내는 로
	if(a == null) {
		response.sendRedirect("session_login_form.jsp");
	}
	// application.getAttribute()를 이용해 값을 받아와서 아래에 출력해주세요.
	// 브라우저가 바뀌어도 공유됩니다. application은 모든 사용자가 공유하는 데이터!(ex. 동시접속자수)
	Integer b = (Integer)application.getAttribute("visit");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 성공</h1> <br />
	<h1> <%=  a %> 님 안녕하세요 </h1>
	<h1> count : <%=  b %></h1>
	<a href="session_logout.jsp">로그아웃하기</a>
</body>
</html>