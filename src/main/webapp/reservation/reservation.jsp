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
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js"
	type="application/javascript"></script>
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
			order_id : 'order_id11112', 
			extra : {
				vbank_result : 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
				quota : '0,2,3', // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용,
				theme : 'purple', // [ red, purple(기본), custom ]
				custom_background : '#00a086', // [ theme가 custom 일 때 background 색상 지정 가능 ]
				custom_font_color : '#ffffff' // [ theme가 custom 일 때 font color 색상 지정 가능 ]
			}
		}).error(function(data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function(data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function(data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function(data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function(data) {
			// 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			console.log(data);
		}).done(function(data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
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
		
	
			<input class="btn" id="btn_submit" type="button" value="예약하기" onclick="pay();"> 
			<input class="btn" id="btn_reset" type="reset" value="취소">
		
		
		

	</form>
</body>
</html>