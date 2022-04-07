<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// db 연동
request.setCharacterEncoding("utf-8");
String upw = request.getParameter("pwUpdate");
String uname = request.getParameter("nameUpdate");
String uemail = request.getParameter("mailUpdate");
String originId = (String)session.getAttribute("id");
String dbType = "com.mysql.cj.jdbc.Driver";
String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
String connectId = "root";
String connectPw = "mysql1111";
// ResultSet rs = null; select문 아니면 불필요
try {
Class.forName(dbType); 
Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
String sql = "UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,upw);
pstmt.setString(2,uname);
pstmt.setString(3,uemail);
pstmt.setString(4,originId);
pstmt.executeUpdate();
} catch(Exception e) {
e.printStackTrace();
}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정이 완료되었습니다.</h1>
</body>
</html>