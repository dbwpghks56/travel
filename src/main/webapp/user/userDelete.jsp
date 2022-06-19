<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>Would You Travel?</title>
<style type="text/css">
.btn-primary {
	width: 500px;
	margin-left :518px;
	background-color: pink;
	color: white;
	border: pink;
}

.input-group {
	width: 500px;
	margin: auto;
}

.input-group-text {
	width: 90px;
	background-color: pink;
	color: white;
}

.title{
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 3em;
	color: pink;
	margin-left: 600px;
}
</style>
</head>
<body>
	<br>
	<h1 class="title">Would You Travel</h1>
	<br><br>
	<form action="userDelete.do" method="post" enctype="multipart/form-data">

		<div class="input-group mb-3">
			<span class="input-group-text">아이디</span> <input type="text"
				class="form-control" placeholder="ID" name="id">
		</div>
		
		<div class="input-group mb-3">
			<span class="input-group-text">비밀번호</span> <input type="password"
				class="form-control" placeholder="PASSWORD" name="password"
				id="user_password">
		</div>
		<button type="submit" class="btn btn-primary">확인</button>
	</form>
</body>
</html>