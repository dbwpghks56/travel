<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation</title>
<script>
function count(type)  {
	  const resultElement = document.getElementById('result');
	  let num = resultElement.value;
	  if(type === 'plus') {
		  num = parseInt(num) + 1;
	  }else if(type === 'minus')  {
		  num = parseInt(num) - 1;
	    if(num<0){
	    	return;
	    }
	  }
	  resultElement.value = num;
	}
	
function nullCheck(){

}
	


</script>
</head>
<body>
	<h1>예약하기</h1>
	<form name="frm" action="reservation.do" method="post" onsubmit="nullCheck()">
	
		<label>숙소이름</label>
		${rsv.accommodation_name }<input type="hidden" name="aname" value="${rsv.accommodation_name }">
		
		<label>룸이름</label>
		${rsv.room_name } <input type="hidden" name="roomid" value="${rsv.rsv_no }">
		<input type="text" name="user_id" value="${user.user_id }" disabled="disabled" >
		
		<label>체크인</label> <input type="date" name="check_in" id="check_in" value="" required="required" ><br> 
		
		<label>체크아웃</label> <input type="date" name="check_out" id="check_out" value="" required="required" ><br>
		
		<label>인원</label> 
		<input type='button' onclick='count("minus")' value='-' /> 
		<input type="number" name="personnel" min="0" id="result" value="0" required="required" > 
		<!-- max="${room.max_personnel}" 넣으면 되지 않을까...? -->
		<input type='button' onclick='count("plus")' value='+' /><br>  
		
		<!-- <input type="number" name="personnel" min="0"> <br> -->
		
		<label>요청사항</label> <input type="text" name="request" placeholder="추가 요청사항을 입력해주세요"><br>
		
		<!-- <input type="text" value="status"> -->

		<input class="btn" type="submit" value="예약"> 
		<input class="btn" type="reset" value="취소">


	</form>
</body>
</html>