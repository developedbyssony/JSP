<%@page import="com.ict.domain.UserDAO"%>
<%@page import="com.ict.domain.UserVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	// 1. 전달되는 데이터를 받으면 
	String userId = request.getParameter("userid");
	String userPw = request.getParameter("userpw");
	
	// 2. 추후 DB에서 꺼낸 아이디와 패스워드를 저장할 변수
	String dbId = null;
	String dbPw = null;
	
	// 3. DAO를 이용한 로그인 로직으로 수정해주세요.
	UserDAO dao = new UserDAO(); // 사용 DB 지정
	UserVO user = dao.getUserInfo(userId);
	dbId = user.getUserId();
	dbPw = user.getUserPw();
	response.sendRedirect("loginWelcome.jsp");
	// 세션 발급 코드 작성
	session.setAttribute("id",userId);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>