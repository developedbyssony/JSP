<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${board }
	<h1>${board.boardNum }번 글 조회입니다.</h1>
	<input type="text" value="${board.title  }"> <br />
	<br />
	본문 : <textarea cols="40" row="10" placeholder="본문입니다.">${board.content  }</textarea>  <br />
	글쓴이 : <input type="text" value="${board.writer }"> <br />
    쓴 날짜 : ${board.writer }  <br />
    조회수 :  ${board.hit } <br />
    마지막 수정날짜 : ${board.mDate }  <br />
	
</body>
</html>