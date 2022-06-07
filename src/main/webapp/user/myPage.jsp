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
#title {
	width : 300px;
	margin: auto;
	margin-top : 30px;
	text-align: center;
	
}

.gain{
	width: 200px;
	height: 200px;
	border-radius : 10%;
	margin: auto;
}
.col{
	width: 300px;
	height: 300px;
	border-radius : 10%;
	margin: auto;
}
</style>
</head>
<body>

	<div class="container mt-3">
  <h2>Button Styles</h2>
  <button type="button" class="btn">Basic</button>
  <button type="button" class="btn btn-primary">Primary</button>
  <button type="button" class="btn btn-secondary">Secondary</button>
  <button type="button" class="btn btn-success">Success</button>
  <button type="button" class="btn btn-info">Info</button>
  <button type="button" class="btn btn-warning">Warning</button>
  <button type="button" class="btn btn-danger">Danger</button>
  <button type="button" class="btn btn-dark">Dark</button>
  <button type="button" class="btn btn-light">Light</button>
  <button type="button" class="btn btn-link">Link</button>      
</div>
	
	<div class="container-fluid mt-3">
  <h1>Three equal width columns</h1>
  <p>Note: Try to add a new div with class="col" inside the row class - this will create four equal-width columns.</p>
  <div class="row">
    <div class="col p-3 bg-primary text-white"><input type = "button" class="btn btn-secondary gain" value = "개인정보수정"></div>
    <div class="col p-3 bg-primary text-white"><input type = "button" class="btn btn-secondary gain" value = "예약조회"></div>
    <div class="col p-3 bg-primary text-white"><input type = "button" class="btn btn-secondary gain" value = "개인정보조회"></div>
  </div>
   <div class="row">
    <div class="col p-3 bg-primary text-white"><input type = "button" class="btn btn-secondary gain" value = "고객센터"></div>
    <div class="col p-3 bg-primary text-white"><input type = "button" class="btn btn-secondary gain" value = "리뷰관리"></div>
    <div class="col p-3 bg-primary text-white"><input type = "button" class="btn btn-secondary gain" value = "회원탈퇴"></div>
   </div>
  
</div>
</body>
</html>