<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d503e5862c5829d5794c838da38c231&libraries=services,clusterer,drawing"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js"
	type="text/javascript"></script>
	<style type="text/css">
		#formcontainer {
			width: 40%;
			display: inline-block;
			margin-left: 5%;
			margin-right: 2%;
			margin-bottom: 1%;
		}
		
		.btn {
			margin-top: 5px;
			background-color: pink;
			border: 1px solid pink;
			margin-bottom: -5px;
			height: 56px;
			width: 100%;
		}
		
		.btn:hover {
			border: none;
			background-color: #F582A7;
		}
		.btn:focus {
			border: none;
			background-color: #F582A7;
		}
		
		#map {
			position: relative;
			z-index: -99;
			display: inline-block;
			width: 50%; 
			height: 680px; 
			border: 1px solid pink;
			box-shadow: 3px 3px #F582A7;
			
		}
		#accot {
			margin-bottom: 10px;
		}
		.input-group-text {
			background-color: pink;
			color: white;
		}
		#thumbnail {
			width: 200px;
			height: 200px;
			border-radius: 5px;
			border: 3px solid pink;
		}
		#wholecontainer {
			clear: both;
		}
		#dropsitem {
			z-index: 99;
		}
	</style>
</head>
<body>
<div id="wholecontainer">
	<div id="formcontainer">
		<form action="insertAcco.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="user_id" value="${user.user_id }"> 
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="acco_name" placeholder="Enter name" name="acco_name" required="required">
				<label for="acco_name"> 숙소 이름 : </label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" name="mail_num" required="required" readonly="readonly">
				<label for="sample6_postcode"> 우편번호 : </label>
				<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="sample6_address" placeholder="주소" name="address" onchange="addresstogeo();" required="required" readonly="readonly">
				<label for="sample6_address"> 도로명 주소 : </label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" name="location_detail" required="required">
				<label for="sample6_detailAddress"> 상세 주소 : </label>
			</div>
			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			<input type="button" class="btn btn-primary" id="geobtn" value="지도에 표시하기" onclick="addresstogeo();"> 
			<input type="hidden" id="geobtnY" name="geoX">
			<input type="hidden" id="geobtnX" name="geoY"> <br> <br>
			<div class="input-group mb-3">
				<span class="input-group-text">사진</span> <input type="file"
					class="form-control" placeholder="Photo" name="photos" accept="image/*" onchange="setThumbnail(event);" multiple="multiple">
					<div id="demo" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div id="image_container"></div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
							<span class="carousel-control-next-icon"></span>
						</button>
					</div>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" placeholder="옵션" name="acco_option" required="required">
				<label for="acco_option"> 옵션 : </label>
			</div>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" placeholder="전화번호" name="acco_phone" required="required">
				<label for="acco_phone"> 전화번호 : </label>
			</div>
			<div id="accot">
				숙소 타입 : <input type="radio" name="acco_type" value="호텔"> 
				호텔 <input type="radio" name="acco_type" value="여관">
				여관 <input type="radio" name="acco_type" value="게스트하우스"> 
				게스트하우스 <input type="radio" name="acco_type" value="펜션">
				펜션 <input type="radio" name="acco_type" value="캠핑장">
				캠핑장 
			</div>
			<input type="submit" class="btn btn-primary" value="숙소 등록하기">
		</form>
	</div>
	<div id="map"></div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function setThumbnail(event) {
	        for (var image of event.target.files) {
	          var reader = new FileReader();
	
	          reader.onload = function(event) {
	            var img = document.createElement("img");
	            var div = document.createElement("div");
	            var div2 = document.createElement("div");
	            img.setAttribute("src", event.target.result);
	            div.class = 'carousel-item';
	            div2.class = 'image_container';
	            img.id = 'thumbnail';
	            document.querySelector("div.carousel-inner").appendChild(div);
	            div.appendChild(div2);
	            div2.appendChild(img);
	          };
	
	          console.log(image);
	          reader.readAsDataURL(image);
	        }
	      }

	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		function addresstogeo() {
			geocoder.addressSearch(
						$("#sample6_address").val(),
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								$("#geobtnY").val(result[0].y); // 이거먼저 와야됨
								$("#geobtnX").val(result[0].x);
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
									/* console.log(coords); */
								});
								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">내 숙소 위치</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
		}
	</script>
	</div>
</body>
</html>