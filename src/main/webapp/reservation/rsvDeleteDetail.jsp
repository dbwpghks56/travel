<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 취소 상세</title>
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
	background-color: #FFE6E6;
}
table {
	margin-left: auto;
	margin-right: auto;
	width: 600px;
	height: 100px;
	border-top: 2px solid pink;
	border-bottom: 2.5px solid pink;
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
  width: 80px;
  height: 50px;
 /*  border: 0.5px solid #B1E8ED; */
  border: 0.5px solid #FFC0D3;
  font-size: 1em;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
   background-color: #FDEBF7;
  /* background-color: #E6F8F9; */
  font-weight: bold;
  
}
.btn:hover{
	 /*  border: 4px solid #B1E8ED; */
	  border: 4px solid #FFC0D3;
	 
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
.title {
	width: 500px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 4em;
	color: pink;
}
#delete{ border: 0.5px solid #B1E8ED;  background-color: #E6F8F9;}
#delete:hover{ border: 4px solid #B1E8ED;}
</style>
</head>
<body>
<h1 class="title">Cancellation Details</h1>
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
							<td  class="bold">요청사항</td>
							<td colspan="2" class="value">${rsvdelete.request} </td>
							</tr>	
							
						</table>	
						<div style="margin: 10px;">
						<input class="btn" type="button" value="목록" id="rsvList"> 
						<input class="btn" type="button" value="재예약" id="revisit" onclick="location.href='/travel/reservation/reservation.do?room_id=${rsvdelete.room_id }';">
						<form action="rsvcancellremove.do" method="post" style="display: inline;">
								<input type="hidden" name="d_rsv_no" value="${rsvdelete.d_rsv_no}">
								<input class="btn" type="submit" value="삭제" id="delete"> 
						</form>
						
</div>



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