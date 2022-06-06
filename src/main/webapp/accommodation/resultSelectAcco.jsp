<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ include file = "selectAcco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
  margin: 1%;
}
li{
	list-style: none;
}
.slides{
	width: 500px;
	height:500px;
	position: relative;
	float:left;
	margin:0 auto;
}
.slides input[type = radio]{
	display : none;
}
ul.imgs{
	padding:0;
	margin:0;
	list-style: none;
	position: center;
}
ul.imgs li{
	position: absolute;
	left 500px;
	transition-delay: 1s;
	padding:0;
	margin:0;
	overflow: hidden;
}
.bullets{
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	bottom: 20px;
	z-index: 2;
}
.bullets label{
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(0,0,0,0.55);
	 width: 20px;
    height: 20px;
    cursor: pointer;
}
.prev{
	position: left;
}
.next{
	position: right;
}
.map{
	width : 60%;
	float: right;
}
</style>

</head>
<body>
	
		<div class = "slides">
		<c:forEach items = "${accommoList}" var = "acco">
		<span class="prev">&lang;</span>
		<ul class = "imghorder" class = "imgs">
		<c:forEach items ="${acco.a_image_path }" var = "image" >
				<input type = "radio" name = "slide">
				<li><img src="../accoImages/${image }" width = "100%" height="100%"></li>
		</c:forEach>
		</ul>
		<div class = "bullets">
		<c:forEach items = "${acco.a_image_path }" var = "image">
			<label for = "slide">&nbsp;</label>
		</c:forEach>
		</div>
		<span class="next">&rang;</span>
    	<a href = "selectRoom.do?acco_id=${acco.accommodation_id}&acco_name=${acco.accommodation_name}">${acco.accommodation_name}</a>
		</c:forEach>
    	</div>
		
	
    
    
	<div id="map" style="width:500px;height:400px;"></div>
	<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type = "text/javascript" src= "//dapi.kakao.com/v2/maps/sdk.js?appkey=1fbbb242c8d8813685c061dffd5629cc"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js" type="text/javascript"></script>
	<script>
		var accoArray = ${jArray};
		
		
		var divMap = document.querySelector("#map");
		var centerx = ${initCenterX};
		var centery = ${initCenterY};
		
		//GRS80(중부원점) 좌표계
		var grs80 = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43";
		//wgs84(위경도)좌표계
		var wgs84 = "+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees";

		var grs80P = proj4(grs80, wgs84, [centerx, centery]);
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(grs80P[1],grs80P[0]), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		var map = new kakao.maps.Map(divMap,options);
		
		
		
		var x;
		var y;
		var point;
		
		for(let i = 0; i<accoArray.length;i++){
			x = accoArray[i]['x'];
			y = accoArray[i]['y'];
			
			point = proj4(grs80, wgs84, [x, y]);
			
			var icon = new kakao.maps.MarkerImage(
				    '../images/icons/makerIcon.png',
				    new kakao.maps.Size(31, 35),
				    {
				        offset: new kakao.maps.Point(16, 34),
				        alt: "마커 이미지",
				        shape: "poly",
				        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
				    }
				);
			
			var marker = new kakao.maps.Marker({
			    map: map,
			    position: new kakao.maps.LatLng(point[1], point[0]),
			    image: icon
			});
		}
	</script>
	
</body>
</html>