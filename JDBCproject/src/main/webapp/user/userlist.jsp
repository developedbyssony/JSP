<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
	request.setCharacterEncoding("utf-8");
	String fId = request.getParameter("fid");
	String fPw = request.getParameter("fpw");
	String fName = request.getParameter("fname");
	String fEmail = request.getParameter("femail");
	*/
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql1111";
	
	ResultSet rs = null;
	
	try {
		Class.forName(dbType); 
		Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
		String sql = "SELECT * FROM userinfo";
		PreparedStatement pstmt = con.prepareStatement(sql);
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
<!-- 스크립릿 내부에 전체 회원 정보를 가져오도록 코드를 작성하여 ResultSet 변수에 저장까지만 해주세요. -->
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
	<td> <% out.println(rs.getString(1)); %> </td>
	<td> <% out.println(rs.getString(2)); %></td>
	<td> <% out.println(rs.getString(3)); %> </td>
	<td>  <% out.println(rs.getString(4)); %> </td>
	<% } %>
	</tr> 
	</tbody>
</table> 
</body>
</html>