<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<title>reservation</title>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		let eventobj = [];
		$(".checkcal").each(function(index) {
			eventobj[index] = {
				title : 'reservation',
				start : $(this).attr("data-checkin"),
				end : $(this).attr("data-checkout")
			}
		});
		let test = document.getElementsByClassName("checkcal");
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			selectable: true,
			initialView : 'dayGridMonth',
			events : eventobj,
			selectOverlap: function(event) {
				
			    return event.rendering === 'background';
			    
			  },
			select : function(info) {
				$("#check_in").val(info.startStr);
				$("#check_out").val(info.endStr);
				
				//console.log(typeof(info.startStr));
				console.dir(info.resourceId);
							
				var checkIn = new Date($("#check_in").val());
				var checkOut = new Date($("#check_out").val());
				var difDate = Math.ceil(
					(checkOut.getTime() - checkIn.getTime()) / (1000 * 3600 * 24)
				);
				if(difDate>${rsv.max_day}){alert("최대 숙박일을 초과 하셨습니다");}
				document.getElementById("totalprice").value = (difDate*${rsv.price_by_day})+"원";
							
			},
		});
		calendar.render();
		console.dir(calendar.getEvents());
	});
</script>
<script>

function count(type)  {
	
	  const resultElement = document.getElementById('result');
	  let num = resultElement.value;
	  if(type === 'plus') {
		  num = parseInt(num) + 1;
		  if(num>=${rsv.max_personnel}){
			  alert("최대 숙박 인원은 "+${rsv.max_personnel}+"명 입니다");
		  }
		  
	  }else if(type === 'minus')  {
		  num = parseInt(num) - 1;
	    if(num<${rsv.min_personnel}){
	    	return;
	    }
	  }
	  resultElement.value = num;
	}
	




</script>
<style>
body{
	width: 500px;
	margin: 0 auto;
	padding: 50px;
}

div.rsv_group{
	margin: 20px 0;
}



div.rsv_group_date{
	width: 49%;
	display: inline-block;
	float: left;
	margin-left: 1%;
}

label{
	display: block;
	font-family: 'Nanum Gothic';
	padding-bottom: 10px;
	font-size: 1.25em;
}

input, textarea{
  border-radius: 10px;
  border: 2px solid #777;
  box-sizing: border-box;
  font-size: 1.25em;
/*   font-family: 'Nanum Gothic'; */
  width: 100%;
  padding: 10px;
}

div.rsv_group_date input{
	width: 95%;
	display: inline-block;
	
}

div.rsv_group_personnel input{
	width: 50px;
	display: inline-block;
}

textarea{ height: 150px; }

hr{ border: 1px dotted #ccc;}



.btn{
  width: 100px;
  height: 50px;
  border: none;
  font-size: 1.25em;
/*   font-family: 'Nanum Gothic'; */
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
}

#btn_submit{
 	background: pink;
    color: white;
}

#btn_reset{
 	background: lightgray;
    color: white;
}

.btn:hover{
	border: 2px solid black;
}

#result{
	width: 200px;
	text-align: center;
}
#container {
	width: 500px;
	height: 450px;
	
	
}
h1{text-align: center;}
</style>
</head>
<body>
	<div><h1>Lodging Reservations</h1></div>
	
	<hr>
		<div id="container">
			<div id='calendar'></div>
		</div>
	<hr>
		
	<form name="frm" action="reservation.do" method="post" >
		<input type="hidden" name="user_id" value="${user.user_id }">	
		<input type="hidden" name="room_id" value="${param.room_id}" >
	
			<div class="rsv_group">		
				<label for="acco_name">숙소이름</label>
				<input type="text" id="acco_name" value="${rsv.accommodation_name}" readonly="readonly"> 
			</div>

			<div class="rsv_group">
				<label for="room_name">룸이름</label>
				<input type="text" id="room_name" value="${rsv.room_name}" readonly="readonly"> 
			</div>

	<hr>
		<c:forEach items="${checkInOut}" var="check">
		<p class="checkcal" data-checkin="${check.check_in }" data-checkout="${check.check_out}"></p>
		</c:forEach>
		<!-- &check_in=2022-06-16&check_out=2022-06-18 value="${param.check_in}" value="${param.check_out}" -->
		
			<div class="rsv_group_date">
				<label for="check_in">체크인</label>
				<input type="date" name="check_in" id="check_in"  readonly="readonly">	
			</div>
		
			<div class="rsv_group_date">
				<label for="check_out">체크아웃</label>
				<input type="date" name="check_out" id="check_out"  readonly="readonly">
			</div>
		
	<br>
		

			<div class="rsv_group_personnel">
				<label for="personnel">인원</label> 
					<input class="btn_personnel" type='button' onclick='count("minus")' value='-' style="text-align: center;" > 
					<input type="number" name="personnel" min="1" id="result" value="0" readonly="readonly" > 
					<input class="btn_personnel" type='button' onclick='count("plus")' value='+' style="text-align: center;" >
			</div>
	
		
			<div class="rsv_group">
				<label>총 금액</label>
					<input type="text" id="totalprice" readonly="readonly" style="text-align: right;">
			</div>
		
			<div class="rsv_group">
				<label>요청사항</label> 
					<textarea id="request" name="request" placeholder="추가 요청사항을 입력해주세요" ></textarea>
			</div>
	 <hr>
		
	
			<input class="btn" id="btn_submit" type="submit" value="예약하기"> 
			<input class="btn" id="btn_reset" type="reset" value="취소">
		
		
		

	</form>
</body>
</html>