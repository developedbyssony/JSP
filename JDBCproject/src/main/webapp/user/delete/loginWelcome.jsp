<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("userid");
String upw = request.getParameter("userpw");
String getdata = (String)session.getAttribute("id");
if(getdata == null) { response.sendRedirect("userLoginForm.jsp"); } 
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%= uid %>님 로그인을 환영합니다.</h1>
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
	<td> <% out.println(rs.getString(1)); %> </td>
	<td> <% out.println(rs.getString(2)); %></td>
	<td> <% out.println(rs.getString(3)); %> </td>
	<td>  <% out.println(rs.getString(4)); %> </td>
	<% } %>
	</tr> 
	</tbody>
</table> 
<a href="userdelete.jsp">회원 탈퇴</a>
<a href="userUpdateform.jsp">회원 정보 수정</a>
</body>
</html>