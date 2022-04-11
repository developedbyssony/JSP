<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 회원 수정 페이지는
	// 비번, 이름, 이메일을 수정할 수 있는 페이지입니다.
	String originId = (String)session.getAttribute("id");
	if(originId == null) { 
		response.sendRedirect("userform.jsp");
	}

	UserDAO dao = new UserDAO();
	UserVO user = dao.getUserInfo(originId);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form -->
	<form action="userUpdateCheck.jsp" method="post">
	<!-- input type hidden은 입력한 폼을 보이지 않고 숨겨진 value값을 서버로 전송하는 요소를 말합니다. -->
	<input type="hidden" name="userid" value="<%= originId %>" /> <br />
	<input type="password" name="pwUpdate" /> <br />
	<input type="text" value="<%= user.getUserName() %>" name="nameUpdate" /> <br />
	<input type="text" value="<%= user.getEmail() %>" name="emailUpdate" /> <br /> 
	<input type="submit" value="submit" />
	</form>
</body>
</html>