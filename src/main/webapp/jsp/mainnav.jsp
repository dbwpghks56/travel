<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="mainlogo.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#lobster {
		margin-top: 12px;
		position: inherit;
		float: left;
		margin-left: 8%;
		font-size: 3em;
	}
	
	#airbnb {
		filter: invert(47%) sepia(78%) saturate(2266%) hue-rotate(325deg) brightness(110%) contrast(118%);
		margin-top: 12px;
		margin-left: -19%;
	}
	
	.btn2 {
		background-color: white;
		color: white;
	}
	
	.btn2:hover, .btn2:enabled {
		background-color: white;
		color: white;
		box-shadow: none;
	}
	
	.fa-user-circle-o, .fa-bars  {
		color: black;
	}
	
	
	.fa-user-circle-o {
		font-size: 3em;
		margin-left: 15px;
		color: gray;
		margin-right: -9px;
	}
	
	#profile {
		border: 2px solid pink;
		border-radius: 80%;
		margin-left: 15px;
		margin-right: 15px;
	}
	
	.dropdown {
		margin-top: 12px;
		margin-right: 15px;
		float: right;
		display: inline-block;
		border: 2px solid pink;
		padding-left: 15px;
		padding-right: 10px;
		border-radius: 10px;
	}
	
	.dropdown-menu {
		border: none;
		box-shadow: 0px 0.5px 5px gray;
	}

	
</style>
</head>
<body>
	<!-- <img id="airbnb" height="50" width="50" src="https://cdn.jsdelivr.net/npm/simple-icons@v6/icons/yourtraveldottv.svg" /> -->
	<div class="dropdown">
	  <button type="button" class="btn btn2" data-bs-toggle="dropdown">
	    <i class="fa fa-bars" aria-hidden="true"></i>
	    <c:if test="${user == null }">
    		<i class="fa fa-user-circle-o" aria-hidden="true"></i>
	    </c:if>
	    <c:if test="${user != null }">
    		<img id="profile" alt="" src="/travel/uploads/${user.u_image_path }" width="50" height="50">
	    </c:if>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a class="dropdown-item" href="#">Link 1</a></li>
	    <li><a class="dropdown-item" href="#">Link 2</a></li>
	    <li><a class="dropdown-item" href="#">Link 3</a></li>
	  </ul>
	</div>
</body>
</html>