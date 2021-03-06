<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/accommodation/selectAcco.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="/jsp/mainlogo.jsp" %>
    <%-- <c:set var="path" value="${pageContext.request.contextPath }"/> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">


<title>Insert title here</title>
<style type="text/css">
	body {
		margin: 0;
	}
	#backimg{

		background-image: url("${pageContext.request.contextPath}/images/back/미드.gif");

		background-repeat: no-repeat;
		background-size: cover;
		height: 100vh;
		width: 100%;
	}
	
	img {
		margin: 0;
		width: 100%;
		height: 100vh;
	}
	
	.img2 {
		margin-top: -5px;
	}

.search{
	position:fixed;
	text-align: center;
	left:24%;
	margin-top:7.3%;
}

#calendar{
	display:inline-block;
 	background-color: #fefefe;
 	margin: 0 auto;
  	padding: 20px;
	width: 30%;
	margin-top:1%;
}
#calendar2{
	display:inline-block;
 	background-color: #fefefe;
 	margin: 0 auto;
  	padding: 20px;
	width: 30%;
	margin-top:1%;
}

#lobster {
	position: fixed;
	text-align: center;
}


</style>
</head>
<body id="home">
	<div id="backimg">
		<div class="nav">
	            <ul class="nav-container">
	                <li class="nav-item">
	                    <a class="hiper" href="javascript:void(0)" onclick="scrolling(event,'#home')">
	                        Spring
	                        <i class="hiper2 hiper fa fa-leaf"></i>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="hiper" href="javascript:void(0)" onclick="scrolling(event,'#summer')">
	                        Summer
	                        <i class="hiper2 hiper fa fa-sun-o"></i>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="hiper" href="javascript:void(0)" onclick="scrolling(event,'#fall')">
	                        Autumn
	                        <i class="hiper2 hiper fa fa-envira"></i>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="hiper" href="javascript:void(0)" onclick="scrolling(event,'#winter')">
	                        Winter
	                        <i class="hiper2 hiper fa fa-snowflake-o "></i>
	                    </a>
	                </li>
	                <c:if test="${user == null }">
		                <li class="nav-item">
		                    <a class="hiper" href="/travel/user/login.jsp">
		                        Login
		                        <i class="hiper2 hiper fa fa-sign-in"></i>
		                    </a>
		                </li>
	                </c:if>
	                <c:if test="${user != null }">
		                <li class="nav-item">
		                <c:if test="${user.host == 0 }">
		                    <a class="hiper" href="/travel/user/myPageUser.jsp">
		                        My Page
		                        <i class="hiper2 hiper fa fa-user"></i>
		                    </a>
		                    </c:if>
		                     <c:if test="${user.host == 1 }">
		                    <a class="hiper" href="/travel/user/myPageHost.jsp">
		                        My Page
		                        <i class="hiper2 hiper fa fa-user"></i>
		                    </a>
		                    </c:if>
		                </li>
		                <li class="nav-item">
		                    <a class="hiper" href="/travel/user/logOut.do">
		                        LogOut
		                        <i class="hiper2 hiper fa fa-power-off"></i>
		                    </a>
		                </li>
	                </c:if>
	            </ul>
	        </div>
		
		<!-- <div class="search">
		 	<form action ="search.do" >
		      <input type="text" id = "check" name = "check" required="required">
		      <input type="text" name = "loc" required="required">
		      <input type="number" name = "person" required="required">
		      <input type = "submit" value = "" id = "search">
	      </form>
	    </div> -->
	</div>
	
	<!-- <p id="oswald"> Would you travel? </p>
	<p id="poppins"> Would you travel? </p>
	<p id="raleway"> Would you travel? </p> -->
	<!-- <p id="lobstertwo"> Would you travel? </p> -->

	<img id="summer" alt="" src="/travel/images/back/수영장.gif">
	<img id="fall" alt="" src="/travel/images/back/다즐링.gif" class="img2">
	<img id="winter" alt="" src="/travel/images/back/이터널선샤인.gif" class="img2">

	<script>
		function scrolling(evt, loc) {
	                var offset = $(loc).offset();
	                $('html, body').animate({
	                    scrollTop: offset.top
	                }, 800);
	            }
	
		
	</script>
</body>
</html>