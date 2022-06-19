<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file = "updateAccoRoomModal.jsp" %>
     <%@ include file =  "/jsp/mainnav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
*{
	margin:0 auto;
	box-sizing:border-box;
	text-align: center;
}


	
body{
	margin-top:3%;
}
#accoTable{
	margin-top:5%;
}
#accoName{
	background-color : pink;
}
#roomName{
	background-color :#ffe6f2;
}
table{
	width:500px;
	border-collapse: collapse;
}
.var{
	width: 30%;
	margin: 0;
}
.updateBTN{
	display:inline-block;
	width: 10%;	
}
input{
	background-color: white;
	border:none;
	border-radius: 5px;
}
input:hover{
	cursor: pointer;
	background-color: skyblue;
}
.value{
	width:60%;
}

.title {
clear: both;
	width: 500px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 4em;
	color: pink;
}

#updateImg{
	height: 300px;
	vertical-align: top;
}
.Img{
	border: 0.3px solid gray;
}

td{
vertical-align: top;
}


</style>
<body>

<h1 class="title">Accommodation Management</h1>

<br>
<hr>
<c:forEach items="${accoList}" var= "acco" varStatus="status">
	<table id ="accoTable">
		<tr id = "accoName">
			<td class = "var">${status.index+1 }번 숙소</td>
			<td class = "value">${acco.get("accommodation_name")}</td>
			<td class = "deleteBtn"><input type= button class="deleteAcco" value= "삭제" data-accid="${acco.get('accommodation_id') }"></td>
			<td class = "updateBtn"><input type= button class= "updateAcco" data-no = '${acco.get("accommodation_id") }' data-pro="accommodation_name"value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">숙소 위치</td>
			<td class = "value">${acco.get("address" )}</td>
			<td class = "updateBtn"><input type= button class = "updateAcco" data-no = '${acco.get("accommodation_id") }'data-pro="address" value= "수정"></td>

		</tr>
		<tr>
			<td class = "var">전화번호</td>
			<td class = "value">${acco.get("phone")}</td>

			<td class = "updateBtn"><input type= button class = "updateAcco"data-no = '${acco.get("accommodation_id") }'data-pro="phone" value= "수정"></td>

		</tr>
		<tr>
			<td class = "var">옵션</td>
			<td class = "value">${acco.get("a_option")}</td>

			<td class = "updateBtn"><input type= button class = "updateAcco"data-no = '${acco.get("accommodation_id") }' data-pro="a_option"value= "수정"></td>
		</tr>
		<tr class = "Img">
			<td class = "var">숙소 사진</td>
			<td id ="updateImg" >
			<!-- <div class="input-group mb-3">
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
			</div> -->
			
			<td class = "updateBtn"><input type= button class = "updateAccoImg"data-no = '${acco.get("accommodation_id") }' data-pro="a_image"value= "수정"></td>

		</tr>
	</table>
	<c:forEach items="${rList.get(status.index) }" var = "room">
	<table>
		<tr id = "roomName">
			<td class = "var">방 이름</td>
			<td class = "value">${room.room_name}</td>
			<td class = "updateBtn"><input type= button data-no="${room.room_id}"class = "update"data-pro="room_name" value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">방 옵션</td>
			<td class = "value">${room.r_option}</td>
			<td class = "updateBtn"><input type= button class = "update"data-no="${room.room_id} "data-pro="r_option" value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">하루 숙박비</td>
			<td class = "value">${room.price_by_day}</td>
			<td class = "updateBtn"><input type= button class = "update"data-no="${room.room_id}"data-pro="price_by_day" value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">최소 숙박일</td>
			<td class = "value">${room.min_day}</td>
			<td class = "updateBtn"><input type= button class = "update"data-no="${room.room_id} "data-pro="min_day"value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">최대 숙박일</td>
			<td class = "value">${room.min_day}</td>
			<td class = "updateBtn"><input type= button class = "update"data-no="${room.room_id} "data-pro="max_day"value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">최소 인원</td>
			<td class = "value">${room.min_day}</td>
			<td class = "updateBtn"><input type= button class = "update"data-no="${room.room_id}"data-pro="min_perssonel" value= "수정"></td>
		</tr>
		<tr>
			<td class = "var">최대 인원</td>
			<td class = "value">${room.min_day}</td>
			<td class = "updateBtn"><input type= button class = "update"data-no="${room.room_id}"data-pro="max_personnel" value= "수정"></td>
		</tr>
		<%-- <c:set var = "images" value = '${room.image_path.split(",") }'/>
		<tr>
			<td>사진</td>
			<td><img src = "/travel/accoImages/${images[0]}"></td>
			<td><img src = "/travel/accoImages/${images[2]}"></td>
		</tr> --%>
	</table>
	</c:forEach>
	
</c:forEach>

<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var pro = null;
	var id  = 0;
 	$(".update").on('click',function(e) {
		e.preventDefault();
		pro = $(this).attr("data-pro");
		id = $(this).attr("data-no");
		document.querySelector(".modal").style.display = "block";
		 
	});
	$('.updateAcco').on('click',function(e){
		e.preventDefault();
		pro = $(this).attr("data-pro");
		id = $(this).attr("data-no");
		document.querySelector(".modal").style.display = "block";
			
	});
	document.querySelector("#modalClose").onclick = function(){
		modal.style.display = 'none';
		let newValue = $('#newValue').val();
		$.ajax({
            type:"get",
            async:false, 
            url:"updateAccoRoom.do",
            data : {pro: pro,newValue:newValue,id:id},
            success:function (data,textStatus){
            	location.href = "selectAccoHost.do";
	     	}
	     
	     	

	   	});  	
	};
	
	$('.deleteAcco').on('click',function(){
		var cf = confirm("해당 숙소를 삭제하시겠습니까?");
		if(!cf) return false;		
		$.ajax({
            type:"POST",
        	 async:false,
            url:"accoDelete.do",
            data : {"user_id" : '${user.user_id}', "accommodation_id" : $(this).attr("data-accid")},
            success:function (data){
            	if(data==0){
            		alert("해당 숙소에 예약 정보가 있습니다");
            	}else{
            		alert("삭제되었습니다");
            		window.location.reload();
            		
            	}
	     	}
	     
	     	
	   	});  	
	});
	

	var modal = document.querySelector(".modal");
	var modalDialog = document.querySelector(".modal-dialog");
	var close = document.querySelector("#modalClose");
	window.addEventListener('click',(e) => {
		if(e.target== modalDialog){
			modal.style.display ='block';
		}else if(e.target ==modal){
			modal.style.display='none';
		}
	}) ;
	function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            img.style.width = "300px";
            img.style.height="300px";
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
	

</script>
</body>
</html>