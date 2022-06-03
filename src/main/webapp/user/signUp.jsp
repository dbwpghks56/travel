<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
.form-group{
	width : 200px;
}
</style>
</head>
<body>
	<h1>회원가입</h1>
	
	<form action="signUp.do" method="post" ${contextPath}  enctype="multipart/form-data">
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
		
      프로필사진 : <input type="file" name="photos" ><br>
   <div>
  		<label>Host</label>
		<input type ="radio" name = "host" value = "1"> 예
		<input type ="radio" name = "host" value = "0"> 아니오
		<br>
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