<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
/* .col.text-white{
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

/* .gain {
	width: 200px;
	height: 200px;
	border-radius: 18%;
	margin: auto;
	/* background-color: pink; */
	
} */

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
.third{
	width: 800px;
	margin:auto;
}
.btn {
	width: 200px; 
	height: 160px;
	border-radius: 10%;
	margin: 10px;
	text-align: center;
	margin-top: 1px;
	padding: 0px;
	/* border-color: pink; */
	text-shadow: 1px 0px #F473B9, 0px 1px #F473B9, 1px 0px #F473B9, 0px -1px #F473B9;;
	color: white;
	background-color: white;
	font-size: 1.33em;
	box-shadow: 4px 4px 4px #FFC4DD;
	

	
}
/* .btn.btn-secondary.gain{
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
#sun {
	display: inline-block;
	width: 100%;
	position: relative;
	z-index: -99;
}

} */
.btn:hover{background-color: #FDCFDF; color: white; } 

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
	position : relative;
	width: 900px;
	height: 225px;
	margin-left : 320px;
	background-color: #FFE6E6;
}

.btn {
	background-color: gray;
	text-align: left;
	
}

.btn.btn-secondary.gain {
	
	font-size : 17px;
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

.btn.btn-secondary.gain:hover{
	background-color: pink;
}
.name {
	margin-left: 330px;
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
	margin-left: 305px;
	margin-top: 57px;
}

.check {
	margin-left: 305px;
	margin-top: 57px;
}

.people {
	position: absolute; 
	margin-left: 335px;
	margin-top: 57px;
}

.delete {
	margin-left: 600px;
	margin-top: 57px;
	z-index: 2;
}
.support{
	margin-left: 335px;
	margin-top: 57px;	
}
.forum{
	margin-left: 380px;
	margin-top: 60px;	
}
.row1{
	margin-right: 755px;

} 
.add{
	margin-left: 20px;
	margin-top: 15px;	
}
.room{
	margin-left: 15px;
	margin-top: 15px;	
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
		<hr>
		<p class="name">
			<img alt=""
				src="${pageContext.request.contextPath}/uploads/${user.u_image_path}"
				id="photo"> ${user.user_id}(${user.nickname})님 환영합니다.</p>
				
				<span class="material-icons-outlined people">person</span>
		<div class="row">
		
			<div class="col text-white">
				<input type="button" onclick="location.href='/travel/user/updateUser.jsp';" class="btn btn-secondary gain " value ="	
  
 
  개인정보조회
  
  *개인 정보 조회와 수정하세요" >
			</div>
			<span class="material-icons-outlined check">fact_check</span>
			<div class="col text-white">
			
				<input type="button" onclick="location.href='/travel/reservation/hostlist.do';" class="btn btn-secondary gain " value="
				
  
  예약조회
  
  *예약 받은 숙소를 조회하세요">
			</div>
			
			
			<div class="col text-white">
			<span class="material-icons-outlined add">add_home_work</span>
				<input type="button" onclick="location.href='/travel/accommodation/insertAcco.jsp';"  class="btn btn-secondary gain " value="
		
  
  숙소등록
  
  *숙소를 등록하세요">
			</div>
		</div>
		<span class="material-icons-outlined support">support_agent</span>
		<div class="row">
		
			<div class="col text-white">
			
				<a href="siteInquiry.do"><input type="button"
					class="btn btn-secondary gain " value="

  고객센터
  
  *사이트 관련 기타 문의"></a>
			</div>
			<span class="material-icons-outlined review">try</span>
			<div class="col text-white">
				<input type="button" class="btn btn-secondary gain " value="
				
  
  리뷰관리
  
  *등록 된 리뷰를 관리하세요">
			</div>
			<span class="material-icons-outlined delete">delete_outline</span>
			<div class="col text-white">
				<input type="button"  onclick="location.href='/travel/user/userDelete.jsp';" class="btn btn-secondary gain " value="
				
  
  회원탈퇴
  
  *회원을 탈퇴 할 수 있어요">
			</div>
		</div>
		<div class="row1">
		
			<div class="col text-white">
			<span class="material-icons-outlined room">room_preferences</span>
				<input type="button" onclick="location.href='/travel/user/selectAccoHost.do';"  class="btn btn-secondary gain btn1" value="
				
  
  숙소관리
  
  *등록 된 숙소를 관리하세요">
			</div>
		</div>
</div>


</body>
</html>