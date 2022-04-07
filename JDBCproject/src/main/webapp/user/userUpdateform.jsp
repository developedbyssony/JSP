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
	
	// db 연동
	request.setCharacterEncoding("utf-8");
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
	pstmt.setString(1,originId);
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
	<!-- form -->
	<% while(rs.next()) { %>
	<form action="userUpdateCheck.jsp" method="post">
	<!-- input type hidden은 입력한 폼을 보이지 않고 숨겨진 value값을 서버로 전송하는 요소를 말합니다. -->
	<input type="hidden" name="userid" value="<%= originId %>" /> <br />
	<input type="password" placeholder="<% out.println(rs.getString(2)); %>" name="pwUpdate" /> <br />
	<input type="text" placeholder="<% out.println(rs.getString(3)); %>" name="nameUpdate" /> <br />
	<input type="text" placeholder="<% out.println(rs.getString(4));  %>" name="emailUpdate" /> <br /> 
	<input type="submit" value="submit" />
	<% } %>
	</form>
</body>
</html>