<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">

<title>예약하기</title>

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<script>
window.onload = function(){
	
	var valueCheckIn = new Date(${check_in});
	var valueCheckOut =  new Date(${check_out});
	var valueDifDate = valueCheckIn-valueCheckOut;
	console.log((valueCheckOut)-valueCheckIn);
	console.log(valueCheckOut.getYear());
	document.getElementById("totalprice").value = (valueDifDate*${rsv.price_by_day}*${person})+"원";
};




</script>
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
				if(difDate>${rsv.max_day}){alert("최대 숙박일은 ${rsv.max_day}일 입니다");}
				document.getElementById("totalprice").value = (difDate*${rsv.price_by_day}*$("#result").val())+"원";
							
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
		  if(num>${rsv.max_personnel}){
			  alert("최대 숙박 인원은 "+${rsv.max_personnel}+"명 입니다");
			  return;
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
 <script type="text/javascript">
	function pay() {
		BootPay.request({
			price : $("#totalprice").val(), 
			application_id : "62a2ec5de38c3000215ae28d",
			name : '${rsv.accommodation_name}', 
			pg : 'kakao',
			method : 'easy',
			show_agree_window : 1, 
			items : [ {
				item_name : '${rsv.room_name}', 
				qty : 1, 
				unique : '${rsv.rsv_no}', 
				price : $("#totalprice").val(), 
			} ],
			user_info : {
				username : '${user.user_name}',
				email : '${user.user_email}',
				phone : '${user.user_phone}'
			},
			order_id : 'order_id1099', 
			extra : {
				vbank_result : 1, 
				quota : '0,2,3', 
				theme : 'purple', 
				custom_background : '#00a086', 
				custom_font_color : '#ffffff' 
			}
		}).error(function(data) {
			console.log(data);
		}).cancel(function(data) {
			console.log(data);
		}).ready(function(data) {
			console.log(data);
		}).confirm(function(data) {
			console.log(data);
			var enable = true; 
			if (enable) {
				BootPay.transactionConfirm(data); 
			} else {
				BootPay.removePaymentWindow(); 
			}
		}).close(function(data) {
			console.log(data);
		}).done(function(data) {
			$("#rsv_form").submit();
			console.log(data);
		});
	}
</script> 
<style>
body{
	width: 500px;
	margin: 0 auto;
	padding: 50px;
	background-color: #FFE6E6;;
}

div.rsv_group{
	margin: 20px 0;
}



 div.rsv_group_date{
	width: 150px;
	display: inline-block;
	float: left;
	margin-left: 1%;
}
div.rsv_group_personne{
	width: 150px;
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
  width: 100%;
  padding: 10px;
}

 div.rsv_group_date input{
	width: 150px;
	display: inline-block;
	
} 


div.rsv_group_personnel input{
	width: 50px;
	display: inline-block;
	text-align: center;
	
} 


textarea{ height: 130px; resize: none;}

hr{ border: 1px dotted #ccc;}

.btnall{
 padding-left:30%; 
}

.btn{
  width: 85px;
  height: 50px;
  border:none;
  font-size: 1em;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
  background-color: #FDEBF7;
  font-weight: bold;
  color: gray;
  
}
.btn:hover{
	 border: 4px solid #FFC0D3;
	 
}


#btn_reset{
 	background: #E6F8F9;
    color: gray;
}
#btn_reset:hover{  border: 4px solid #B1E8ED;}




#container {
	width: 500px;
	height: 450px;
	
	
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
#minus,#plus{ font-size: 1.3em; border: none; background-color:  #E6F8F9;}
</style>
</head>
<body>
<div id="reservation_form">
	<div><h1 class="title">Lodging Reservations</h1></div>
	
	<hr>
		<div id="container">
			<div id='calendar'></div>
		</div>
	<hr>
		
	<form name="frm" action="reservation.do" method="post" id="rsv_form" >
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
	
			<div class="rsv_group_date">
				<label for="check_in">체크인 </label>
				<input type="date" name="check_in" id="check_in"  readonly="readonly" value="${check_in }">	
			</div>
			<div class="rsv_group_date">
				<label for="check_out">체크아웃</label>
				<input type="date" name="check_out" id="check_out"  readonly="readonly" value="${check_out }">
			</div> 
		


		

			<div class="rsv_group_personnel">		
				<label for="personnel">인원</label> 
					<input id="plus" class="btn" type='button' onclick='count("minus")' value='-' " > 
					<c:if test="${person != null }">
					<input type="number" name="personnel" min="1" id="result" value="${person }" readonly="readonly"  > 
					</c:if>
					<c:if test="${person == null }">
					<input type="number" name="personnel" min="1" id="result" value="0" readonly="readonly"  > 
					</c:if>					
					<input id="minus" class="btn" type='button' onclick='count("plus")' value='+'  >
			</div> 


			<div class="rsv_group">
				<label>요청사항</label>
				<textarea id="request" name="request" placeholder="추가 요청사항을 입력해주세요"></textarea>
			</div>
<hr>
			<div class="rsv_group">
				<label>총 금액</label>
					<input type="text" id="totalprice" readonly="readonly" style="text-align: right;">
			</div>
		
		
	 <hr>
		
		<div class="btnall">
			<input class="btn" id="btn_submit" type="button" value="예약하기" onclick="pay();"> 
			<input class="btn" id="btn_reset" type="reset" value="취소">
		</div>
		
		

	</form>
</div>
</body>
</html>