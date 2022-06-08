<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
.form-group {
	width: 200px;
	margin: auto;
}

.log {
	width: 200px;
	height: 50px;
	margin: auto;
}

.title {
	width: 100px;
	margin: auto;
	margin-top: 100px;
	font-family: verdana;
}

.id {
	width: 1px;
	text-align: center;
}

.input-group-text {
	width: 90px;
}

a:hover{
	text-decoration: none;
}
</style>

</head>
<body>
	<h1 class="title">Login</h1>
	<br>
	<br>
	<br>
	<form action="login.do" method="post" enctype="multipart/form-data">

		<div class="form-group mb-3" style="width: 300px; margin: auto;">
			<input type="text" class="form-control" placeholder="ID" name="id">
		</div>
		
		<div class="form-group mb-3" style="width: 300px; margin: auto;">
			<input type="password" class="form-control" placeholder="PASSWORD" name="password">
		</div>
		
	
		<!-- input class = "log" type = "submit"  value = "로그인">   -->
		<div style="text-align: center;">
			<a href="signUp.jsp" style="margin-bottom: 10px;">회원가입</a>
		</div>
		<br>
		<br>
		<div style="text-align: center;">
		<button type="submit" class="btn btn-primary"
		style="width: 300px; margin: auto; background-color: #FFE6E6; color: black; border: #F2D1D1;">확인</button>
		</div>

		<!-- <input type="reset" value="취소"> -->

	</form>

</body>
</html>