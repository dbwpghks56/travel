<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modal{
		position: fixed;
		top : 0;
		left : 0;
		width: 100%;
		height: 100%;
		display:none;
		background-color: rgba(0, 0, 0, 0.4);
		align-content: center;
	}
	.modal-dialog{
		position: absolute;
		top:20%;
		left: 38%;
	}
	
	.modal-content{
		position: absolute;
		width: 300px;
		height: 300px;
		padding: 50px;
		text-align: center;
		background-color: rgb(255, 160, 160);
		border-radius: 10px;
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
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
					<h4 class="modal-title">정보 변경하기</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<input type = "text" id = "newValue">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id = "modalClose">확인</button>
				</div>

			</div>
		</div>
	</div>
	<script>
		
		
	</script>
</body>
</html>