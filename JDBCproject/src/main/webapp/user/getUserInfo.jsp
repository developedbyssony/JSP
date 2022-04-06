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
	// 1. useid라는 이름으로 전달되는 데이터를 받으면 (request.get?????)
	String uid = request.getParameter("userid");
	// 2. db 연동
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql1111";
	
	ResultSet rs = null;
		
	try {
		Class.forName(dbType); 
		Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
		String sql = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,uid);
		rs = pstmt.executeQuery();
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
<table>
<tr>
<table border = "1">
	<thead>
		<th>유저 아이디</th>
		<th>유저 비밀번호</th>
		<th>유저 이름</th>
		<th>유저 이메일</th>
	</thead>
	<tbody>
	<tr> 
	<% while(rs.next()) { %>
	<td> <% out.println(rs.getString(1)); %> 유저의 정보입니다. </td>
	<td> <% out.println(rs.getString(2)); %></td>
	<td> <% out.println(rs.getString(3)); %> </td>
	<td>  <% out.println(rs.getString(4)); %> </td>
	<% } %>
	</tr> 
	</tbody>
</table> 
</body>
</html>