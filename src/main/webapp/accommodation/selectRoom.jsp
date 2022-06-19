<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file = "selectAcco.jsp" %>
    <%@ include file= "updateReviewReport.jsp" %>
    <%@ include file = "selectReview.jsp" %>
    <%@ include file="/jsp/mainnav.jsp" %>
    <%@ page import = "travel.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	* {
	margin: 1%;
	box-sizing: border-box;
	}
	body {

		position: relative;
	}
.w3-third{
	display: inline-block;
	width: 33%;
	margin:0;
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
	position:static;
	left:0;
	width: 50%;
	height: 40%;
	margin: 1%;
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
a{
	text-decoration: none;
	color:black;
}
.search {
	margin-top: 12px;
	clear: both;
	width: 900px;
	display: inline-block;
}
#wholecontainer {
	margin-left:10%;
	margin-right:10%;
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
	<h1>${accoName}</h1>
	<!-- Photo Grid -->
<div class="w3-row" id="myGrid">
	
  <div class="w3-third">
   	<c:if test="${not empty a_image_path[0]}">
		<img src="../accoImages/${a_image_path[0]}" style="width:100%"height="350px">
	</c:if>
  </div>

  <div class="w3-third">
  	<c:if test="${not empty a_image_path[1]}">
		<img src="../accoImages/${a_image_path[1]}"style="width:100%"height="350px">
	</c:if>
  </div>
  <div class="w3-third">
	<c:if test="${not empty a_image_path[2]}">
		<img src="../accoImages/${a_image_path[2]}"style="width:100%"height="350px">
	</c:if>
  </div>
</div>
	
	<h3>${nick_name}(${host_id})님이 호스팅하는 ${accoType}</h3>
	<hr>
		<div class = "detail">
		<img src = "/travel/images/icons/inquiry.png"><a href = "/travel/accommodation/insertroomInquiry.jsp?accoId=${accoId }&acco_name=${param.acco_name}">문의하기</a><br>
		<img src = "/travel/images/icons/phoneIcon.png">${phone}<br>
		<img src = "/travel/images/icons/blackMaker.png">${address }<br>
		<img src = "/travel/images/icons/homeIcon.png">${option }<br>
		<img src = "/travel/images/icons/wonIcon.png">${price}
		</div>
	<hr>
	<c:set var = "room" value = "${roomList }"/>
	<div id = "roomImgs">
		<c:forEach items = "${rImgs }" var = "rImg" varStatus="status">
			<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../accoImages/${rImg[0]}" alt="숙소사진1" class="d-block w-100" width="100%"height="200px">
			</div>
			<c:if test="${not empty rImg[1] }">
			<div class="carousel-item">
				<img src="../accoImages/${rImg[1]}" alt="숙소사진2" class="d-block w-100"width="100%"height="200px">
			</div>
			</c:if>
		</div>
		<%-- href = "../reservation/reservation.do?room_id=${roomList.get(status.index).getRoom_id()}" --%>
		<span><a onclick="loginCheck()"><img src = "../images/icons/timeIcon.png" width="20%"height="20%">${roomList.get(status.index).getRoom_name() }방 예약하기</a></span>
	</div>
	</c:forEach>
	</div>
	<hr>
		<div class = "reviewDiv">
		<div class = "stars">
		<h3>후기 ${reviewList.size()}개 </h3>
		<h4>청결 <span class="material-icons">star</span> ${cStar}점 | 위치 <span class="material-icons">star</span> ${lStar}점 | 만족 <span class="material-icons">star</span> ${sStar}점</h4>
		</div>
		<div class = "reviews">
		<c:forEach items = "${reviewList}" var = "review">
			<div id = "userImg">
				<img src = "../uploads/${review.get('u_image_path')}">
			</div>
			<div id = "userInfo">
			
				${review.get('nick_name') }<br>
				<c:choose>
				<c:when test="${user == null }">
				${review.get('r_regdate') } <input type = "button" class = "userNull"  value ="신고">
				</c:when>
				<c:otherwise>
				${review.get('r_regdate') } <input type = "button" class = "report" data-rId ="${review.get('review_id') }" value ="신고">
				</c:otherwise>
				</c:choose>
			</div>
			<div id = "content">
				${review.get('content') }
			</div>
		</c:forEach>
		<button id = "btnReview">더보기</button>
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
	
	function loginCheck(){
		let signIn = "${user.user_id}";
		if(signIn == ""){
			alert("로그인 후 이용해 주세요");
			location.href="../user/login.do"
		}else{
			location.href="../reservation/reservation.do?room_id=${roomList.get(status.index).getRoom_id()}" ;
		}
		
	}
	
	var report = document.querySelector(".report");
	$(".report").on("click", function(e) {
		e.preventDefault();
		modal.style.display = 'block';
		document.querySelector(".modal-body").style.display = "block";
		document.querySelector(".modal-body2").style.display = "none";
		document.querySelector(".modal-body3").style.display = "none";
		rId = $(this).attr("data-rId");
	});
	
	
	updateReport.onclick = function(){
   	  	$.ajax({
            type:"get",
            async:false, 
            url:"updateReviewReport.do",
            data : {rId: rId},
            success:function (data,textStatus){
            	if(data == 1){
            		document.querySelector(".modal-body").style.display = "none";
            		document.querySelector(".modal-body2").style.display = "block";
            		document.querySelector(".modal-body3").style.display = "none";
            	}else{
            		document.querySelector(".modal-body").style.display = "none";
            		document.querySelector(".modal-body2").style.display = "none";
            		document.querySelector(".modal-body3").style.display = "block";
            	}
	     	}
	     
	     	
	   	});  //end ajax	
		
	};
	$(".userNull").on("click", function(e) {
		e.preventDefault();
		if(confirm("로그인하기")){
			location.href = "/travel/user/login.do";
		}
			
	});
	var modalReview =document.querySelector('.modal-review');
	var rmodal =document.querySelector('.rmodal');
	var btnReview = document.querySelector('#btnReview');
	window.addEventListener('click', (e) => {
		if(e.target ==rmodal||e.target==btnReview){
			modalReview.style.display ='block';
		}else {
			modalReview.style.display ='none';
		}
	}) ;
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
	var sicon = new kakao.maps.MarkerImage(
			'../images/icons/newpin.png',
			new kakao.maps.Size(95, 50),
			new kakao.maps.Point(140, 50));
	var bicon = new kakao.maps.MarkerImage(
			'../images/icons/newpin.png',
			new kakao.maps.Size(150, 80),
			 new kakao.maps.Point(140, 50)
		);;
	
	var positions = [];
	var sights = ${sights};
	for(let i = 0; i<sights.length; i++){
		let = sight = sights[i];
		positions[i]= 
		    {
		        content: sight['sights_name'], 
		        latlng: new kakao.maps.LatLng(sight['x'], sight['y'])
		    };

	}
	for(let i = 0; i<sights.length; i++){
		let sight = sights[i];
		let smarker = new kakao.maps.Marker({
			map : map,
			position : positions[i].latlng,
			image : sicon
		});
		smarker.setClickable(true);
		let infowindow = new kakao.maps.InfoWindow({
		    content: positions[i].content // 인포윈도우에 표시할 내용
		});
		kakao.maps.event.addListener(smarker, 'mouseover', makeOverListener(map, smarker, infowindow));
		kakao.maps.event.addListener(smarker, 'mouseout', makeOutListener(infowindow,smarker));
		kakao.maps.event.addListener(smarker, 'click', function() {
		   	infowindow.open(map,smarker);
		   	smarker.setImage(bicon);
		});
	}
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	        marker.setImage(bicon);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow, marker) {
	    return function() {
	        infowindow.close();
	        marker.setImage(sicon);
	    };
	}
	
	</script>
	</div>
</body>
</html>