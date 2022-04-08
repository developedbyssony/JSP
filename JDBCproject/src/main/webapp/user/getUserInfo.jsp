<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- http://localhost:8080/JDBCProject/user/getUserInfo.jsp + "?userid=aaa1111" 
	 url에 파라미터 붙여서 전달 --> 
<%
	request.setCharacterEncoding("utf-8");
	// useid라는 이름으로 전달되는 데이터를 받으면 (request.get?????)
	String userId = (String)request.getParameter("userid");
	// DAO생성(MySQL을 쓴다고 가정)
	UserDAO dao = new UserDAO();
	UserVO user = dao.getUserInfo(userId);
	System.out.println("유저 정보 확인 : " + userId);
	out.println(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 유저 정보를 여기에 작성해주세요 -->
	아이디 : <%= user.getUserId() %> <br />
	비밀번호 : <%= user.getUserPw() %> <br />
	이름 : <%= user.getUserName() %> <br />
	이메일 : <%= user.getEmail() %> <br />
</body>
</html>