<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지</h1>
	<form action="myPage.do" method = "post">
	<input type = "button" value = "예약상세조회">
	<input type = "button" value = "예약취소">
	<input type = "button" value = "회원탈퇴">
	<h1>${user.user_name }</h1>
	<img alt="" src="../uploads/${user.u_image_path }">
	
	
	</form>
</body>
</html>