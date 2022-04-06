<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#btn {
	transform: translateY(60px);
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "http://localhost:8080/JSPbasic_/JSPobject/request/req_phoro_result.jsp" method="post">
	<table class="table">
	<th> 
		<tr>
		<td class="col-md-4"> <strong> 그림 </strong> </td>
		<td class="col-md-4"> <strong> 선택 </strong> </td>
		<td class="col-md-4"> 	<input type="submit" id="btn" value="그림보러가기" class="center-block" /> </td>
		</tr>
	</th>
		<tr>
		<td class="col-md-6"> <img src="01.svg"> </td>
		<td class="col-md-6"> <input type="radio" name="pic" value="1번그림" /> </td>
		</tr>
		<tr>
		<td class="col-md-6"> <img src="02.svg"> </td>
		<td class="col-md-6"> <input type="radio" name="pic" value="2번그림" /> </td>
		</tr>
	</table>
	</form>
</body>
</html>