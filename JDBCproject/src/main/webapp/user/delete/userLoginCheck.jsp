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
	String uid = request.getParameter("userid");
	String upw = request.getParameter("userpw");
	// 2. db 연동
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql1111";
	
	Uservo user = new Uservo();
	ResultSet rs = null;
	String idcheck = null;
	String pwcheck = null;
		
	try {
		Class.forName(dbType); 
		Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
		String sql = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,uid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) { // 메모리 회수를 위해 바로 조회
			// 생성된 uservo에 setter를 이용해 변수명에 맞는 자료 입력
			user.setUserId(rs.getString(1));
			user.setUserPw(rs.getString(2));
			user.setUserName(rs.getString(3));
			user.setUserEmail(rs.getString(4));
		} else {
			// rs.next()가 false라는 것은 db에 해당 아이디가 존재하지 않는 것이므로 아이디 없음 페이지
			response.sendRedirect("userIdFail.jsp");
		}
		rs.close(); // Resultset, Connection, PreparedStatement, close()로 닫을 수 있음 
		} catch(Exception e) {
		e.printStackTrace();
		}	
	
	if(rs.next()) { // rs.next()가 true = 아이디가 있다.
		pwcheck = rs.getString(2);
		if(upw.equals(pwcheck)) {
			session.setAttribute("id",uid);
			response.sendRedirect("http://localhost:8080/JDBCProject/user/delete/loginWelcome.jsp?userid=" + uid);
		} else {
			response.sendRedirect("userPwFail.jsp");
		}
		// out.println("아이디 : " + rs.getString(1) + "<br />");
		// out.println("패스워드 : " + rs.getString(2) + "<br />");
		// out.println("이름 : " + rs.getString(3) + "<br />");
		// out.println("이메일 : " + rs.getString(4));
		} else {
		response.sendRedirect("userIdFail.jsp");  // rs.next()가 false인 것 자체가 아이디가 존재하지 않는 것을 의미 
		}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>