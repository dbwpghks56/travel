<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file ="../accommodation/selectAcco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/main.css">
<title>Insert title here</title>
<style type="text/css">
	body {
		margin: 0;
	}
	#backimg{
		background-image: url("../images/back/미드.gif");
		background-repeat: no-repeat;
		background-size: cover;
		height: 100vh;
		width: 100%;
	}
	
	p{
		margin-top: 10px;
		position: fixed;
		font-size: 4em;
		left: 35.5%;
		color: #FFE6E6;
		text-shadow: 1px 1px 1px red;
		text-align: center;
		z-index: 1;
	}

	#lobster {
		font-family: 'Lobster', cursive;		
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
	position: fixed;
	margin-left: 22%;
   	margin-top: 7.3%;
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
	                <li class="nav-item">
	                    <a class="hiper" href="../user/login.jsp">
	                        Login
	                        <i class="hiper2 hiper fa fa-sign-in"></i>
	                    </a>
	                </li>
	            </ul>
	        </div>
		<p id="lobster"> Would you travel?</p>
		
	</div>
	
	<!-- <p id="oswald"> Would you travel? </p>
	<p id="poppins"> Would you travel? </p>
	<p id="raleway"> Would you travel? </p> -->
	<!-- <p id="lobstertwo"> Would you travel? </p> -->
	<img id="summer" alt="" src="../images/back/수영장.gif">
	<img id="fall" alt="" src="../images/back/다즐링.gif" class="img2">
	<img id="winter" alt="" src="../images/back/이터널선샤인.gif" class="img2">
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