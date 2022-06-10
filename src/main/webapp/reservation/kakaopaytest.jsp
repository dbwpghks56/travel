<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$.ajax({
		method : "POST",
		url : "https://kapi.kakao.com/v1/payment/ready",
		data : {
			cid:"TC0ONETIME"
		}
	}).done(function(msg) {
		alert("Data Saved: " + msg);
	});
</script>
</head>

<body>
<h1>kakaopay api test</h1>
<form action="/kakaoPay" method="post">
<button>카카오페이로 결제하기</button>
</form>
</body>
</html>