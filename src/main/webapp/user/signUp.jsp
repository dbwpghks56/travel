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
	<h1 class="title">Would You Travel</h1>
	<br>
	<br>
	<div class="container mt-3">

		<form action="signup.do" method="post" enctype="multipart/form-data">

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text"
					style="width: 90px; background-color: pink; color: white">아이디</span>
				<input type="text" class="form-control" placeholder="Id" name="id" value="${email }">
				<input type="button" id="idDuplicateCheckBtn" value="중복확인" > 
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">비밀번호</span> <input
					type="password" class="form-control" placeholder="PassWord"
					name="password">
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">이름</span> <input
					type="text" class="form-control" placeholder="Name" name="name">
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">이메일</span> <input
					type="text" class="form-control" placeholder="Your Email"
					name="email"> <span class="input-group-text">@example.com</span>
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">닉네임</span> <input
					type="text" class="form-control" placeholder="NickName"
					name="nickname" value="${nick }">
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">전화번호</span> <input
					type="text" class="form-control" placeholder="Phone" name="phone">
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">생년월일</span> <input
					type="date" class="form-control" placeholder="Birth" name="birth">

			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">Favorite</span>
				<input type="text" class="form-control" placeholder="Favorite"
					name="favorite">
			</div>

			<div class="input-group mb-3" style="width: 500px; margin: auto;">
				<span class="input-group-text" style="width: 90px;">프로필</span> 
				<input type="file" class="form-control" placeholder="Photo" name="photos" accept="image/*" onchange="setThumbnail(event);"> <br>
				<img alt="" src="" id="thumbnail">
			</div>

			<label>Host</label> <input type="radio" class="check" name="host"
				value="1">예 <input type="radio" class="check" name="host"
				value="0">아니오<br> <br>
			<br>

			<button type="submit" class="btn btn-primary"
				style="width: 500px; margin: auto;">확인</button>
		</form>

	</div>


</body>
</html>