<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
<<<<<<<
HEAD
.form-group {
	width: 200px; ======= . title { text-align : center;
	margin-top: 2%;
	font-family: verdana;
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
	>>>>>>>
	refs
	/remotes/origin/Min
}

.input-group {
	width: 500px;
	margin: auto;
}

.input-group-text {
	width: 90px;
	background-color: pink;
	color: white;
}

.text {
	display: inline-block;
	width: 115px;
	margin-top: 12.5%;
	color: white;
}

.textdiv {
	background-color: pink;
	display: inline-block;
	padding: auto;
}

.btn-primary {
	width: 500px;
	margin: auto;
	background-color: pink;
	color: white;
	border: pink;
}

#idDuplicateCheckBtn {
	width: 115px;
	color: white;
	background-color: pink;
	border: pink;
}

#nickDuplicateCheckBtn {
	width: 115px;
	color: white;
	background-color: pink;
	border: pink;
}
</style>
<<<<<<< HEAD
<script type="text/javascript">
	$(() => {
		$(".deptDetailView").click(function() {
			let bno_data = $(this).attr("data-bno");
			$.ajax({
				type: "post",
				async: false,
				url : "board2.do",
				data: {boardid : bno_data},
				success: (data) => {
					let obj = JSON.parse(data);
					$("#board_id").val(obj["board_id"]);
					$("#board_title").val(obj["board_title"]);
					$("#board_content").val(obj["board_content"]);
					$("#board_writer").val(obj["board_writer"]);
				},
			});
		});
	});
	
=======

<script>
	$(function() {
		$("#idDuplicateCheckBtn")
				.click(
						function() {
							var user_id = $("#user_id").val();
							if (user_id == "" || user_id == null) {
								alert("아이디를 입력 해 주세요!")
								$("#user_id").focus();
							} else {
								$
										.ajax({
											url : "UserCheck.do",
											data : {
												"user_id" : $("#user_id").val()
											},
											type : "post",
											success : function(responseData) {
												//중복:1, 중복안됨:0
												alert(responseData == 1 ? "이미 사용 중이거나 , 사용이 불가능 합니다."
														: "사용 가능 합니다");
											},
											fail : function() {
											}
										});
							}
						});
	});

	$(function() {
		$("#nickDuplicateCheckBtn")
				.click(
						function() {
							var nickname = $("#nickname").val();
							if (nickname == "" || nickname == null) {
								alert("닉네임을 입력 해 주세요!")
								$("#nickname").focus();
							} else {
								$
										.ajax({
											url : "NickCheck.do",
											data : {
												"nickname" : $("#nickname")
														.val()
											},
											type : "post",
											success : function(responseData) {
												//중복:1, 중복안됨:0
												alert(responseData == 1 ? "이미 사용 중이거나 , 사용이 불가능 합니다."
														: "사용 가능 합니다");
											},
											fail : function() {
											}
										});
							}
						});
	});
>>>>>>> refs/remotes/origin/Min
</script>
</head>
<body>
	<h1>회원가입</h1>

	<<<<<<< HEAD
	<form action="signup.do" method="post" enctype="multipart/form-data">
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
	=======
	<div class="container mt-3">

		<form action="signup.do" method="post" enctype="multipart/form-data">

			<div class="input-group mb-3">
				<span class="input-group-text">아이디</span> <input type="text"
					class="form-control" placeholder="Id" name="id" id="user_id">
				<input type="button" id="idDuplicateCheckBtn" value="중복확인">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호</span> <input type="password"
					class="form-control" placeholder="PassWord" name="password">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">이름</span> <input type="text"
					class="form-control" placeholder="Name" name="name">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">이메일</span> <input type="text"
					class="form-control" placeholder="Your Email" name="email">
				<div class="textdiv">
					<span class="text">@example.com</span>
				</div>
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">닉네임</span> <input type="text"
					class="form-control" placeholder="NickName" name="nickname"
					id="nickname"> <input type="button"
					id="nickDuplicateCheckBtn" value="중복확인">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">전화번호</span> <input type="text"
					class="form-control" placeholder="Phone" name="phone">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">생년월일</span> <input type="date"
					class="form-control" placeholder="Birth" name="birth">

			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">Favorite</span> <input type="text"
					class="form-control" placeholder="Favorite" name="favorite">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">프로필</span> <input type="file"
					class="form-control" placeholder="Photo" name="photos">
			</div>

			<label>Host</label> <input type="radio" class="check" name="host"
				value="1">예 <input type="radio" class="check" name="host"
				value="0">아니오<br> <br> <br>

			<button type="submit" class="btn btn-primary">확인</button>
		</form>

	</div>

	>>>>>>> refs/remotes/origin/Min

</body>
</html>