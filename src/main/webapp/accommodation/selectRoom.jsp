<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file = "selectAcco.jsp" %>
    <%@ include file= "updateReviewReport.jsp" %>
    <%@ page import = "travel.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	* {
	margin: 1%;
	box-sizing: border-box;
}
	body {
		margin-left:10%;
		margin-right:10%;
		position: relative;
	}
	h2{
		position: left;
	}
	h3{
		position: left;
	}
	.aImgs{
		width:100%;
		height: 30%;
	}
	#map{
		width: 100%;
		height: 500px;
	}
	.detail img{
		width: 5%;
		height: 5%;
	}
	#roomDetail{
	width: 40%;
	height: 40%;
}
#demo{
	display:inline-block;
	width: 45%;
	height: 45%;
}
.reviewDiv{
	width:100;
	height: 45%;
}
.reviews{
	display:inline-block;
	width:45%;
	height: 50%;
	position: relative;
	overflow: hidden;
}
#userImg{
	display:inline-block;
	position: left;
	width:10%;
}
#userInfo{
	display:inline-block;
	position: right;
}
#report{
	width: 50px;
	height: 40px;
}

</style>
</head>
<body>
	<h2>${accoName}</h2>
	<div class = "aImgs">
	<c:if test="${not empty a_image_path[0]}">
		<img id = "firstImg" src="../accoImages/${a_image_path[0]}">
		<c:if test="${not empty a_image_path[1]}">
			<img src="../accoImages/${a_image_path[1]}">
			<c:if test="${not empty a_image_path[2]}">
				<img src="../accoImages/${a_image_path[2]}">
				<c:if test="${not empty a_image_path[3]}">
					<img src="../accoImages/${a_image_path[3]}">
				</c:if>
			</c:if>
		</c:if>
	</c:if>
	</div>
	<h3>${nickName}(${user_id })님이 호스팅하는 ${accoType}</h3>
	<hr>
		<div class = "detail">
		<img src = "../images/icons/phoneIcon.png">${phone}<br>
		<img src = "../images/icons/blackMaker.png">${address }<br>
		<img src = "../images/icons/homeIcon.png">${option }<br>
		<img src = "../images/icons/wonIcon.png">${price}<img src = "../images/icons/timeIcon.png">예약하기
		</div>
	<hr>
	<div id = "roomDetail">
		<c:forEach items = "${roomList }" var = "room">
			<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>

		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../accoImages/${room.r_image_path[0]}" alt="숙소사진1" class="d-block w-100">
			</div>
			<c:if test="${not empty room.r_image_path[1] }">
			<div class="carousel-item">
				<img src="../accoImages/${room.r_image_path[1]}" alt="숙소사진2" class="d-block w-100">
			</div>
			</c:if>
		</div>
		
		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
		
		<span>${room.room_name }</span><br>
	</div>
	</c:forEach>
	</div>
	<hr>
		<div class = "reviewDiv">
		<h3>후기 (${rList.size()}개)</h3>
		<div class = "reviews">
		<c:forEach items = "${rList}" var = "review">
		<c:forEach items="${userArr }" var = "user">
			<c:if test="${review.user_id eq user[0]}">
				<div id = "userImg">
				<img src = "../uploads/${user[1]}">
				</div>
				<div id = "userInfo">
				${user[2] }<br>
				${review.r_regdate } <input type = "button" id = "report" value ="${review.review_id }">
				</div>
				<div id = "content">
				${review.content }
				</div>
			</c:if>
		</c:forEach>
		</c:forEach>
		</div>
		</div>
	<hr>
	<h3>위치</h3>
	<div id = "map">지도</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fbbb242c8d8813685c061dffd5629cc"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js"
		type="text/javascript"></script>
	<script>
	var report = document.querySelector("#report");
	
	report.onclick = function(){
		modal.style.display = 'block';
	};
	var rId = document.querySelector("#report").value;
	updateReport.onclick = function(){
		modal.style.display = 'none';
		location = "updateReport.do?rId="+rId;
		
	};
	var divMap = document.querySelector("#map");

	var centerx = ${x};
	var centery = ${y};

	//GRS80(중부원점) 좌표계
	var grs80 = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43";
	//wgs84(위경도)좌표계
	var wgs84 = "+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees";

	var grs80P = proj4(grs80, wgs84, [ centerx, centery ]);
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(grs80P[1], grs80P[0]), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(divMap, options);
	

	var icon = new kakao.maps.MarkerImage(
			'../images/icons/makerIcon.png',
			new kakao.maps.Size(70, 35),
			{
				offset : new kakao.maps.Point(16, 34),
				alt : "마커 이미지",
				shape : "poly",
				coords : "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
			});

	var marker = new kakao.maps.Marker({
		map : map,
		position : new kakao.maps.LatLng(grs80P[1], grs80P[0]),
		image : icon
	});
	marker.setTitle(${price}+"원");
	</script>
	
</body>
</html>