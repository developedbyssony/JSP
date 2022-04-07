<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> <%-- 로그인 성공 시 페이지 --%>
</head>
<body>
<% 
   boolean goLogin = true; // 로그인창으로 보낼지 여부, true로 시작

   String id = null;
   Cookie[] cs = request.getCookies();
   
   for(Cookie c : cs) {
	   	String cookieName = c.getName();
	   if(cookieName.equals("nuck92")) {
		  goLogin = false;
	   }
   }
   
   if(goLogin) { // 불린값이 true면 실행
		response.sendRedirect("http://localhost:8080/JSPbasic_/login/login_page.jsp"); }
   

%>
	<h1>로그인 성공입니다.</h1>
	<a href="http://localhost:8080/JSPbasic_/login/logout_ok.jsp">로그아웃</a>
</body>
</html>