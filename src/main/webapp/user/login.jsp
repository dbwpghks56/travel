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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
.form-group {
	width: 300px;
	margin: auto; //
	style ="width: 300px;
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

a:hover {
	text-decoration: none;
}

.signup {
	text-align: center;
}

.btn {
	width: 300px;
	margin: auto;
	background-color: #FFE6E6;
	color: black;
	border: #F2D1D1;
}

.background{
background-color : yellow;
	/* background-repeat: repeat-y; */
	height: 150px;
	width: 100%;
}
</style>

</head>
<body>

	<h1 class="title">Login</h1>
	<br>
	<br>
	<br>
	<form action="login.do" method="post" enctype="multipart/form-data">

		<div class="form-group mb-3">
			<input type="text" class="form-control" placeholder="ID" name="id">
		</div>

		<div class="form-group mb-3">
			<input type="password" class="form-control" placeholder="PASSWORD"
				name="password">
		</div>

		<!-- input class = "log" type = "submit"  value = "로그인">   -->
		<br>
		<div class="signup">
			<a href="signUp.jsp">회원가입</a>
		</div>
		<br>
		<div style="text-align: center;">
			<button type="submit" class="btn btn-primary">확인</button>
		</div>

		<!-- <input type="reset" value="취소"> -->

	</form>

	
</body>
</html>