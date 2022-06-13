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
	
	$("#delete").click(function(){
		var cf = confirm("예약을 취소하시겠습니까?");
		if(!cf){
			return false;
		}else{
			return;
		}
	});

	$("#ajaxbtn").click(function(){
		$.ajax({
			type:"POST",
			url:"rsvdetail.do",
			data:{"rsv_no":$(this).attr("data-no"),
				"request":$("#request").val()},
			dataType:"text",
			success:function(data){
				if(data==0)
				{alert("요청사항을 다시 입력해주세요");}
				else{alert("요청사항이 수정 되었습니다");}
								
			},
			error:function(data){
			
				
			}
		})
	})

}); 
</script>
</head>
<body>
<h1>예약 내용 상세보기</h1>
	<form action="rsvdetail.do" method="post">
		예약번호 : ${rsv.rsv_no}<input type="hidden" name="rsv_no" value="${rsv.rsv_no}"> <br>
		숙소이름 : ${rsv.accommodation_name }<input type="hidden" name="accommodation_name">  <br>
		룸이름 :  ${rsv.room_name }<input type="hidden" name="room_name"> <br> 
		체크인 : ${rsv.check_in}<input type="hidden" name="check_in"> <br>
		체크아웃 :${rsv.check_out} <input type="hidden" name="chech_out">  <br>
		예약날짜 : ${rsv.rsv_date}<br>
		예약상태 : ${rsv.rsv_status}<br>
		금액 : ${rsv.totalprice} <br>
		인원 : ${rsv.personnel}<input type="hidden" name="personnel" >  <br>
		요청사항 : <input type="text" name="request" value="${rsv.request}" id="request">  <br>
		<input class="btn" type="button" value="목록" id="rsvList"> <br>
		<input class="btn" type="submit" value="수정" id="ajaxbtn" data-no="${rsv.rsv_no}">
	</form>
	<form action="rsvdelete.do" method="post">
		<input type="hidden" name="rsv_no" value="${rsv.rsv_no}">
		<input type="submit" value="예약취소" id="delete"> 
	</form>


</body>
</html>