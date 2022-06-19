<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="mainlogo.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(() => {
		$("#drops").on("click", function() {
			if($("#dropsitem").css("visibility") == "hidden") {
				$("#dropsitem").css("visibility", "visible");
			}
		
			else if($("#dropsitem").css("visibility") == "visible") {
				$("#dropsitem").css("visibility", "hidden");
			}
			
		});

	});
</script>
<style type="text/css">
	#lobster {
		margin-top: 12px;
		margin-left: 20px;
		position: inherit;
		float: left;
		font-size: 3em;
	}
	
	#dropsitem {
		margin-right: 20px;
		visibility: hidden;
		position: relative;
		z-index: 99;
		background-color: white;
		box-shadow: 0px 0.5px 5px gray;
		border-radius: 10px;
		list-style: none;
		width: 150px;
		padding-left: 0px;
	}
	
	.runa {
		color: black;
		text-decoration: none;
		text-align: center;
	}
	
	#dropsitem li {
		margin-bottom: 10px;
	}
	#dropscontainer#dropscontainer {
		float: right;
		margin-right: 20px;
		margin-bottom: -300px;
	}
	
	#drops#drops {
		margin-top: 16px;
		width: 150px;
		height: 52px;
		background-color: white;
		border: 1px solid pink;
		padding-top: 10px;
		border-radius: 8px;
	}
	
	#drops:hover {
		cursor: pointer;
		box-shadow: 0px 0.5px 5px gray;
	}
	
	
	#hambuger {
		margin-right: 20px;
		margin-left: 18px;
		font-size: 2.2em;
	}
	
	.profile.profile {
		display: inline-block;
		width: 50px;
		height: 50px;
		font-size: 2.2em;
	}
	
	img.profile {
		border: 2px solid pink;
		border-radius: 80%;
		margin-top: -18px;
		width: 40px;
		height: 40px;
	}
	
	#dropdis {
		text-align: center;
		height: 100%;
	}
	
	
	#dropsitem li {
		padding-left: 45px;
	}
	
	#dropsitem li:hover {
		background-color: #DFDFDE;
		border-radius: 5px;
	}

	.devideli {
		border-top: 1px solid black;
		width: 150px;
		margin-left: -45px;
	}
	
</style>
</head>
<body>
	<!-- <img id="airbnb" height="50" width="50" src="https://cdn.jsdelivr.net/npm/simple-icons@v6/icons/yourtraveldottv.svg" /> -->
	<div id="dropscontainer">
	  <button type="button" id="drops">
	  	<div id="dropdis">
		    <i class="fa fa-bars" aria-hidden="true" id="hambuger"></i>
		    <c:if test="${user == null }">
	    		<i class="fa fa-user-circle-o profile" aria-hidden="true"></i>
		    </c:if>
		    <c:if test="${user != null }">
		    	<c:if test="${user.u_image_path == null }">
		    		<i class="fa fa-user-circle-o profile" aria-hidden="true"></i>
			    </c:if>
			    <c:if test="${user.u_image_path != null }">
	    			<img class="profile" alt="" src="/travel/uploads/${user.u_image_path }">
		    	</c:if>
		    </c:if>
	    </div>
	  </button>
	  
	    <ul id="dropsitem">
	  	<li><a class="runa" href="/travel/accommodation/listRoomInquiry.do">1:1 문의</a></li>
	  	<li><a class="runa" href="/travel/reservation/rsvlist.do">예약조회</a></li>
	  	<li><a class="runa" href="/travel/user/userUpdate.do">개인 정보 조회</a></li>
	  	<li><a class="runa" href="/travel/user/siteInquiry.do">고객센터</a></li>
	  	<li><a class="runa" href="/travel/review/listReview.do">리뷰관리</a></li>
	  	<li><a class="runa" href="#">회원 탈퇴</a></li>
	  	<li><a class="runa" href="/travel/user/logOut.do">로그아웃</a></li>
	  	<li><div class="devideli"></div></li>
	  	<c:if test="${user.host == 0 }">
	  		<li>
				<a class="runa" href="/travel/user/userUpdate.do">호스트 되기</a>
			</li>
		</c:if>
		<c:if test="${user.host == 1 }">
			<li>
				<a class="runa" href="/travel/accommodation/insertAcco.jsp">숙소 등록</a>
			</li>
			<li>
				<a class="runa" href="/travel/reservation/hostlist.do">예약 현황</a>
			</li>
			<li>
				<a class="runa" href="/travel/user/selectAccoHost.do">숙소 관리</a>
			</li>
		</c:if>
	  </ul> 
	</div>
	
</body>
</html>




















