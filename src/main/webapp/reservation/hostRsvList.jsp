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
			<td>숙소이름</td>
			<td>룸이름</td>
			<td>인원</td>
			<td>체크인/체크아웃</td>
			<td>유저이름</td>
			<td>유저번호</td>
			<td>요청사항</td>
		</tr>
		
		<c:forEach items="${rsvlist }" var="rsv">
		<tr>
			<td><a href="hostRsvDetail.do?accommodation_name=${accommodation_name}">숙소이름</a></td>
			<td>룸이름</td>
			<td>인원</td>
			<td>체크인/체크아웃</td>
			<td>유저이름</td>
			<td>유저번호</td>
			<td>요청사항</td>

		</tr>
		</c:forEach>
	</table>

</body>
</html>