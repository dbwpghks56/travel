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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
.col.text-white{
	background-color: #FFE6E6;
}

body {
	background-color: #FFE6E6;
}

.title {
	width: 500px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
	font-family: 'Lobster', cursive;		
	text-shadow: 1px 1px 1px red;
	font-size: 4em;	
	color: pink;
}

.gain {
	width: 200px;
	height: 200px;
	border-radius: 18%;
	margin: auto;
	/* background-color: pink; */
	
}

.col {
	width: 200px; 
	height: 200px;
	border-radius: 10%;
	margin: auto;
	text-align: center;
	margin-top: 60px;
	padding: 0px;
	
}
/* 	background-color: white; */
.row {
	width:800px;
	margin: auto;
}

.btn {
	background-color : pink;
	color: 
	
}
.btn.btn-secondary.gain{
	width: 200px; 
	height: 200px;
	border-radius: 10%;
	margin: auto;
	text-align: center;
	margin-top: 1px;
	padding: 0px;
	border-color: pink;
	text-shadow: 1px 1px 1px;
	color: hotpink;
}


</style>
<script>

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

	<div class="container-fluid mt-3">
		<h1 class="title">MyPage</h1>
		<br>
		<br>
		<hr>
		<div class="row">
			<div class="col text-white">
				<input type="button" class="btn btn-secondary gain" value ="개인정보수정">
			</div>
			<div class="col text-white">

				<input type="button" onclick="location.href='/travel/reservation/rsvList.do';" class="btn btn-secondary gain" value="예약조회">

			</div>
			<div class="col text-white">
				<input type="button" onclick="location.href='/travel/accommodation/insertAcco.jsp';"  class="btn btn-secondary gain" value="숙소등록">
			</div>
		</div>
		<div class="row">
			<div class="col text-white">
				<input type="button" onclick = "location.href = 'travel/" class="btn btn-secondary gain" value="고객센터">
			</div>
			<div class="col text-white">
				<input type="button" class="btn btn-secondary gain" value="리뷰관리">
			</div>
			<div class="col text-white">
				<input type="button"  onclick="location.href='/travel/user/userDelete.do';" class= "btn btn-secondary gain" value="회원탈퇴">
			</div>
		</div>

	</div>
</body>
</html>