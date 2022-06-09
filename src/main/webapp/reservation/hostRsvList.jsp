<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>host가 등록한 숙소에 예약된 list</title>
<style>
table, td { 
border: 1px solid gray;
border-collapse: collapse;
padding: 10px;
}
</style>
</head>
<body>
<h1>예약된 List</h1>
<table>
		<tr>
			<td>예약번호</td>
			<td>인원</td>
			<td>체크인/체크아웃</td>
			<td>유저번호</td>
		</tr>
		
		<c:forEach items="${hostrsvlist}" var="host">
		<tr>
			<td>${host.rsv_no}</td>
			<td>${host.personnel}</td>
			<td>${host.check_in} / ${host.check_out}</td>
			<td>${host.user_phone}</td>

		</tr>
		</c:forEach>
	</table>

</body>
</html>