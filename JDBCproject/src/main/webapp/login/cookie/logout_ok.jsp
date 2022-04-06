<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Cookie[] cookies = request.getCookies();  // 1. 전체 쿠키 목록 배열로 가져오기
	for(Cookie cookie : cookies) { // 2. for(자료형 변수명 : 배열명) === cookies 배열에 있는 Cookie 자료형 cookie를 모조리 추출
	String cookieName = cookie.getName(); // 3. cookieName 변수에 추출된 cookie.getName()을 저장
	if(cookieName.equals("nuck92")){ // 4. cookieName 변수가 "login_id"와 일치할 경우
		cookie.setMaxAge(0); // 5. setMaxAge를 0으로! 쿠키의 유효시간을 0초로
		response.addCookie(cookie);
		System.out.println(cookie.getMaxAge());
		}
	}
	// 로그아웃 후에 로그인 페이지로(쿠키의 이름이 nuck92인 사용자만 로그아웃 페이지를 볼 수 있도록=로그아웃 이후에 해당 페이지의 주소값을 입력해도 접속되지 않게 방지)
	response.sendRedirect("http://localhost:8080/JSPbasic_/login/login_page.jsp");		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout 처리</title>
</head>
<body>
	<h1>로그아웃되셨습니다.</h1>
</body>
</html>