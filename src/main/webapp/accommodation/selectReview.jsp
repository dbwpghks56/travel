<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.modal-review{
		position: absolute;
		top : 0;
		left : 0;
		width: 100%;
		height: 100%;
		display:none;
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	.rmodal-content{
		position: absolute;
		width: 40%;
		height: 70%;
		padding: 40px;
		text-align: center;
		background-color: rgb(255, 160, 160);
		border-radius: 10px;
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	}
</style>
</head>
<body>
	<div class = "modal-review">
	<div class = "rmodal">
		<c:forEach items = "${rList}" var = "review">
			<div id = "userImg">
				<img src = "../uploads/${review.get('u_image_path')}">
			</div>
			<div id = "userInfo">
			
				${review.get('nick_name') }<br>
				${review.get('r_regdate') } <input type = "button" class = "report" data-rId ="${review.get('review_id') }" value ="신고">
			</div>
			<div id = "content">
				${review.get('content') }
			</div>
		</c:forEach>
		</div>
	</div>
</body>
</html>