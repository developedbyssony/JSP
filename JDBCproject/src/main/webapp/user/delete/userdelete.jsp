<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
// 1. 전달되는 데이터를 받으면 
String getdata = (String)session.getAttribute("id");
// 2. db 연동
String dbType = "com.mysql.cj.jdbc.Driver";
String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
String connectId = "root";
String connectPw = "mysql1111";
//3) 로그인 여부 확인하고 로그인 안했다면 리다이렉트로 로그인창으로 보내기
if(getdata == null) { response.sendRedirect("userform.jsp"); } 
//3) 로그인 했다면 회원 탈퇴 로직 실행
else {
	ResultSet rs = null;
	
	try {
		Class.forName(dbType); 
		Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
		String sql = "DELETE FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,getdata);
		pstmt.executeUpdate();
		} catch(Exception e) {
		e.printStackTrace();
		}	
	
	session.invalidate(); 
	response.sendRedirect("userform.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>탈퇴되셨습니다.</h1>
</body>
</html>