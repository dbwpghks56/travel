<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>Would You Travel?</title>
<style type="text/css">
.btn-primary {
	display: block;
	width: 500px;
	background-color: pink;
	color: white;
	border: pink;
	margin: auto;
}

.btn-primary:hover {
	background-color: #F582A7;
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
	clear: both;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 3em;
	color: pink;
	text-align: center;
}
</style>
</head>
<body>
	<br>
	<h1 class="title">회원 탈퇴</h1>
	<br><br>
	<form action="userDelete.do" method="post" enctype="multipart/form-data">

		<div class="input-group mb-3">
			<span class="input-group-text">아이디</span> <input type="text"
				class="form-control" placeholder="ID" name="id" value="${user.user_id }">
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