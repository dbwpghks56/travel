<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="searchCal.jsp"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {
    box-sizing: border-box;
	}

.search {
	display:inline-block;
	width:60%;
	height:40px;
    text-align: center;
    margin: 0 auto;
}
#check {
    width: 25%;
    height:30px;
    border:none;
}
#loc{
	width: 25%;
	height:30px;
     border:none;
}
#person{
	width: 25%;
	height:30px;
	  border:none;
}

#search:hover {
	cursor: pointer;
}




</style> 
</head>
<body>
 	<div class="search">
 	<form action = "search.do">
      <input type="text" id = "check" name = "check" required="required" placeholder="체크인~체크아웃">
      <input type="text" id = "loc" name = "loc" required="required"placeholder="지역">
      <input type="number" id = "person" name = "person" required="required"placeholder="인원">
     	<input type = "submit">
     </form>
    </div>
	<script>
		var check = document.querySelector("#check");
		var modalContainer = document.querySelector(".modal-container");
		var calendar = document.querySelector("#calendar");
		var calendar2 = document.querySelector("#calendar2");
		 window.addEventListener('click', (e) => {
			if(e.target== check){
				modalContainer.style.visibility ='visible';
			}else if(e.target ==calendar||e.target==calendar2){
				modalContainer.style.visibility ='visible';
			}else if(e.target ==modalContainer){
				modalContainer.style.visibility='hidden';
			}
		}) ;
	</script>
</body>
</html>