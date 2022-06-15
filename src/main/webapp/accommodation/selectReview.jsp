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
		display: none;
	}
	
	.rmodal{
		position: fixed;
		left:30%;
		width: 40%;
		height: 90%;
		padding: 40px;
		text-align: center;
		background-color:pink;
		border-radius: 10px;
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		word-break:break-all;
		overflow: scroll;
		z-index: 5;
	}
	input{
		width: 25%;
	}
</style>
</head>
<body>
	<div class = "modal-review">
	<div class = "rmodal">
		<c:forEach items = "${reviewList}" var = "review">
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
			<hr>
		</c:forEach>
		</div>
	</div>
	<script>
	
	</script>
</body>
</html>