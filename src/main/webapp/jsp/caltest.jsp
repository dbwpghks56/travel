<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<script src='fullcalendar/main.js'></script>
<title>Insert title here</title>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			events : [ {
				title : 'All Day Event',
				start : '2022-04-01'
			},
			{
				title : 'reservation',
				start : $(".checkcal").attr("data-checkin"),
				end : $(".checkcal").attr("data-checkout")
			},  ]
		});
		calendar.render();
	});
</script>
<style>
table, td {
	border: 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
}
</style>
</head>
<body>
	<div id='calendar'></div>
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
				<td><p class="checkcal" data-checkin="${rsv.check_in}" data-checkout="${rsv.check_out}">${rsv.check_in}/ ${rsv.check_out}</p></td>
				<td>${rsv.rsv_date}</td>
				<td>${rsv.rsv_status}</td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>