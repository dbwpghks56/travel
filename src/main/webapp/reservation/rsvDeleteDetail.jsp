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
<style>
body {
	width: 100%;
	margin: 0 auto;
	padding: 50px;
	text-align: center;
}
table {
	margin-left: auto;
	margin-right: auto;
	width: 600px;
	height: 100px;
	border-top: 3px solid gray;
	border-bottom: 3.5px solid gray;
}
td {
	border-collapse: collapse;
	padding: 10px;
}
textarea {
	width: 95%;
	height: 6.25em;
    resize: none;
}
.btn{
  width: 100px;
  height: 50px;
  border: none;
  font-size: 1.25em;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
}
.btn:hover{
	border: 2px solid black;
}
.bold{
font-weight: bold; 
}
.atag{
text-decoration: none;
}
.atag:hover{
text-decoration: underline;

}
.value{
text-align: left;
}
</style>
</head>
<body>
<h1>예약 취소 상세보기</h1>
<table>			
							<tr>
							<td class="bold">예약번호</td>
							<td colspan="2" class="value">  ${rsvdelete.d_rsv_no}</td>
							</tr>
							<tr>
								<td class="bold">숙소이름</td>
								<td colspan="2" class="value">${rsvdelete.accommodation_name}</td>
							</tr>
							<tr>
								<td class="bold">룸이름</td>
								<td colspan="2" class="value">${rsvdelete.room_name }</td>
							</tr>
							<tr>
								<td class="bold">숙소주소</td>
								<td colspan="2" class="value">${rsvdelete.address }</td>
							</tr>
							<tr>
								<td class="bold">숙소번호</td>
								<td colspan="2" class="value">${rsvdelete.phone }</td>
							</tr>
							<tr>
								<td class="bold">체크인 ~ 체크아웃</td>
								<td colspan="2" class="value">${rsvdelete.check_in} ~  ${rsvdelete.check_out}</td>
								
							</tr>
							<tr>
								<td class="bold">총 금액</td>
								<td class="bold">예약일</td>
								<td class="bold">인원</td>
							</tr>
							<tr class="hr">
								<td> ${rsvdelete.totalprice}원</td>
								<td> ${rsvdelete.rsv_date}</td>
								<td> ${rsvdelete.personnel}</td>
							</tr>	
							<tr>
							<td colspan="2" class="bold">요청사항</td>
							<td rowspan="2"><a class="atag" href="reservation/reservation.do?room_id=">다시예약하기</a></td>
							</tr>	
							<tr id="requestTR" >
							<td colspan="2">${rsvdelete.request} </td>
							</tr>	
							<tr>
							<td><input class="btn" type="button" value="목록" id="rsvList"> </td>
							<td></td>
							<td >
							<form action="rsvcancellremove.do" method="post">
								<input type="hidden" name="d_rsv_no" value="${rsvdelete.d_rsv_no}">
								<input class="btn" type="submit" value="삭제" id="delete"> <br>
							</form>
							</td>						
							</tr>	
						</table>	




<%-- 		예약번호 : ${rsvdelete.d_rsv_no}<input type="hidden" name="rsv_no" value="${rsvdelete.d_rsv_no}"> <br>
		숙소이름 : ${rsvdelete.accommodation_name}<input type="hidden" name="accommodation_name">  <br>
		룸이름 :  ${rsvdelete.room_name }<input type="hidden" name="room_name"> <br> 
		체크인 : ${rsvdelete.check_in}<input type="hidden" name="check_in"> <br>
		체크아웃 :${rsvdelete.check_out} <input type="hidden" name="chech_out">  <br>
		예약날짜 : ${rsvdelete.rsv_date}<br>
		금액 : ${rsvdelete.totalprice} <br>
		인원 : ${rsvdelete.personnel}<input type="hidden" name="personnel" >  <br>
		요청사항 :  <input type="text" value="${rsvdelete.request}" readonly="readonly">  <br>
		<input class="btn" type="button" value="목록" id="rsvList"> 
	
	
	<form action="rsvcancellremove.do" method="post">
	<input type="hidden" name="d_rsv_no" value="${rsvdelete.d_rsv_no}">
	<input class="btn" type="submit" value="삭제" id="delete"> <br>
	</form> --%>
	


</body>
</html>