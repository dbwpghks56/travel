<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<form action="confirmkakao.jsp" id="myform">
		<input id="email" type="text" readonly="readonly" name="email"> <br>
		<input id="nick" type="text" readonly="readonly" name="nick"> <br>
		<img id="profile" alt="" src="" width="200" height="200">
		<input id="profile2" type="text" readonly="readonly" name="profile2">
		<ul>
			<li onclick="kakaoLogin();">
		      <a href="javascript:void(0)">
		          <span>카카오 로그인</span>
		      </a>
			</li>
			<li onclick="kakaoLogout();">
		      <a href="javascript:void(0)">
		          <span>카카오 로그아웃</span>
		      </a>
			</li>
		</ul>
	</form>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('2d503e5862c5829d5794c838da38c231'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인

</script>
</body>
</html>