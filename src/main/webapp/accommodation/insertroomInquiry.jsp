<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	* {
		margin-left: 10px;
	}
	.form-floating {
		width: 400px;
	}
</style>
</head>
<body>
	<h1>방 문의 페이지</h1>
	<h2>꼭 로그인 후에 시도해주세용</h2>
	
	<form action="insertRoomInquiry.do" method="post">
		<h3>${user.user_id }</h3>
		<input type="hidden" value="${user.user_id }" name="user_id">
		<div class="form-floating mb-3 mt-3">
			<input type="number" class="form-control" placeholder="숙소 id를 입력하세요" name="acco_id">
			<label for="acco_id">숙소 id : </label>
		</div>
	    <div class="form-floating mb-3 mt-3">
		    <input type="text" class="form-control" placeholder="제목을 입력하세요" name="title">
	      	<label for="title">제목 : </label>
      	</div>
      	<div class="form-floating mb-3 mt-3">
		    <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="ri_pass">
	      	<label for="ri_pass">비밀번호(필수가 아닙니다.) : </label>
      	</div>
	    <div class="form-floating mb-3 mt-3">
		    <input type="text" class="form-control" placeholder="내용을 입력하세요" name="content">
	      	<label for="content">내용 : </label>
      	</div>
	    <input type="submit" class="btn btn-success" value="보내깅">
	</form>
</body>
</html>



