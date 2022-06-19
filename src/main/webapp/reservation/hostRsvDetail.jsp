<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/jsp/mainnav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<title>예약자 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#hostlist").click(function(){
		location.href="hostlist.do"
	});
	

}); 
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
	width:600px;
	height: 100px;
	border-top: 2px solid pink;
	border-bottom: 2.5px solid pink;
}
td {
	border-collapse: collapse;
	padding: 10px;
}

.btn{
  width: 80px;
  height: 50px;
  border: 0.5px solid #B1E8ED;
  font-size: 1em;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
   background-color: #E6F8F9;
  font-weight: bold;
  justify-content: center;
  margin-top: 10px;
  
}
.btn:hover{
	  border: 4px solid #B1E8ED;
	 
}
.bold{
font-weight: bold; 
}
.textleft{
text-align: left;}
.title {
clear: both;
	width: 500px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 4em;
	color: pink;
}
</style>
</head>
<body>
<h1 class="title">Booker Information</h1>
<br>
<table>					
							<tr>
							<td class="bold">예약번호</td>
							<td class="textleft"> ${host.rsv_no }</td>
							</tr>
							<tr>
								<td class="bold">예약자 이름</td>
								<td class="textleft">${host.user_name}</td>
							</tr>
							<tr>
								<td class="bold">예약자 핸드폰 번호</td>
								<td class="textleft">${host.user_phone}</td>
							</tr>
							<tr>
								<td class="bold">숙소이름</td>
								<td class="textleft">${host.accommodation_name }</td>
							</tr>
							<tr>
								<td class="bold">룸이름</td>
								<td class="textleft">${host.room_name}</td>
							</tr>
							<tr>
								<td class="bold">체크인 ~ 체크아웃</td>
								<td class="textleft">${host.check_in} ~ ${host.check_out }</td>
								
							</tr>
							<tr>
								<td class="bold">상태</td>
								<td class="bold">인원</td>
							</tr>
							<tr class="hr">
								<td>${host.rsv_status}</td>
								<td> ${host.personnel}</td>
								
							</tr>	
							<tr>
							<td class="bold">요청사항</td>
							<td class="textleft"> ${host.request}</td>
							</tr>
					<!-- 		<tr>
							<td colspan="2"><input class="btn" type="button" value="목록" id="hostlist"></td>						
							</tr> -->	
						</table>
						<input class="btn" type="button" value="목록" id="hostlist">	

</body>
</html>