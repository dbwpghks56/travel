<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file = "selectAcco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${accoName}</h2>
	<h3>${address}</h3>
	<h3>${aImages}</h3>
	<c:forEach items = "${aImages }" var = "aImage">
		<img src="../accoImages/${aImage }" width="10%" height="10%">
	</c:forEach>
	
</body>
</html>