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
		<img alt="숙소이미지" src="../images/acco1.webp" width = "250px" height="250px">
		${acco.accommodation_name}
		</div>
	</c:forEach>
	
</body>
</html>