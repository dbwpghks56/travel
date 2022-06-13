<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				
/* 				var checkIn2 = new Date(${param.check_in});
				var checkOut2 = new Date(${param.check_out});
				var difDate2 = Math.ceil(
					(checkOut2.getTime() - checkIn2.getTime()) / (1000 * 3600 * 24)
				);
				document.getElementById("totalprice").value = (difDate2*${rsv.price_by_day}); */
				
				var checkIn = new Date($("#check_in").val());
				var checkOut = new Date($("#check_out").val());
				var difDate = Math.ceil(
					(checkOut.getTime() - checkIn.getTime()) / (1000 * 3600 * 24)
				);
				if(difDate>${rsv.max_day}){alert("최대 숙박일을 초과 하셨습니다");}
				document.getElementById("totalprice").value = (difDate*${rsv.price_by_day});
				
				
				
				
				
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
	
function nullCheck(){

}



</script>
<style>
#container {
	width: 500px;
	height: 500px;
}
</style>
</head>
<body>
	<h1>예약하기</h1>
		<div id="container">
		<div id='calendar'></div>
	</div>
	<form name="frm" action="reservation.do" method="post" onsubmit="nullCheck()">
	
	
		<label>숙소이름</label>
		${rsv.accommodation_name}
		<input type="hidden" name="user_id" value="${user.user_id }">
		
		<label>룸이름</label>
		<%-- ${ }  --%>
		<!-- <input type="hidden" name="rno" value=""> <br> -->
		<input type="text" name="user_id" value="${user.user_id }" disabled="disabled" >
		<input type="hidden" name="room_id" value="${param.room_id }"><br>
		${rsv.room_name}
		<input type="hidden" name="room_id" value="${param.room_id}" ><br>
		
		<p class="checkcal" data-checkin="${rsv.check_in}" data-checkout="${rsv.check_out}">
		<!-- &check_in=2022-06-16&check_out=2022-06-18 value="${param.check_in}" value="${param.check_out}" -->
		<label>체크인</label>
		<input type="date" name="check_in" id="check_in" readonly="readonly"><br> 		
		<label>체크아웃</label>
		<input type="date" name="check_out" id="check_out" readonly="readonly"><br>
		
		<label>체크아웃</label> <input type="date" name="check_out" id="check_out" ><br>
		
		<label>인원</label> 
		<input type='button' onclick='count("minus")' value='-' /> 
		<input type="number" name="personnel" min="1" id="result" value="0" readonly="readonly"> 
		<!-- max="${room.max_personnel}" 넣으면 되지 않을까...? -->
		<label>인원</label>
		<input type='button' onclick='count("minus")' value='-' />
		<input type="number" name="personnel"  id="result" value="0" required="required" readonly="readonly"> 
		<input type='button' onclick='count("plus")' value='+' /><br>  
		
		<label>총 금액</label>
		<input type="text" id="totalprice" readonly="readonly" >원
		
		<label>요청사항</label> 
		<input type="text" name="request" placeholder="추가 요청사항을 입력해주세요"><br>
		<input class="btn" type="submit" value="예약"> 
		<input class="btn" type="reset" value="취소">


	</form>
	<script>
		document.querySelector(".submit").onclick = function(){
			 var room_id = ${param.room_id};
	    	   $.ajax({
	             type:"post",
	             async:false, 
	             url:"reservation.do",
	             data : {"room_id": room_id},
	             success:function (data,textStatus){
	            	 alert(data);
	             }
		     });
		};
	</script>
/* 		document.querySelector(".submit").onclick = function(){
			 var room_id = ${param.room_id};
	    	   $.ajax({
	             type:"post",
	             async:false, 
	             url:"reservation.do",
	             data : {"room_id": room_id},
	             success:function (data,textStatus){
	            	 alert(data);
	             }
		     });
		}; */
	</script>
	

</body>
</html>