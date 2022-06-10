<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modal{
		display:block;
		background-color: rgba(0, 0, 0, 0.4);
	}
	.modal-dialog{
		top: 50%;
		left:50%;
	}
	.modal-content{
		
		width: 40%;
		height: 70%;
		padding: 40px;
		text-align: center;
		background-color: rgb(255, 160, 160);
		border-radius: 10px;
	}
</style>
</head>
<body>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">후기 신고하기</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<c:choose>
						<c:when test="${result ==false }">
							신고 실패
						</c:when>
						<c:otherwise>
							신고 완료
						</c:otherwise>
					</c:choose>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id = "modalClose">Close</button>
				</div>

			</div>
		</div>
	</div>
	<script>
		var modal = document.querySelector(".modal");
		document.querySelector("#modalClose").onclick = function(){
			history.go(-1);
		};
		
	</script>
</body>
</html>