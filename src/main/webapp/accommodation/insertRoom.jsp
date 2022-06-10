<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>방 등록</h1>
	<h2>숙소번호는 외래키이기 때문에 실제 데이터베이스에 있는 값을 넣어주세용</h2>
	<form action="insertRoom.do" method = "post" enctype="multipart/form-data">
		숙소 	번호 : <input type="number" name="acco_id"> <br>
		최소 숙박 인원 : <input type="number" name="min_per" min="1"> <br>
		최대 숙박 인원 : <input type="number" name="max_per" min="1"> <br>
		최소 숙박일 : <input type="number" name="min_day" min="1"> <br>
		최대 숙박일 : <input type="number" name="max_day" min="1"> <br>
		1박 가격 : <input type="number" name="price"> <br>
		방 이름 : <input type="text" name="room_name"> <br>
		방 사진 : <input type="file" name="photos"> <br>
		방옵션 : <input type="text" name="room_option"> <br>
		<input type="submit" value="전송스">
	</form>
</body>
</html>