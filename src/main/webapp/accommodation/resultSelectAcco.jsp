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
	body{
		margin : 0 auto;
		
	}
	.searchResult{
		width :40%;
		float:left;
	}
	.acco{
		display: inline-block;
		margin-left: 20px;
		margin-right: 20px;
		width : 15%;
		
	}
	.map{
		float: right;
	}
</style>

</head>
<body>
	<div class = "searchResult">
	<c:forEach items = "${accommoList}" var = "acco">
		<div class = "acco">
		<img src="../accoImages/Seoul_Chungchung/${acco.accommodation_id}_1.jfif" width = "50%" height="50%">
		<a href = "selectRoom.do">${acco.accommodation_name}</a>
		</div>
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