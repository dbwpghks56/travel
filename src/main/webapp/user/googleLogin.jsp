<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <html>
<head>
<meta charset="UTF-8">
<meta name ="google-signin-client_id" content="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com">

content에 자신의 OAuth2.0 클라이언트ID를 넣습니다.
</head>
<body>
<ul>
 <li id="GgCustomLogin">
  <a href="javascript:void(0)">
   <span>Login with Google</span>
  </a>
 </li>
</ul>
<script>
<script src = "http://apis.google.com/js/platform.js" async defer></script>
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyBxIw-IziKCc78-FI9HsEgLLaUPDX_uu6M', 'access_token': access_token}
		, method:'POST'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
<div class = "g-signin2" data-onsucceess= "onSugnln"></div>
</script>
//구글 api 사용을 위한 스크립트
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html> -->

<html>
<head>
	<meta name="google-signin-scope" content="profile email">
  	<meta name="google-signin-client_id" content="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com">
	<script src = "http://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<div class = "g-signin2" data-onsuccess= "onSignIn" data-theme = "dark"></div>
	<script>
	  
    function onSignIn(googleUser) {
    	var profile = googleUser.getBasicProfile();
    	console.log("ID : " +profile.getId());
    	console.log("Full Name : " +profile.getName());
    	console.log("Given Name : " +profile.getGivenName());
    	console.log("Family Name : " +profile.getFamilyName());
    	console.log("Image URL : " +profile.getImageUrl());
    	console.log("Email : " +profile.getEmail());
    	
    	var access_token = googleUser.getAuthResponse().access_token
    	console.log("ID : " + id_token);
    }
    </script>
    <!-- 	$.ajax({
        	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
    		url: 'https://people.googleapis.com/v1/people/me'
             key에 자신의 API 키를 넣습니다.
    		, data: {personFields:'birthdays', key:'AIzaSyBxIw-IziKCc78-FI9HsEgLLaUPDX_uu6M', 'access_token': access_token}
    		, method:'POST'
    	})
    	.done(function(e){
            //프로필을 가져온다.
    		var profile = googleUser.getBasicProfile();
    		console.log(profile)
    	})
    	.fail(function(e){
    		console.log();
    	})
    }
    function onSignInFailure(t){		
    	console.log();
    }
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}
<script>
  <div id="my-signin2"></div>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  
  </script>

<div class = "g-signin2" data-onsucceess= "onSugnln"></div>
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script> -->
</body>
</html>