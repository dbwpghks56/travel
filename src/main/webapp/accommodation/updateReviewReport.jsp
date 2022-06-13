<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modal{
		position: absolute;
		top : 0;
		left : 0;
		width: 100%;
		height: 100%;
		display:none;
		background-color: rgba(0, 0, 0, 0.4);
	}
	.modal-dialog{
		position: absolute;
	}
	.modal-body2{
		display: none;
	}
	.modal-content{
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
					정말 신고하시겠습니까?
					<input type = "button" id = "updateReport" value = "신고">
				</div>
				<div class="modal-body2">
					신고 완료되었습니다!
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
			modal.style.display = 'none';
		};
		
	</script>
</body>
</html>