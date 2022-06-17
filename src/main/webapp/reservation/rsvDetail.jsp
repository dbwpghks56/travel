<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ include file="/jsp/mainnav.jsp"%>
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
	
	$("#delete").click(function(){
		var cf = confirm("예약을 취소하시겠습니까?");
		if(!cf){	
			return false;
		}else{
			return ;
		}
	});

	$("#updatebtn").click(function(){
		$.ajax({
			type:"POST",
			url:"rsvdetail.do",
			data:{"rsv_no":$(this).attr("data-no"),
				"request":$("#request").val()},
			dataType:"text",
			success:function(data){
				if(data==0)
				{alert("요청사항 변경 기간이 지났습니다");}
				else{alert("요청사항이 수정 되었습니다");}
								
			},
			error:function(data){
			
				
			}
		})
	})

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
textarea {
border-radius : 8px;
	width: 95%;
	height: 6.25em;
    resize: none;
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
  
}
.btn:hover{
	 border: 4px solid #B1E8ED;
	 
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
/* .btnlist{
padding-left: 50px;
}
.btndelete{

} */
#revisit{
color : blue;
font-size: 0.9em;
}
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
#updatebtn, #rsvList{
 background-color: #FDEBF7;
 border: 0.5px solid #FFC0D3;
}
#updatebtn:hover, #rsvList:hover{ border: 4px solid #FFC0D3;}
</style>
</head>
<body>
<h1 class="title">Reservation Details</h1>	
<br>
<table>					
							<tr>
							<td class="bold">예약번호</td>
							<td class="value"> ${rsv.rsv_no}</td>
							<td > <a class="atag" href="reservation.do?room_id=${rsv.room_id }" id="revisit">재방문하기</a> </td>
							</tr>
							<tr>
								<td class="bold">숙소이름</td>
								<td class="value">${rsv.accommodation_name }</td>
							</tr>
							<tr>
								<td class="bold">방이름</td>
								<td class="value">${rsv.room_name }</td>
							</tr>
							<tr>
								<td class="bold">주소</td>
								<td class="value">${rsv.address }</td>
							</tr>
							<tr>
								<td class="bold">번호</td>
								<td class="value">${rsv.phone }</td>
							</tr>
							<tr>
								<td class="bold">체크인 ~ 체크아웃</td>
								<td class="value" colspan="2">${rsv.check_in} ~  ${rsv.check_out}</td>
								
							</tr>
							<tr>
								<td class="bold">총 금액</td>
								<td class="bold">예약일</td>
								<td class="bold">상태</td>
							</tr>
							<tr class="hr">
							<td> ${rsv.totalprice}원</td>
								<td> ${rsv.rsv_date}</td>
								<td> ${rsv.rsv_status}</td>
							</tr>	
							<tr>
							<td class="bold">요청사항</td>
							<td class="value" colspan="4"><textarea id="request" name="request">${rsv.request}</textarea> </td>
				<%-- 			</tr>	
							<tr id="requestTR" >
							<td colspan="4"> <textarea id="request" name="request">${rsv.request}</textarea> </td>
							</tr> --%>		
						</table>
					<div style="margin: 10px;">
							<input class="btn" type="button" value="목록" id="rsvList">
							<input class="btn" type="submit" value="수정" id="updatebtn" data-no="${rsv.rsv_no}">
							<form action="rsvdelete.do" method="post" style="display: inline;">
							<input type="hidden" name="rsv_no" value="${rsv.rsv_no}">
							<input type="submit" value="예약취소" id="delete" class="btn"> 
							</form>
</div>
</body>
</html>