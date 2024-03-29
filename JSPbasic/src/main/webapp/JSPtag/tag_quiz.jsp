<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		// int randomNumber() 메서드를 선언해주세요.
		// 정수 1~10까지의 난수를 발생시켜 리턴해줍니다.
		int randomNumber() {
			return (int)(Math.random() * 10) + 1;
	}
	
	String randomColor() {
			String[] arr = new String[3];
			arr[0] = "빨강";
			arr[1] = "파랑";
			arr[2] = "노랑";
			int num = (int)(Math.random() * 3);
			return arr[num];
			
			// 강사님 풀이
			// double d = Math.random();
			// if(d >= 0.66) {
			// return "빨강";
			// } else if(d >= 0.33) {
			// return "노랑";
			// } else {
			// return "파랑";
			// }
		}
	
		// 선언부(Declaration)에 선언한 변수는 딱 한 번만 실행되는 static 속성을 가지게 됩니다.
		// 선언된 static 변수는 서버가 꺼질 때까지 유지, 누적됩니다. 
		int total = 0;
	%>
	<%
		// 스크립트릿에 선언한 변수는 새로고침(접속) 할 때 마다 새롭게 선언됩니다.
		// 새로고침 시 선언부는 실행되지 않습니다. (최초 실행시만 선언부 1회 실행)
		int each = 0;
		total++;
		each++;
	%>
	오늘의 행운의 숫자와 행운의 색깔 <hr />
	행운의 숫자 : 	<%=  randomNumber()	%> <br />
	행운의 색깔 : <%=  randomColor()	%>	<br />
	누적 방문수 : <%= total %> <br />
	방문자수(사용자 only me 1^^) : <%= each %>	
</body>
</html>