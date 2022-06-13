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
    text-align: center;
	}

.search {
	display:inline-block;
	width:60%;
	height:40px;
	background-image:url("../images/icons/searchBar.png");
	background-size:100% 100px;
    text-align: center;
    margin: 0 auto;
}
#check {
	opacity:0;
    width: 25%;
    height:30px;
    border:none;
}
#loc{
opacity:0;
	width: 25%;
	height:30px;
     border:none;
}
#person{
opacity:0;
	width: 25%;
	height:30px;
	  border:none;
}

#search{
	width: 25%;
	
}
#search:hover {
	cursor: pointer;
}
#searchIcon{
	display:inline-block;
	margin-left:0;
	width : 40px;
	height: 40px;
	border : 0;
}



</style> 
</head>
<body>
 	<div class="search">
 	<form>
      <input type="text" id = "check" name = "check" required="required" placeholder="체크인~체크아웃">
      <input type="text" id = "loc" name = "loc" required="required"placeholder="지역">
      <input type="number" id = "person" name = "person" required="required"placeholder="인원">
     	<a href = "search.do"id = "searchIcon"></a>
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