<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="selectAcco.jsp"%>
<%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 1%;
	box-sizing: border-box;
}

body{
	position: relative;
}
#map {
	position:fixed;
	left:50%;
	width: 50%;
	height: 100%;
}
#leftSide{
	position: left;
	width: 50%;
	height: 40%;
}
#demo{
	display:inline-block;
	width: 45%;
	height: 45%;
	
}
#demo a{
	display: inline-block;
	width:75%;
	text-decoration: none;
	color:black;
}
.carousel-item active{
	border-radius: 10%;
	overflow: hidden;
}
.carousel-item{
	border-radius: 10%;
	overflow: hidden;
} 
.score{
	display: inline-block;
	width:20%;
	float: right;
	margin-left: 0;
}
.search {
	margin-top: 12px;
	clear: both;
	width: 900px;
	display: inline-block;
}
#wholecontainer {
	clear: both;
}

#lobster {
	left: 0;
	margin: 0;
}

#dropscontainer {
	margin: 0;
}
</style>

</head>
<body>
	<div id="wholecontainer">
	<div id="map" ></div>
	
	<c:set var = "accommoList" value = "${accommoList }"/>
	<c:set var = "stars" value = "${stars }"/>
	<div id = "leftSide">
		<c:forEach items = "${aImgs }" var = "aImg" varStatus = "status">
			<!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel" >

	

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../accoImages/${aImg[0]}" alt="ėėėŽė§1" class="d-block w-100"  height="260px">
			</div>
			<c:if test="${aImg[1] ne null }">
			<div class="carousel-item">
				<img src="../accoImages/${aImg[1]}" alt="ėėėŽė§2" class="d-block w-100"  height="260px">
			</div>
			</c:if>
			<c:if test="${aImg[2] ne null }">
			<div class="carousel-item">
				<img src="../accoImages/${aImg[2]}" alt="ėėėŽė§3" class="d-block w-100" height="260px">
			</div>
			</c:if>
			
		</div>
		
		
		<a href = "selectRoom.do?acco_name=${accommoList.get(status.index).get('accommodation_name') }&acco_id=${accommoList.get(status.index).get('accommodation_id') }">
		<span>${accommoList.get(status.index).get('accommodation_name') }</span></a>
		<div class = "score"><span class="material-icons">star</span><span>${stars.get(status.index)}</span></div>
	</div>
	</c:forEach>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fbbb242c8d8813685c061dffd5629cc"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js"
		type="text/javascript"></script>
	<script>
		

		var divMap = document.querySelector("#map");
		var centerx = ${initCenterX};
		var centery = ${initCenterY};

		//GRS80(ėĪëķėė ) ėĒíęģ
		var grs80 = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43";
		//wgs84(ėęē―ë)ėĒíęģ
		var wgs84 = "+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees";

		var grs80P = proj4(grs80, wgs84, [ centerx, centery ]);
		var options = { //ė§ëëĨž ėėąí  ë íėí ęļ°ëģļ ėĩė
			center : new kakao.maps.LatLng(grs80P[1], grs80P[0]), //ė§ëė ėĪėŽėĒí.
			level : 3
		//ė§ëė ë ëēĻ(íë, ėķė ė ë)
		};
		var map = new kakao.maps.Map(divMap, options);

		var x;
		var y;
		var point;
		
		for (let i = 0; i < ${accommoList.size()}; i++) {
			x = ${accommoList.get(i).get('x')};
			y = ${accommoList.get(i).get('y')};

			point = proj4(grs80, wgs84, [ x, y ]);

			var icon = new kakao.maps.MarkerImage(
					'../images/icons/makerIcon.png',
					new kakao.maps.Size(70, 35),
					{
						offset : new kakao.maps.Point(16, 34),
						alt : "ë§ėŧĪ ėīëŊļė§",
						shape : "poly",
						coords : "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
					});

			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(point[1], point[0]),
				image : icon
			});
		}
	</script>
	</div>

</body>
</html>