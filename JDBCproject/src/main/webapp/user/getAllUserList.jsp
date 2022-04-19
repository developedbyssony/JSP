<%@page import="java.util.List"%>
<%@page import="com.ict.domain.UserVO"%>
<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	UserDAO dao = new UserDAO(); //생성과 동시에 db타입까지 호출
	List<UserVO> userList = dao.getAllUserList(); 
	// 1) dao 클래스 안에 return 구문 작성
    // 2) dao 클래스의 메소드 1회 실행 후에는,
    //     List<UserVO> userList의 우변에 써놨던 리턴 구문덕분에 치킨 배달이 옵니다.
	// out.println("DAO에서 전달받은 자료들 : " + userList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<table>
	<tread>
	<tr>
		<strong><th>userId</th></strong>
		<strong><th>userPw</th></strong>
		<strong><th>userName</th></strong>
		<strong><th>email</th></strong>
	</tr>
	</tread>
	<tbody>
		<% for(UserVO board : userList) { %>
			<tr>
				<td><%= board.getUserId() %></td>
				<td><%= board.getUserPw() %> </td>
				<td><%= board.getUserName() %></td>
				<td><%= board.getEmail() %> </td>
			</tr>
		<% } %>
		<tbody>
	</table>
<body>
</body>
</html>