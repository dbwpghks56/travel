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
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
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

#kakaologin:hover {
	cursor: pointer;
}
</style>
<script>
	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('2d503e5862c5829d5794c838da38c231');
	
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
	
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  $("#email").val(response.kakao_account.email);
	        	  $("#nick").val(response.properties.nickname);
	        	  $("#profile2").val(response.properties.profile_image);
	        	  $("#profile").attr("src", response.properties.profile_image);
	        	  console.log(response.properties.nickname);
	        	  console.log(response.properties.profile_image);
	        	  console.log(response.kakao_account.email);
	        	  $("#myform").submit();
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
</script>
</head>
<body>
	<h1 class="title">Login</h1>
	<br>
	<br>
	<br>
	<form action="login.do" method="post" enctype="multipart/form-data" id="myform">

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
		style="width: 300px; margin: auto; background-color: #FFE6E6; color: black; border: #F2D1D1; margin-bottom: 20px;"> 로그인</button> <br>
		<img alt="" src="../images/loginbutton/kakao_login_medium_wide.png" onclick="kakaoLogin();" id="kakaologin">
		</div>

		<!-- <input type="reset" value="취소"> -->
		<input id="email" type="hidden" name="email"> <br>
		<input id="nick" type="hidden" name="nick"> <br>
		<input id="profile" type="hidden" name="profile">
		<ul>
			<li onclick="kakaoLogout();">
		      <a href="javascript:void(0)">
		          <span>카카오 로그아웃</span>
		      </a>
			</li>
		</ul>
	</form>

</body>
</html>