<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>방 등록</h1>
	<h2>숙소번호는 외래키이기 때문에 실제 데이터베이스에 있는 값을 넣어주세용</h2>
		숙소 	번호 : <input type="number" name="acco_id"> <br>
		최소 숙박 인원 : <input type="number" name="min_per" min="1"> <br>
		최대 숙박 인원 : <input type="number" name="max_per" min="1"> <br>
		최소 숙박일 : <input type="number" name="min_day" min="1"> <br>
		최대 숙박일 : <input type="number" name="max_day" min="1"> <br>
		1박 가격 : <input type="number" name="price"> <br>
		방 이름 : <input type="text" name="room_name"> <br>
		방 사진 : <input type="file" name="photos"> <br>
		방옵션 : <input type="text" name="room_option"> <br>
		<input type="submit" value="전송스">
		
		<h1 class="title">Would You Travel</h1>
	<br>
	<br>

<h2>숙소번호는 외래키이기 때문에 실제 데이터베이스에 있는 값을 넣어주세용</h2>
	<div class="container mt-3">

		<form action="insertRoom.do" method="post" enctype="multipart/form-data">

			<div class="input-group mb-3">
				<span class="input-group-text">숙소번호 </span> <input type="number"
					class="form-control" placeholder="Id" name="acco_id" id="acco_id" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최소숙박인원</span> <input type="number"
					class="form-control" name="min_per" min="1" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최대숙박인원</span> <input type="number"
					class="form-control" name="max_per"  min="1" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최소 숙박일</span> <input type="number"
					class="form-control" placeholder="Your Email" name="min_day" min="1" required="required">
				<div class="textdiv">
					<span class="text">@example.com</span>
				</div>
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">최대 숙박일</span> <input type="number"
					class="form-control" placeholder="NickName" name="nickname"
					id="nickname" value="${nick }" required="required"> <input type="button"
					id="nickDuplicateCheckBtn" value="중복확인">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">전화번호</span> <input type="text"
					class="form-control" placeholder="Phone" name="phone" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">생년월일</span> <input type="date"
					class="form-control" placeholder="Birth" name="birth" required="required">

			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">Favorite</span> <input type="text"
					class="form-control" placeholder="Favorite" name="favorite" required="required">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">프로필</span> <input type="file"
					class="form-control" placeholder="Photo" name="photos" accept="image/*" onchange="setThumbnail(event);">
					<img alt="" src="" id="thumbnail">
			</div>

			<label>Host</label> <input type="radio" class="check" name="host"
				value="1">예 <input type="radio" class="check" name="host"
				value="0">아니오<br> <br> <br>

			<button type="submit" class="btn btn-primary">확인</button>
		</form>

	</div>

		
		
	</form>
</body>
</html>