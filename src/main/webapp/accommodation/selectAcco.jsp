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
    text-align: center;
   	margin:0 auto;
}
input {
    width: 270px;
    border-radius: 20px;
    border: 1px solid pink;
    padding: 10px 12px;
}

#search{
	vertical-align: middle;
	background-color: rgba(255,255,255,1);
	background-image:url("../images/icons/searchIcon.png");
	background-size: cover;
	width : 40px;
	height: 40px;
	border : 1px solid pink;
	
}
#submit:hover {
	cursor: pointer;
}

#submit{
	display:inline-block;
	background-color:"white";
	background: url("../images/icons/searchIcon.png");
	background-repeat: no-repeat;
	width:40px;
	height: 40px;
	background-size: 100% 100%;
	vertical-align: middle;
}




</style> 
</head>
<body>
 	<div class="search">
 	<form action = "../accommodation/search.do">
      <input type="text" id = "check" name = "check" required="required" placeholder="체크인~체크아웃">
      <input type="text" id = "loc" name = "loc" required="required"placeholder="지역">
      <input type="number" id = "person" name = "person" required="required"placeholder="인원">
     	<input type = "submit" id = "submit" value ="">
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