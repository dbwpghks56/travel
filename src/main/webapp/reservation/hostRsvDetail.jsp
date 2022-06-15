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
	width: 500px;
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
.textleft{
text-align: left;}
</style>
</head>
<body>
<h1>host가 등록한 숙소에 예약된 정보</h1>

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
							<tr>
							<td colspan="2"><input class="btn" type="button" value="목록" id="hostlist"></td>						
							</tr>	
						</table>	

</body>
</html>