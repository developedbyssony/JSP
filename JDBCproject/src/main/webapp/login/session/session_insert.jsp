<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	   세션은 쿠키와 마찬가지로 http 통신 데이터를 유지하기 위한 수단으로 사용합니다.
	   세션에 데이터를 저장할 때는 JSP 내장 객체 session에 지원하는 
	   setAttribute() 메서드를 활용합니다.
	   해당 메서드에 첫번째 값으로 세션의 이름을 적어주고
	   두번째 값으로 저장할 데이터를 정해주면 됩니다.
	 */
	 				
	 // 세션 발급, 서버에 저장
	 // 1. 세션 발급할 수 있음
	 // 2. 서버에 삭제해달라고 요청 가능 
	 						//세션아이디   세션데이터
	 session.setAttribute("id_session","abc1234");
	 session.setAttribute("name_session","김말이");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 확인하러 가기</title>
</head>
<body>
<%-- session_check.jsp를 만들어서 목적지로 넣어주세요.  --%>
<a href="http://localhost:8080/JSPbasic_/login/session/session_check.jsp">세션 확인하러 가기</a>
</body>
</html>