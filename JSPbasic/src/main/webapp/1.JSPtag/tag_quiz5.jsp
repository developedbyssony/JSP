<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		List<String> party = new ArrayList<>(); // 새로고침될 때마다 파티원이 누적되도록 함
	%>
	<% 
	String[] jobs = {"전사", "도적", "사냥꾼", "마법사", "사제"}; // 잡의 종류
	int r =(int)(Math.random() * jobs.length); // 0 ~ jobs.length사이의 난수 발생시키고 int로 컨버팅
	String job = jobs[r]; // job 변수 선언 후 r(0 ~ jobs.length-1사이의 int)번 인덱스의 jobs 원소를 저장
	party.add(job); // list에 job 변수를 add
	
	// 파티에 같은 직업이 몇 명이 있는지 찾는 작업!!!!!!!!!!!!!!!!!!!!!!!!!!!
	int cnt = 0; // cnt 정수 0으로 선언
	for(String player: party) { // 향상된 for문ㅡㅡㅋ  party 원소(player) 순차적으로 훑어볼 것입니다. 
		if(job.equals(player)) { //add된 job과 player를 비교해서 true이면 cnt += 1
			cnt += 1;
		}
	}
	%>
	<h1> 당신의 역할 </h1>
	당신에게 부여된 역할은?<%= job %> <br>
	당신에게 부여된 역할과 같은 역할을 가진 플레이어는?<%= cnt %>명입니다. <br>
	현재 파티 구성~!
	<% out.println(party);		%> <br>
	<% out.println(party.size()); %> 명 참가중~!
	

		
</body>
</html>