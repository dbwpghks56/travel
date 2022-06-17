<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{
	margin:0 auto;
	box-sizing:border-box;
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
	background-color: blue;
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
</style>
<body>
<h1 class="title">Accommodation Management</h1>
<hr>
<c:forEach items="${accoList}" var= "acco" varStatus="status">
	<table>
		<tr id = "accoName">
			<td class = "var">숙소 이름</td>
			<td class = "value">${acco.get("accommodation_name")}</td>
			<td class = "updateBtn"><input type= button id = "updateAcco" value= "수정"></td>
			<td class = "deleteBtn"><input type= button class = "deleteAcco" value= "삭제" data-accid="${acco.accommodation_id}"></td>
			
		</tr>
		<tr>
			<td class = "var">숙소 위치</td>
			<td class = "value">${acco.get("address" )}</td>
			<td class = "updateBtn"><input type= button id = "updateAcco" value= "수정"></td>
			<td></td>
		</tr>
		<tr>
			<td class = "var">전화번호</td>
			<td class = "value">${acco.get("phone")}</td>
			<td class = "updateBtn"><input type= button id = "updateAcco" value= "수정"></td>			
		</tr>
		<tr>
			<td class = "var">옵션</td>
			<td class = "value">${acco.get("a_option")}</td>
			<td class = "updateBtn"><input type= button id = "updateAcco" value= "수정"></td>			
			<td></td>		
		</tr>
	</table>
	<c:forEach items="${rList.get(status.index) }" var = "room">
	<table>
		<tr id = "roomName">
			<td class = "var">방 이름</td>
			<td class = "updateBtn"><input type= button id = "update" value= "수정"></td>
			<td class = "value">${room.room_name}</td>
		</tr>
		<tr>
			<td class = "var">방 옵션</td>
			<td class = "updateBtn"><input type= button id = "update" value= "수정"></td>
			<td class = "value">${room.r_option}</td>
		</tr>
		<tr>
			<td class = "var">하루 숙박비</td>
			<td class = "updateBtn"><input type= button id = "update" value= "수정"></td>
			<td class = "value">${room.price_by_day}</td>
		</tr>
		<tr>
			<td class = "var">숙박일 제한</td>
			<td class = "updateBtn"><input type= button id = "update" value= "수정"></td>
			<td class = "value">${room.min_day}~${room.max_day}</td>
		</tr>
		<tr>
			<td class = "var">숙박일 제한</td>
			<td class = "updateBtn"><input type= button id = "update" value= "수정"></td>
			<td class = "value">${room.min_personnel}~${room.max_personnel}</td>
		</tr>
		<%-- <c:set var = "images" value = '${room.image_path.split(",") }'/>
		<tr>
			<td>사진</td>
			<td><img src = "/travel/accoImages/${images[0]}"></td>
			<td><img src = "/travel/accoImages/${images[2]}"></td>
		</tr> --%>
	</table>
	</c:forEach>
	<br>
	<br>
</c:forEach>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	
 	$("#update").on('click',function(e) {
		e.preventDefault();
		let property = $(this).next.text();
		alert(property);
		
		 $.ajax({
            type:"get",
            async:false, 
            url:"updateReviewReport.do",
            data : {},
            success:function (data,textStatus){
            	
	     	}
	     
	     	
	   	});  
	});
	$('#updateAcco').on('click',function(e){
		e.preventDefault();
		$.ajax({
            type:"get",
            async:false, 
            url:"updateReviewReport.do",
            data : {},
            success:function (data,textStatus){
            	
	     	}
	     
	     	
	   	});  	
	});
	$('.deleteAcco').on('click',function(){
		var cf = confirm("해당 숙소를 삭제하시겠습니까?");
		if(!cf) return false;		
		$.ajax({
            type:"POST",
        	 async:false,
            url:"selectAccoHost.do",
            data : {"user_id" : '${user.user_id}', "accommodation_id" : '$(this).attr("data-accid")}'},
            success:function (data){
            	if(data==0){
            		alert("해당 숙소에 예약 정보가 있습니다");
            	}else{
            		alert("삭제되었습니다");
            		
            	}
	     	}
	     
	     	
	   	});  	
	});
	
	 
</script>
</body>
</html>