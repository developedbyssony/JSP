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
	<%  ArrayList<Integer> list = new ArrayList();  
	    boolean bool = true;
		while(bool ==  true) { // while : 몇 바퀴 돌지 모르겠을 때, for : 몇 바퀴 돌지 알겠을 때
			// while(true)일떄 무한루프~~!
			int num = (int)(Math.random() * 45) + 1; // (Math.random() * 45)을 인티저화하면 0~44 (순수한 math.random은 0~0.999까지의 난수 발생)
				if(!list.contains(num)) {
					list.add(num);
				}
				if(list.size() == 6) {
					bool = false;
				}
			}
		Collections.sort(list);
		%>
	<h1> 로또 번호 생성 결과 </h1>
	<h6> 이번주 로또는 이 번호다 ㅎ</h6>
	<%
		for(Integer num : list) {
		out.println(num);
		Thread.sleep(700); // CPU를 잠시 멈추는 메서드
		out.flush(); //브라우저 출력 버퍼를 비우는 메서드
	}
	 %>
</body>
</html>