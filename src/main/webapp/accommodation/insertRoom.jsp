<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#formcontainer {
	width: 40%;
	display: block;
	margin: auto;
	
}

.btn {
	margin-top: 5px;
	background-color: pink;
	border: 1px solid pink;
	margin-bottom: -5px;
	height: 56px;
	width: 100%;
}

.btn:hover {
	border: none;
	background-color: #F582A7;
}

#thumbnail {
	width: 200px;
	height: 200px;
	display: none;
	border-radius: 5px;
	border: 3px solid pink;
}

.input-group-text {
	background-color: pink;
	color: white;
	width : 115px;
	text: center;
}
.title{
	margin-left: 520px;
	width: 450px;
	margin: auto;
	text-align: center;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 3em;
	color: pink;
	
}

.line{
	margin: auto;
	width: 700px;
}
.text{
	margin-left: 460px;
	text-shadow: 1px 1px 1px;
	color : gray;
}
#wholecontainer {
	clear: both;
	margin: auto;
}
#containers {
	margin: auto;
}
</style>
</head>
<body>
<div id="wholecontainer">
	<h1 class="title">Insert Room</h1>
	<br>
	<hr class = "line">
	<br>
	<div id="containers">
	<div id="formcontainer">

		<form action="insertRoom.do" method="post"
			enctype="multipart/form-data">

			<div class="input-group mb-3">
				<span class="input-group-text">숙소번호 </span> <input type="number"
					class="form-control" name="acco_id" id="acco_id" value="${param.acco_id }"
					required="required" readonly="readonly">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최소숙박인원</span> <input type="number"
					class="form-control" name="min_per" min="1">
				<!-- required="required" -->
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최대숙박인원</span> <input type="number"
					class="form-control" name="max_per" min="1" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최소 숙박일</span> <input type="number"
					class="form-control" name="min_day" min="1" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최대 숙박일</span> <input type="number"
					class="form-control" name="max_day" min="1" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">1박 가격</span> <input type="text"
					class="form-control" name="price" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">방 이름</span> <input type="text"
					class="form-control" name="room_name" required="required">

			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">방 사진</span> <input type="file"
					class="form-control" placeholder="Photo" name="photos"
					accept="image/*" onchange="setThumbnail(event);" multiple="multiple"> 
					<img alt="" src="" id="thumbnail" >
					
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">방옵션</span> <input type="text"
					class="form-control" placeholder="Favorite" name="room_option"
					required="required">
			</div>


			<button type="submit" class="btn btn-primary">등록하기</button>

		</form>
	</div>
	</div>
</div>
<script type="text/javascript">
function setThumbnail(event) {
	var reader = new FileReader();
	reader.onload = function(event) {
		$("#thumbnail").attr("src", event.target.result);
		$("#thumbnail").css("display", "inline-block");
	};
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</body>
</html>