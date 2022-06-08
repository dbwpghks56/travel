<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file = "selectAcco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	body {
		margin-left:10%;
		margin-right:10%;
		position: relative;
		box-sizing: border-box;
	}
	h2{
		position: left;
	}
	h3{
		position: left;
	}
	.aImgs{
		width:100%;
		height: 30%;
	}
</style>
</head>
<body>
	<h2>${accoName}</h2>
	<h3>${address}</h3>
	<div class = "aImgs">
	<c:if test="${not empty a_image_path[0]}">
		<img id = "firstImg" src="../accoImages/${a_image_path[0]}">
		<c:if test="${not empty a_image_path[1]}">
			<img src="../accoImages/${a_image_path[1]}">
			<c:if test="${not empty a_image_path[2]}">
				<img src="../accoImages/${a_image_path[2]}">
				<c:if test="${not empty a_image_path[3]}">
					<img src="../accoImages/${a_image_path[3]}">
				</c:if>
			</c:if>
		</c:if>
	</c:if>
	</div>
	<h2>${nickName}(${user_id })님이 호스팅하는 ${accoName}</h2>
	<p>최대 인원 ${ }
	
</body>
</html>