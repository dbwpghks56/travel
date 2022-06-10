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
		<%-- ${ }  --%>
		<!-- <input type="hidden" name="accno" value=""> <br>  -->
		
		<label>룸이름</label>
		<%-- ${ }  --%>
		<!-- <input type="hidden" name="rno" value=""> <br> -->
		<input type="text" name="user_id" value="${user.user_id }" disabled="disabled" >
		<input type="hidden" name="room_id" value="${param.room_id }"><br>
		
		<label>체크인</label> <input type="date" name="check_in" id="check_in" ><br> 
		
		<label>체크아웃</label> <input type="date" name="check_out" id="check_out" ><br>
		
		<label>인원</label> 
		<input type='button' onclick='count("minus")' value='-' /> 
		<input type="number" name="personnel" min="1" id="result" value="0" readonly="readonly"> 
		<!-- max="${room.max_personnel}" 넣으면 되지 않을까...? -->
		<input type='button' onclick='count("plus")' value='+' /><br>  
		
		<!-- <input type="number" name="personnel" min="0"> <br> -->
		
		<label>요청사항</label> <input type="text" name="request" placeholder="추가 요청사항을 입력해주세요"><br>
		
		<!-- <input type="text" value="status"> -->

		<input class="btn" type="submit" value="예약"> 
		<input class="btn" type="reset" value="취소">


	</form>
	<script>
		document.querySelector(".submit").onclick = function(){
			 var room_id = ${param.room_id};
	    	   $.ajax({
	             type:"post",
	             async:false, 
	             url:"reservation.do",
	             data : {"room_id": room_id},
	             success:function (data,textStatus){
	            	 alert(data);
	             }
		     });
		};
	</script>
</body>
</html>