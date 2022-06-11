<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<title>Insert title here</title>
<style type="text/css">
	
</style>
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
				$("#start").val(info.startStr);
				$("#end").val(info.endStr);
				console.dir(info.resourceId);
			},
		});
		calendar.render();
	});
</script>
<style>
h1 {
	font-family: 'Lobster', cursive;
}
#container {
	width: 500px;
	height: 500px;
}
table, td {
	border: 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
}
</style>
</head>
<body>
	<h1>Would You Travel</h1>
	<div id="container">
		<div id='calendar'></div>
	</div>
	<br>
	<input type="date" id="start" value="startday" readonly="readonly">
	<input type="date" id="end" value="endday" readonly="readonly">
	<table>
		<tr>
			<td>예약번호</td>
			<td>숙소이름</td>
			<td>룸이름</td>
			<td>체크인/체크아웃</td>
			<td>예약날짜</td>
			<td>예약상태</td>
			<td>금액</td>
			<td></td>
			<td></td>
		</tr>

		<c:forEach items="${rsvlist }" var="rsv">
			<tr>
				<td><a href="rsvdetail.do?rsv_no=${rsv.rsv_no}">${rsv.rsv_no}</a></td>
				<td>숙소이름</td>
				<td>룸이름</td>
				<td><p class="checkcal" data-checkin="${rsv.check_in}"
						data-checkout="${rsv.check_out}">${rsv.check_in}/
						${rsv.check_out}</p></td>
				<td>${rsv.rsv_date}</td>
				<td>${rsv.rsv_status}</td>

			</tr>
		</c:forEach>
	</table>

</body>
</html> 