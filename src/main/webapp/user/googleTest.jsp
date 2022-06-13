<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="google-signin-client_id"
	content="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com"> 
<script src="http://apis.google.com/js/platform.js" async defer></script>
</head>
<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> -->
<a href="#" onclick="signOut();">Sign out</a>

 <body>
 
 <script src="https://accounts.google.com/gsi/client" async defer></script>
    <div id="g_id_onload"
         data-client_id="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com"
         data-callback="handleCredentialResponse">
    </div>
    <div class="g_id_signin" data-type="standard"></div>
 
 
<script type="text/javascript">
	function onSignIn() {
		var profile = gapi.auth2.getAuthInstance().currentUser.get().getBasicProfile();
			id = profile.getId();
			username = profile.getName();
			img = profile.getImageUrl();
			email = profile.getEmail();
			alert('로그인 완료');
			
			post_to_url("/user/signUp.jsp",
					{'id': id , 'username': username, 'email':email,'img':img})
					
	}

	function post_to_url(path ,params , method= 'post') {
		const form = document.createElement('form');
		form.method = method;
		form.action = path;
		
		for(const key in params){
			if(params.hasOwnproperty(key)){
				const hiddenField = document.createElement('input');
				hiddenField.type = 'hidden';
				hiddenField.name = key;
				hiddenField.value = params[key];
				form.appendChild(hiddenField);
			}
											
		}
	
		document.body.appendChild(form);
		form.submit();

</script>
</body>

</html>