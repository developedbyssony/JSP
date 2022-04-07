<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");   
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   
   if(id.equals("abc1234")) {
	   if(pw.equals("1111")) {
		   	String is_test = id;
			session.setAttribute("s_id",is_test);
			response.sendRedirect("session_login_ok.jsp"); }
	    else {
			response.sendRedirect("session_login_fail.jsp"); }
	   		 } 
       else { response.sendRedirect("session_login_fail.jsp"); }
%>
</body>
</html>