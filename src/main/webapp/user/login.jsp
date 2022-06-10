<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-scope" content="profile email">

<meta name="google-signin-client_id"
	content="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com">
<script src="http://apis.google.com/js/platform.js" async defer></script>

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

.background {
	background-color: yellow;
	/* background-repeat: repeat-y; */
	height: 150px;
	width: 100%;
}

.g-signin2 {
	height: 36px;
	width: 300px;
	margin: auto;
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

	<h1> &emsp; ID 로그인</h1>
	<form action="login.do" method="post">
	
		<label>아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>	
			<input type="text" name="id" > <br>
		
		<label>비밀번호 &nbsp;</label>	
			<input type="password" name="password"> <br>
		
		<input type = "submit" value = "로그인">     
		<input type = "button" value = "회원가입"><a href="signUp.jsp">회원가입</a>
		<input type = "reset" value = "취소">


	</form>


	<br>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
	</div>


	<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log("ID : " + profile.getId());
			console.log("Full Name : " + profile.getName());
			console.log("Given Name : " + profile.getGivenName());
			console.log("Family Name : " + profile.getFamilyName());
			console.log("Image URL : " + profile.getImageUrl());
			console.log("Email : " + profile.getEmail());

			var access_token = googleUser.getAuthResponse().access_token
			console.log("ID : " + id_token);
		}
	</script>

	<a href="#" onclick="signOut();">Sign out</a>
	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>
	<script>
		function onSignIn(googleUser) {
			var id_token = googleUser.getAuthResponse().id_token;
			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'https://yourbackend.example.com/tokensignin');
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.onload = function() {
				console.log('Signed in as: ' + xhr.responseText);
			};
			xhr.send('idtoken=' + id_token);
		}
	</script>


</body>
</html>