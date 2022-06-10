<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>
<script>

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
<h1>예약목록</h1>
<a href="reservation.do">예약하기</a>
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
		<td>${rsv.check_in} / ${rsv.check_out}</td>
		<td>${rsv.rsv_date}</td>
		<td>${rsv.rsv_status}</td>

		</tr>
		</c:forEach>
	</table>
</body>
</html>