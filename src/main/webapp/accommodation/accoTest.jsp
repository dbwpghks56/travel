<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 등록이엥요요</h1>
<form action="insertAcco.do" method="post">
	아이디 : <input type = "text" name = "아이디"> <br>
	숙소명 : <input type = "text" name = "숙소이름"> <br>
	주소 :<input type = "text" name = "주소"> <br>
	도로명 주소 :<input type = "text" name = "도로명주소"> <br>
	숙소 사진 : <input type="file" name="photos"><br>
	옵션 : <input type = "text" name = "옵션"> <br>
	전화번호 : <input type = "text" name = "전화번호"> <br>
	숙소 타입 : <input type="radio" name="Acco" value="0"> 호텔 <br>
	<input type="radio" name="Acco" value="1"> 펜션 <br>
	<input type = "submit" value = "등록">	
</form>
</body>
</html>