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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	


<title>Insert title here</title>
<style type="text/css">
.col.text-white {
	background-color: white;
	width: 100px;
	
}

body {
	background-color: white;
	
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
	height: 100px;
	border-radius: 18%;
	margin: auto;
	/* background-color: pink; */
}

.col {
	width: 200px;
	height: 1px;
	border-radius: 10%;
	margin: auto;
	text-align: center;
	margin-top: 60px;
	padding: 0px;
}
/* 	background-color: white; */
.row {
	width : 800px;
	height: 200px;
	margin: auto;
	
	
}
 
.btn {
	background-color: pink;
}

.btn.btn-secondary.gain {
	font-size : 20px;
	width: 250px;
	height: 180px;
	border-radius: 10%;
	margin: auto;
	border-color: #f19595;
	text-shadow: 1px 1px 1px;
	color: hotpink;
	background-color: #FFE6E6;
	box-shadow: 1px 1px 1px;
	cursor:pointer; 
	

}
.btn-secondary{
	background: white;
}

.name {
	margin-left: 320px;
	color: gray;
	font-size: 20px;
}
#photo{
	width:40px;
	height: 40px;
	border-radius: 80%;
	border: 2px solid pink;
}
.material-icons-outlined{
	margin-left: 390px;
    position: fixed;
    margin-top: 95px;
	font-size: 45px;
	color : gray;
}
.review{
	margin-right: 2px;
}
</style>
</head>
<body>


	<div class="container-fluid mt-3">

		<h1 class="title">MyPage</h1>
		<br> 
		<hr>
		<p class="name"> <img alt="" src="${pageContext.request.contextPath}/uploads/${user.u_image_path}" id = "photo"> ${user.user_id}(${user.nickname})님 환영합니다.</p>
	<span class="material-icons-outlined">person</span>

		<div class="row">
		
			<div class="col text-white" >
				 
			<input type="button" class="btn btn-secondary gain " value="1:1 문의" onclick="location.href='/travel/accommodation/listRoomInquiry.do';" >                 
			</div>
			
			<div class="col text-white">
				<input type="button" class="btn btn-secondary gain" value ="예약조회" onclick="location.href='/travel/reservation/rsvlist.do';">
			</div>
			
			<div class="col text-white">
				<input type="button" class="btn btn-secondary gain" value="개인정보조회" onclick="location.href='/travel/user/userUpdate.do';">
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col text-white">
				<a href="siteInquiry.do"><input type="button" class="btn btn-secondary gain" value="고객센터"></a>
			</div>
			<span  class="material-icons-outlined review">try</span>
			<div class="col text-white">
			
				<input type="button" class="btn btn-secondary gain" value="리뷰관리">
			</div>
			
			
			<div class="col text-white">
				<input type="button" class="btn btn-secondary gain" value="회원탈퇴" onclick="location.href='/travel/user/userDelete.jsp';">
			</div>
			
		</div>
		
	</div>

</body>
</html>