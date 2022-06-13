<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="colors.js"></script>
<script>

function init() {
	console.log('init');
	gapi.load('auth2' ,function(){
		console.log('auth2');
		var gauth = gapi.auth2.init({
			client_id='572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com'
		})
		gauth.then(function(){
			console.log('googleAuth success');
			var loginBtn = document.querySelector('#loginBtn');
			if(gauth.isSignedIn.get()){
				console.log('logined');
				loginBtn.value = 'Logout';
			}else{
				console.log('logouted');
				loginBtn.value = 'Login';
			}
		}, function(){
			console.log('googleAuth fail');
		
		});
	});
}

</script>

<!-- <script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID : ' + profile.getId());
		console.log('Full Name : ' + profile.getName());
		console.log('Image URL : ' + profile.getImageUrl());
		console.log('Email : ' + profile.getEmail());

	}
</script> -->


</head>

<body>
	<input type = "button" id ="loginBtn" value ="checking..">
	<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
	<a href="index.jsp"></a>
	<input id=night_day type="button" value="night"
		onclick="nightDayHandler(this)">
	<script src="http://apis.google.com/js/platform.js? onload = init"
		async defer></script>
</body>
</html>