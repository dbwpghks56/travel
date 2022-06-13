<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="searchCal.jsp"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
	* {
    box-sizing: border-box;
	}

.search {
    text-align: center;
    margin: 0 auto;
}
input {
    width: 20%;
    border-radius: 20px;
    border: 1px solid #bbb;
    margin: 10px 0;
    margin-top : 50px;
    padding: 10px 12px;
}

#search{
	background-color:white;
	background-image:url("../images/icons/searchIcon.png");
	background-size: cover;
	width : 40px;
	height: 40px;
	border : 0;
	
}
#search:hover {
	cursor: pointer;
}


</style> 
</head>
<body>
 	<div class="search">
 	<form action ="search.do" >
      <input type="text" id = "check" name = "check" required="required">
      <input type="text" name = "loc" required="required">
      <input type="number" name = "person" required="required">
      <input type = "submit" value = "" id = "search">
      </form>
    </div>
	<script>
		var check = document.querySelector("#check");
		var modalContainer = document.querySelector(".modal-container");
		var calendar = document.querySelector("#calendar");
		var calendar2 = document.querySelector("#calendar2");
		window.addEventListener('click', (e) => {
			if(e.target== check){
				modalContainer.style.display ='block';
			}else if(e.target ==calendar||e.target==calendar2){
				modalContainer.style.display ='block';
			}else if(e.target ==modalContainer){
				modalContainer.style.display='none';
			}
		});
	</script>
</body>
</html>