<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin:0 auto;
	text-align: center;
}
input {
	display:inline-block;
    width: 270px;
    border-radius: 20px;
    border: 1px solid pink;
    padding: 10px 12px;
}

#search{
	vertical-align: middle;
	background-color: rgba(255,255,255,0.8);
	background-image:url("/images/icons/searchIcon.png");
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
	background: url("/travel/images/icons/searchIcon.png");
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

 	<form action = "/travel/accommodation/search.do">
 	<c:choose>
 	<c:when test="${check_in ne null}">
 	<input type="text" id = "check" name = "check" required="required" value="${check_in }~${check_out}" autocomplete="off">
      <input type="text" id = "loc" name = "loc" required="required"value="${loc }"autocomplete="off">
      <input type="number" id = "person" name = "person" required="required"value="${person }"autocomplete="off">
     	<input type = "submit" id = "submit" value ="">
 	</c:when>
 	<c:otherwise>
 	<input type="text" id = "check" name = "check" required="required" placeholder="체크인~체크아웃" autocomplete="off">
      <input type="text" id = "loc" name = "loc" required="required"placeholder="지역"autocomplete="off">
      <input type="number" id = "person" name = "person" required="required"placeholder="인원"autocomplete="off">
     	<input type = "submit" id = "submit" value ="">
 	</c:otherwise>
 	</c:choose>

      
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