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
 	String strAge = request.getParameter("age"); // http 특성 상 무조건 문자로 들어옴
 	System.out.println(strAge); // 콘솔에서 확인
 	// out.println(strAge); // 브라우저에서 확인
	int age = Integer.parseInt(strAge);
%>
<% 
	if(age >19) {
	out.println("<h1>당신은 성인입니다.</h1>");
	response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/response/res_adult.jsp");
	} else { 
	out.println("<h1>당신은 미성년자입니다.</h1>");
	response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/response/res_kids.jsp");
	} %>
</body>
</html>