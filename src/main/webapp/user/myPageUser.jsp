<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/mainnav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined"
	rel="stylesheet">
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
	height: 100px;
	border-radius: 18%;
	margin: auto;
	/* background-color: pink; */
}

.col {
	width: 200px;
	height: 0px;
	border-radius: 10%;
	margin: auto;
	margin-top: 40px;
	padding: 0px;
}
/* 	background-color: white; */
.row {
	position: relative;
	width: 900px;
	height: 225px;
	background-color: #FFE6E6;
}

.btn {
	background-color: gray;
	text-align: left;
}

.btn.btn-secondary.gain {
	font-size: 17px;
	width: 250px;
	height: 180px;
	border-radius: 10%;
	margin: auto;
	border-color: #f19595;
	text-shadow: 1px 1px 1px;
	color: gray;
	background-color: white;
	box-shadow: 1px 1px 1px;
	cursor: pointer;
}

.btn.btn-secondary.gain:hover {
	background-color: pink;
}

.name {
	margin-left: 340px;
	color: gray;
	font-size: 20px;
}

#photo {
	width: 40px;
	height: 40px;
	border-radius: 80%;
	border: 2px solid pink;
}

.material-icons-outlined {
	position: absolute;
	/* margin-top: 60px; */
	font-size: 45px;
	color: gray;
	z-index: 1;
}

.review {
	margin-left: 315px;
	margin-top: 57px;
}

.check {
	margin-left: 315px;
	margin-top: 57px;
}

.people {
	margin-left: 610px;
	margin-top: 57px;
}

.delete {
	margin-left: 610px;
	margin-top: 57px;
}

.support {

	margin-top: 57px;
}

.forum {

	margin-top: 60px;
}

#chess {
	width: 900px;
	margin: auto;
}

/* #sun {
	display: inline-block;
	width: 100%;
	position: relative;
	z-index: -99;
} */
</style>
<script type="text/javascript">
	
</script>
</head>
<body>

	<div class="container-fluid mt-3">

		<h1 class="title">MyPage</h1>
		<br>
		<hr>
		<br>
		<p class="name">
			<img alt=""
				src="${pageContext.request.contextPath}/uploads/${user.u_image_path}"
				id="photo"> ${user.user_id}(${user.nickname})님 환영합니다.
		</p>
		<div id="chess">
			<div class="row">
				<span class="material-icons-outlined forum">forum</span>



				<div class="col text-white">
					<input type="button" class="btn btn-secondary gain "
						value="

 
1:1문의	

*궁금한 점을 물어보세요"
						onclick="location.href='/travel/accommodation/listRoomInquiry.do';">
				</div>
				<span class="material-icons-outlined check">fact_check</span>

				<div class="col text-white">
					<input type="button" class="btn btn-secondary gain"
						value="
				

예약조회

*예약 한 숙소를 조회하세요"
						onclick="location.href='/travel/reservation/rsvlist.do';">
				</div>

				<span class="material-icons-outlined people">person</span>

				<div class="col text-white">
					<input type="button" class="btn btn-secondary gain"
						value="
				
				
개인정보조회
				
*개인 정보 조회와 수정하세요"
						onclick="location.href='/travel/user/userUpdate.do';">
				</div>

			</div>
			<div class="row">
				<span class="material-icons-outlined support">support_agent</span>



				<div class="col text-white">
					<a href="siteInquiry.do"><input type="button"
						class="btn btn-secondary gain" value="
					

고객센터

*사이트 관련 기타 문의"></a>
				</div>

				<span class="material-icons-outlined review">try</span>

				<div class="col text-white">
					<input type="button" class="btn btn-secondary gain"
						value="
				

리뷰관리

*숙소 리뷰를 달아주세요"
						onclick="location.href='/travel/review/listReview.do';">

				</div>

				<span class="material-icons-outlined delete">delete_outline</span>

				<div class="col text-white">
					<input type="button" class="btn btn-secondary gain"
						value="
				

회원탈퇴

*회원을 탈퇴 할 수 있어요"
						onclick="location.href='/travel/user/userDelete.jsp';">
				</div>

			</div>
			<!-- <div class = "third">
			<div class="col text-white">
				<input type="button" onclick="location.href='/travel/user/selectAccoHost.do';"  class="btn btn-secondary gain" value="숙소관리">
			</div> -->
		</div>
	</div>


</body>
</html>