<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	 	<div class="row">
	 		<div class="col-12">
	 		<form action="http://localhost:8181/JSPbasic/jspobject/response/quiz_result.jsp" method="post">
	 			<table class="table" border="1">
	 				<td class="text-center" colspan="3"><strong>HONNE</strong></td>
	 				<tr>
	 				<td  class="text-center" colspan="3"><strong>듣고 싶은 노래를 선택하면 유투브 영상을 볼 수 있어요</strong></td>
	 				</tr>
	 				<td class="text-center">Warm on a cold night</td>
	 				<td class="text-center">Somone that loves you</td>
	 				<td class="text-center">It's aint wrong loving you</td>
	 				</tr>
	 				<tr>
	 				<td class="text-center"><img src="">사진</td>
	 				<td class="text-center"><img src="">사진</td>
	 				<td class="text-center"><img src="">사진</td>
	 				</tr>
	 				<tr>
	 				<td class="text-center"><input type="radio" name="music" value="11"/></td>
	 				<td class="text-center"><input type="radio" name="music" value="22"/></td>
	 				<td class="text-center"><input type="radio" name="music" value="33"/></td>
	 				</tr>
	 				<tr class="text-center">
	 				<td colspan="3"> <input type="submit" value="submit" /> </td>
	 				</tr>
	 			</table>
	 			</form>
	 		</div>
	 	</div>
	</div>
</body>
</html>