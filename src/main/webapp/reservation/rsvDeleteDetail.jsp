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
})
</script>
</head>
<body>
<h1>예약 취소 상세보기</h1>
	<form action="rsvdeletedetail.do">
		예약번호 : ${rsvdelete.d_rsv_no}<input type="hidden" name="rsv_no" value="${rsvdelete.d_rsv_no}"> <br>
		숙소이름 : ${rsvdelete.accommodation_name }<input type="hidden" name="accommodation_name">  <br>
		룸이름 :  ${rsvdelete.room_name }<input type="hidden" name="room_name"> <br> 
		체크인 : ${rsvdelete.check_in}<input type="hidden" name="check_in"> <br>
		체크아웃 :${rsvdelete.check_out} <input type="hidden" name="chech_out">  <br>
		예약날짜 : ${rsvdelete.rsv_date}<br>
		금액 : ${rsvdelete.totalprice} <br>
		인원 : ${rsvdelete.personnel}<input type="hidden" name="personnel" >  <br>
		요청사항 :  <input type="text" value="${rsvdelete.request}" readonly="readonly">  <br>
		<input class="btn" type="button" value="목록" id="rsvList"> <br>
	</form>
	<form action="rsvcancellremove.do" method="post">
	<input type="hidden" name="d_rsv_no" value="${rsvdelete.d_rsv_no}">
	<input class="btn" type="submit" value="삭제" id="delete"> <br>
	</form>


</body>
</html>