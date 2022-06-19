<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/jsp/mainnav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
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
.title {
	text-align: center;
	margin-top: 2%;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 3.5em;
	color: pink;
	margin-right: 340px;
	
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
#thumbnail {
	width: 200px;
	height: 200px;
	border-radius: 80%;
	border: 5px solid pink;
}
</style>

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
	
	function setThumbnail(event) {
        var reader = new FileReader();
        reader.onload = function(event) {
        	$("#thumbnail").attr("src", event.target.result);
        	$("#thumbnail").css("display", "inline-block");
        };
        reader.readAsDataURL(event.target.files[0]);
	}

	$(function(){

		$(".update").click(function() {
			var user =$(this).attr("data-update");       
			if(confirm(user +"수정하시겠습니까?")){
				location.href="userUpdate.do?user_id="+user_id ;
			}
		});
	});

	
</script>

</head>
<body>
	<h1 class="title">Would You Travel</h1>
	<br>
	<br>

	<div class="container mt-3">

		<form action="userUpdate.do" method="post" >  <!-- enctype="multipart/form-data" -->


			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호</span> <input type="password"
					class="form-control" placeholder="PassWord" name="password" required="required" value="${user.user_pass}">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">이메일</span> <input type="text"
					class="form-control" placeholder="Your Email" name="email" required="required" value="${user.user_email}">
				<div class="textdiv">
					<span class="text">@example.com</span>
				</div>
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">닉네임</span> <input type="text"
					class="form-control" placeholder="NickName" name="nickname"
					id="nickname"  required="required" value="${user.nickname}"> <input type="button"
					id="nickDuplicateCheckBtn" value="중복확인">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">전화번호</span> <input type="text"
					class="form-control" placeholder="Phone" name="phone" required="required" value="${user.user_phone}">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">생년월일</span> <input type="date"
					class="form-control" placeholder="Birth" name="birth" required="required" value="${user.birth}">

			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">Favorite</span> <input type="text"
					class="form-control" placeholder="Favorite" name="favorite" required="required" value="${user.favorite}">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">프로필</span> 
				<input type="file"
					class="form-control" placeholder="Photo" name="photos" accept="image/*" onchange="setThumbnail(event);"> 
					<img alt="" src="${pageContext.request.contextPath}/uploads/${user.u_image_path}" id="thumbnail">
			</div>

			<label>Host</label> 
			<input type="radio" class="check" name="host"value="1" ${user.host==1?"checked":"" }>예 
			<input type="radio" class="check" name="host"  value="0"  ${user.host==0?"checked":""}>아니오
			<br> <br> <br>
			
			<button type="submit" class="update btn btn-primary" data-update="${user.user_id}">수정하기</button>
		</form>

	</div>


</body>
</html>