<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#rsvList").click(function(){
		location.href="rsvlist.do"
	});
}); 
</script>
</head>
<body>
<h1>예약 내용 상세보기</h1>
	<form action="rsvdetail.do" method="post">
		예약번호 : ${rsv.rsv_no}<input type="hidden" name="rsv_no" value="${rsv.rsv_no}"> <br>
		호텔이름 : <input type="hidden" name="accommodation_name" >  <br>
		룸이름 :<input type="hidden" name="room_name" > <br> 
		체크인 : ${rsv.check_in}<input type="hidden" name="check_in"> <br>
		체크아웃 :${rsv.check_out} <input type="hidden" name="chech_out">  <br>
		인원 : ${rsv.personnel}<input type="hidden" name="personnel" >  <br>
		요청사항 : <input type="text" name="request" value="${rsv.request}" >  <br>
		<input class="btn" type="button" value="목록" id="rsvList"> <br>
		<input class="btn" type="submit" value="수정">
	</form>
	<form action="rsvdelete.do" method="post">
		<input type="hidden" name="rsv_no" value="${rsv.rsv_no}">
		<input type="submit" value="삭제">
	</form>


</body>
</html>