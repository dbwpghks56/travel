<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
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
	width: 200px;
	margin: auto;
}
=======
>>>>>>> refs/remotes/origin/hyun


<<<<<<< HEAD
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

=======
>>>>>>> refs/remotes/origin/hyun
</head>
<body>
<<<<<<< HEAD
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
=======
	<h1> &emsp; ID 로그인</h1>
	<form action="login.do" method="post">
	
		<label>아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>	
			<input type="text" name="id" > <br>
		
		<label>비밀번호 &nbsp;</label>	
			<input type="password" name="password"> <br>
		
		<input type = "submit" value = "로그인">     
		<input type = "button" value = "회원가입"><a href="signUp.jsp">회원가입</a>
		<input type = "reset" value = "취소">
>>>>>>> refs/remotes/origin/hyun

	</form>
	
</body>
</html>