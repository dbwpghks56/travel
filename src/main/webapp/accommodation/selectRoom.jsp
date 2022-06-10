<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file = "selectAcco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
=======
>>>>>>> refs/remotes/origin/hyun
<title>Insert title here</title>
<<<<<<< HEAD
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
	.imgs{
		margin-bottom :5%;
	}
	.aImgs{
		display:inline-block;
		float:left;
		width:48%;
		height: 30%;
	}
	.aImgs2{
		display:inline-block;
		float:right;
		width:48%;
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
	#roomImgs{
	width: 40%;
	height: 40%;
}
#roomDetail{
	width: 40%;
	height: 20%;
}
#roomDetail span{
	margin-right: 44%;
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
	margin :0 auto;
	
}
#userImg img{
	width:100%;
	height:100%;
	
	border-radius: 50%;;
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
=======
>>>>>>> refs/remotes/origin/hyun
</head>
<body>
	<h2>${accoName}</h2>
<<<<<<< HEAD
	<div class = "imgs">
	<div class = "aImgs">
	<c:if test="${not empty a_image_path[0]}">
		<img id = "firstImg" src="../accoImages/${a_image_path[0]}" width="100%" height="100%">
	</c:if>
	</div>
	<div class = "aImgs2">
		<c:if test="${not empty a_image_path[1]}">
			<img src="../accoImages/${a_image_path[1]}"width="45%" height="50%">
			<c:if test="${not empty a_image_path[2]}">
				<img src="../accoImages/${a_image_path[2]}"width="45%" height="50%">
				<c:if test="${not empty a_image_path[3]}">
					<img src="../accoImages/${a_image_path[3]}"width="45%" height="50%">
				</c:if>
			</c:if>
		</c:if>
		</div>
	</div>
	<h3>${nick_name}(${host_id})님이 호스팅하는 ${accoType}</h3>
	<hr>
		<div class = "detail">
		<img src = "../images/icons/phoneIcon.png">${phone}<br>
		<img src = "../images/icons/blackMaker.png">${address }<br>
		<img src = "../images/icons/homeIcon.png">${option }<br>
		<img src = "../images/icons/wonIcon.png">${price}<img src = "../images/icons/timeIcon.png">예약하기
		</div>
	<hr>
	<div id = "roomImgs">
		<c:forEach items = "${rImgs }" var = "rImg">
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
				<img src="../accoImages/${rImg[0]}" alt="숙소사진1" class="d-block w-100">
			</div>
			<c:if test="${not empty rImg[1] }">
			<div class="carousel-item">
				<img src="../accoImages/${rImg[1]}" alt="숙소사진2" class="d-block w-100">
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
	</div>
=======
	<h3>${address}</h3>
	<h3>${aImages}</h3>
	<c:forEach items = "${aImages }" var = "aImage">
		<img src="../accoImages/${aImage }" width="10%" height="10%">
>>>>>>> refs/remotes/origin/hyun
	</c:forEach>
<<<<<<< HEAD
	</div>
	<div id = "roomDetail">
		<c:forEach items= "${roomList }" var = "room">
			<span>${room.room_name }</span>
		</c:forEach>
	</div>
	<hr>
		<div class = "reviewDiv">
		<h3>후기 (${reviewList.size()}개)</h3>
		<div class = "reviews">
		<c:forEach items = "${reviewList}" var = "review">
			<div id = "userImg">
				<img src = "../uploads/${review.get('u_image_path')}">
			</div>
			<div id = "userInfo">
				${review.get('nick_name') }<br>
				${review.get('r_regdate') } <input type = "button" class = "report" data-rId ="${review.get('review_id') }" value ="신고">
			</div>
			<div id = "content">
				${review.get('content') }
			</div>
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
	var report = document.querySelector(".report");
	var rId = null;
	$(".report").on("click", function(e) {
		e.preventDefault();
		modal.style.display = 'block';
		rId = $(this).attr("data-rId");
	});
	
	
	updateReport.onclick = function(){
   	  	$.ajax({
            type:"get",
            async:false, 
            url:"updateReviewReport.do",
            data : {rId: rId},
            success:function (data,textStatus){
            	document.querySelector(".modal-body").innerHTML="신고 완료됐습니다!";
            	
	     	}
	     	
	   	});  //end ajax	
		
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
=======
>>>>>>> refs/remotes/origin/hyun
	
</body>
</html>