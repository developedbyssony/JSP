<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% System.out.println("콘솔에 메세지를 찍을 때는 System.out.println()을 씁니다."); 
	out.println("콘솔이 아닌 브라우저 화면에 메세지를 찍을 때는 out.println()을 씁니다.");%>
	<h2>구구단 2단</h2><hr />
	<% for(int i = 1; i < 10; i ++) { 
		out.println("2 *" + i + "=" + (i*2) + "<br/>");
	} %>
	<!-- 반복문과 조건문을 이용하여 구구단 홀수단(3,5,7,9)를 화면에 출력해주세요. -->
	<%
		for(int j=3; j<10; j++) {
			if(j%2!=0) {
				out.println("<h1>" + j + "단 출력하기</h1>");
				for(int s=1; s<10; s++) {
				out.println(j + "*" + s + "=" + (j*s) + "<br/>");
				}
				out.println("<hr/>");
			}
		}
	%>
</body>
</html>