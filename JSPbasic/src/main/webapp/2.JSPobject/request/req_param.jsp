<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" %>
<%--
	* 요청 파라미터
	
	- 클라이언트 측에서 서버로 데이터를 요청할 때 전달되는 변수를
	  요청 파라미터라고 부릅니다.
	  
	- 요청 파라미터는 URL 주소 뒤에 ?를 붙인 이후에 [파라미터변수명 = 값]을
	  통해 서버로 데이터를 전달할 수 있습니다.
	  
	- 요청 파라미터를 여러개 전달할 때는 두 번째 부터 &를 붙여서 나열합니다.
 --%>
 <%
 	// post방식 전달 시 한글이 깨지는 것을 방지하는 코드 (제일 위에 위치해야 함)
 	request.setCharacterEncoding("utf-8");
 	// 클라이언트의 전송 데이터를 받아오는 방법
 	// 내장객체 request의 getParmeter("변수명")을 사용
 	String a = request.getParameter("apple");
 	String b = request.getParameter("banana");
 	String c = request.getParameter("mango");
 	String d = request.getParameter("podo");
 	String e = request.getParameter("dalki");
 	// 1번쨰 방법
 	// 주소에 ?banana=사과 붙이면 b가 사과로 변함 
	// 2번쨰 방법
	// form을 만들어서 보냄
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	apple로 전송된 데이터 : <%= a %> <br />
	banana로 전송된 데이터 : <%= b %> <br />
	mango로 전송된 데이터 : <%= c %> <br />
	podo로 전송된 데이터 : <%= d %> <br />
	dalki로 전송된 데이터 : <%= e %> 
</body>
</html>