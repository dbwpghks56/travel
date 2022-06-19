<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.form-floating, .submitbtn {
		text-align: center;
		width: 700px;
		margin: auto;
	}
	.submitbtn {
			display:block;
			margin-top: 5px;
			background-color: pink;
			border: 1px solid pink;
			margin-bottom: -5px;
			height: 56px;
			width: 700px;
			margin: auto;
		}
		
	.submitbtn:hover {
		border: none;
		background-color: #F582A7;
	}
	.submitbtn:focus {
		border: none;
		background-color: #F582A7;
	}
	h1 {
	text-align:center;
	font-family: 'Lobster', cursive;	
	clear: both;
	}
	#wholeconatiner {
		clear: both;
		
	}
	#title {
		clear: both;
		width: 500px;
		margin: auto;
		margin-top: 30px;
		text-align: center;
		font-family: 'Lobster', cursive;
		text-shadow: 1px 1px 1px red;
		font-size: 4em;
		color: pink;
	}
</style>
</head>
<body>
<div id="wholecontainer">
	<h1 id="title">Room Inquiry</h1>
	
	<form action="insertRoomInquiry.do" method="post">
		<input type="hidden" value="${user.user_id }" name="user_id">
		<div class="form-floating mb-3 mt-3">
			<input type="hidden" class="form-control" placeholder="숙소 id를 입력하세요" name="acco_id" value="${param.accoId }">
			<label for="acco_id">숙소 id : </label>
		</div>
		<div class="form-floating mb-3 mt-3">
		    <input type="text" class="form-control" placeholder="제목을 입력하세요" name="name" required="required" value="${param.acco_name }" readonly="readonly">
	      	<label for="name">숙소이름 : </label>
      	</div>
	    <div class="form-floating mb-3 mt-3">
		    <input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" required="required">
	      	<label for="title">제목 : </label>
      	</div>
	    <div class="form-floating mb-3 mt-3">
		    <input type="text" class="form-control" placeholder="내용을 입력하세요" name="content" required="required">
	      	<label for="content">내용 : </label>
      	</div>
	    <input type="submit" class="btn btn-success submitbtn" value="문의하기">
	</form>
	</div>
</body>
</html>



