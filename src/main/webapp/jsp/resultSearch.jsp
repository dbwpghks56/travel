<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin : 10% auto;
		
	}
	.acco{
		display: inline-block;
		margin-left: 20px;
		margin-right: 20px;
		width : 15%;
		
	}
</style>

</head>
<body>
	
	<c:forEach items = "${accommoList}" var = "acco">
		<div class = "acco">
		<c:set var = "accId" value = "${acco.accommodation_id }"/>
		
		<img src="../accoImages/${accId }_1.jfif" width = "250px" height="250px">
		<a href = "selectRoom.do">${acco.accommodation_name}</a>
		</div>
	</c:forEach>
	<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
</body>
</html>