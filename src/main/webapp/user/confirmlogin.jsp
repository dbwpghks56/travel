<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img {
		display: inline-block;
		border-radius: 80%;
		border: 5px solid pink;
	}
</style>
</head>
<body>
	${user.user_name }
	${user.nickname }
	<img alt="" src="../uploads/${user.u_image_path }" width="200" height="200">
	<a href="../reservation/rsvlist.do">예약보기</a>
	<a href="../accommodation/search.do">숙소검색</a>
</body>
</html>