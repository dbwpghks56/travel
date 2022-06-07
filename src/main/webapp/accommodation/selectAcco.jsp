<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    position: relative;
    text-align: center;
    margin: 0 auto;
}
input {
    width: 30%;
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
      <input type="date" name = "check_in" required="required">
      <input type="date" name = "check_out" required="required">
      <input type = "submit" value = "" id = "search">
      </form>
    </div>


</body>
</html>