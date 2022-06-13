<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>Would You Travel?</title>
<style type="text/css">
.btn-primary {
	width: 500px;
	margin: auto;
	background-color: pink;
	color: white;
	border: pink;
}

.input-group {
	width: 500px;
	margin: auto;
}
</style>
</head>
<body>
	<h1>회원을 탈퇴하시겠습니까?</h1>
	<form action="userDelete.do" method="post"
		enctype="multipart/form-data">

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