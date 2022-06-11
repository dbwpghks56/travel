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
<style>

.form-group {
	width: 200px;
	}
	
.title { 
	text-align : center;
}

.btn {
	width: 150px;
	margin: auto;
	width: 280px;
}

.title {
	text-align: center;

	margin-top: 2%;
}

.check {
	width: 50px;
}

body {
	line-height: 0.5em;
	text-align: center;
}

.container {
	margin-bottom: 95px;

}

#thumbnail {
	width: 200px;
	height: 200px;
	display: none;
	border-radius: 80%;
	border: 5px solid skyblue;
}
</style>

<script>
	$(function() {
		$("#idDuplicateCheckBtn").click(function() {
			//alert("버튼누름");
			var user_id = $("#user_id").val();
			if (user_id == "" || user_id == null) {
				alert("아이디를 입력 해 주세요!")
				$("#user_id").focus();
			}
			$.ajax({
				url : "UserCheck.do",
				data : {
					"user_id" : $("#user_id").val()
				},
				type : "post",
				success : function(responseData) {
					//중복:1, 중복안됨:0
					$("#message").html(responseData == 1 ? "사용이 블가능 합니다." : "사용 가능 합니다");
				},
				fail : function() {
				}
			});
		});
	});
	
	function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
        	$("#thumbnail").attr("src", event.target.result);
        	$("#thumbnail").css("display", "inline-block");
        };

        reader.readAsDataURL(event.target.files[0]);
      }
</script>

</head>
<body>

	<h1>회원가입</h1>

	<form action="signup.do" method="post" enctype="multipart/form-data">
		<div>
		
		<div class="form-group">
			<label>아이디</label> <input class="form-control" type="text" name="id">
			<br>
		</div>

		<div class="form-group">
			<label>비밀번호</label> <input class="form-control" type="password"
				name="password"> <br>
		</div>

		<div class="form-group">
			<label>이름</label> <input class="form-control" type="text" name="name">
			<br>
		</div>

		프로필사진 : <input type="file" name="photos"><br>
		<div>
			<label>Host</label> <input type="radio" name="host" value="1">
			예 <input type="radio" name="host" value="0"> 아니오 <br>
		</div>

		<div class="form-group">
			<label>이메일</label> <input class="form-control" type="text"
				name="email"> <br>
		</div>

		<div class="form-group">
			<label>닉네임</label> <input type="button" id="nicknameCheckBtn"
				value="중복체크"> <input class="form-control" type="text"
				name="nickname">
		</div>

		<div class="form-group">
			<label>전화번호</label> <input class="form-control" type="text"
				name="phone"> <br>
		</div>

		<div class="form-group">
			<label>생년월일</label> <input class="form-control" type="date"
				name="birth"> <br>
		</div>

		<div class="form-group">
			<label>favorite</label> <input class="form-control" type="text"
				name="favorite"> <br>
		</div>

		<input type="submit" value="확인"> <input type="reset"
			value="취소">
		</div>

	</form>

</body>
</html>