<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#hostlist").click(function(){
		location.href="hostlist.do"
	});
	

}); 
</script>
</head>
<body>
<h1>host가 등록한 숙소에 예약된 정보</h1>
<form action="hostrsvdetail.do" method="post">
예약번호 : ${host.rsv_no }<br>
유저이름: ${host.user_name}<br>
유저폰번: ${host.user_phone}<br>
숙소이름: ${host.accommodation_name }<br>
룸이름: ${host.room_name}<br>
인원: ${host.personnel}<br>
체크인/아웃 : ${host.check_in}/${host.check_out }<br>
예약상태 : ${host.rsv_status}<br>
요청사항 : ${host.request}<br>

<input class="btn" type="button" value="목록" id="hostlist"> <br>
</form>
</body>
</html>