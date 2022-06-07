<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>숙소 등록</h1>
	<h2>로그인하고 시도해주세용</h2>
	<form action="insertAcco.do" method = "post" enctype="multipart/form-data">
		user_id : ${user.user_id } <br>
		<input type="hidden" name="user_id" value="${user.user_id }">
		숙소 이름 : <input type="text" name="acco_name"> <br>
		주소 : <input type="text" name="address"> <br>
		도로명 주소 : <input type="text" name="new_address"> <br>
		사진 : <input type="file" name="photos"> <br>
		옵션 : <input type="text" name="acco_option"> <br>
		전화번호 : <input type="text" name="acco_phone"> <br>
		숙소 타입 : <input type="radio" name="acco_type" value="호텔"> 호텔 <input type="radio" name="acco_type" value="여관">여관 <br>
		<input type="radio" name="acco_type" value="게스트하우스"> 게스트하우스 <input type="radio" name="acco_type" value="펜션">펜션
		<input type="radio" name="acco_type" value="캠핑장">캠핑장 <br>
		<input type="submit" value="전송스">
	</form>
</body>
</html>