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
 	String a = id;
 	String b = pw;
	System.out.println(id);
	System.out.println(pw);

%>
<% 
 	// 로그인 처리를 해보겠습니다.
 	// 로그인 아이디는 "abc1234"인 경우만 허용
 	// 비밀번호는 "1111"인 경우만 허용하겠습니다. (추후 DB데이터로 로그인처리하는 법 배울 것임)
 	// 조건문을 이용해주시면 되는데
 	// 로그인의 경우 크게 3가지로 나뉩니다.
 	// 1. 아이디가 없는 경우 
 	// 2. 아이디는 있으나 비번이 틀린 경우
 	// 3. 아이디와 비번이 모두 일치하는 경우 
 	// 1의 경우 콘솔에 "아이디가 없습니다." -> login_id_fail.jsp
 	// 2의 경우 콘솔에 "비밀번호가 틀렸습니다." -> login_pw_fail.jsp
 	// 3의 경우 콘솔에 "로그인하셨습니다. 환영합니다." -> login_ok.jsp
 	// 라고 찍히도록 조건문을 작성해보세요. -> 로 리다이렉트 시켜주시고 콘솔대신 body에 문장을 찍으세요.
 	 if (!id.equals("abc1234")) {
 	 	response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/request/cookie/login_id_fail.jsp");
 	} else if (id.equals("abc1234") && pw.equals("1111")) {
 	  	response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/request/cookie/login_ok.jsp");
 	} else {
 		response.sendRedirect("http://localhost:8181/JSPbasic/jspobject/request/cookie/login_pw_fail.jsp");
 	}
 %>
</body>
</html>