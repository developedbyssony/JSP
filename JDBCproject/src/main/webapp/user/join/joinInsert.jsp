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
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	// 2. db 연동
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql1111";
	
	ResultSet rs = null;
		
	try {
		Class.forName(dbType); 
		Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
		String sql = "INSERT INTO userinfo VALUES (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,uid);
		pstmt.setString(2,upw);
		pstmt.setString(3,name);
		pstmt.setString(4,email);
		pstmt.executeUpdate();
		} catch(Exception e) {
		e.printStackTrace();
		}	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>가입이 완료되었습니다.</h1>
</body>
</html>