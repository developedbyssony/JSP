<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
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
System.out.println(uid);
System.out.println(upw);

// 회원 수정 페이지는
// 비번, 이름, 이메일을 수정할 수 있는 페이지입니다.
String getdata = (String)session.getAttribute("id");
if(getdata == null) { 
	response.sendRedirect("userform.jsp");
}

UserDAO dao = new UserDAO();
UserVO user = dao.getUserInfo(getdata);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%= user.getUserId() %>님 로그인을 환영합니다.</h1>
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
	<td> <%= user.getUserId() %> </td>
	<td> <%= user.getUserPw() %></td>
	<td> <%= user.getUserName() %> </td>
	<td>  <%= user.getEmail() %> </td>
	</tr> 
	</tbody>
</table> 
<a href="userdelete.jsp">회원 탈퇴</a>
<a href="userUpdateform.jsp">회원 정보 수정</a>
</body>
</html>