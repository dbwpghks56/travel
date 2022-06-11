<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com">
<script src="http://apis.google.com/js/platform.js" async defer></script>
</head>
<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
<a href="#" onclick="signOut();">Sign out</a>
<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log("ID : " + profile.getId());
		console.log("Full Name : " + profile.getName());
		console.log("Given Name : " + profile.getGivenName());
		console.log("Family Name : " + profile.getFamilyName());
		console.log("Image URL : " + profile.getImageUrl());
		console.log("Email : " + profile.getEmail());

		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token:" + id_token);
	}

	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
		/* auth2.disconnect(); */
	}
</script>
</body>
</html>