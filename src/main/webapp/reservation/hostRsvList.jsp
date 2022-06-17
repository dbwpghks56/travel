<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/mainnav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<title>host가 등록한 숙소에 예약된 list</title>
<style>
body {
	clear: both;
	width: 100%;
	text-align: center;
}

h1 {
	clear: both;
}

table {
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	height: 100px;
	border-top: 3px solid pink;
	border-bottom: 3.5px solid pink;
}

td {
	border-collapse: collapse;
	padding: 10px;
}

tr:nth-child(odd) {
	background-color: #FFE6E6;
	color: black;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
		text-decoration: underline;	
	cursor: pointer;
	color: gray;
}

td:not(#font_small, #atag) {
	font-weight: bold;
}

.font_small {
	font-size: 12px;
	color: gray;
}

#atag {
	font-size: 14px;
	text-align: center;
}


.nav-item{font-family: 'Do Hyeon', sans-serif;}

.nav {
	width: 1200px;
	margin: auto;
}
#detail{ background-color: white;}
#detail:hover{background-color: #E6F8F9;}
.title {
clear: both;
	width: 500px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
	font-family: 'Lobster', cursive;
	text-shadow: 1px 1px 1px red;
	font-size: 4em;
	color: pink;
}

</style>
</head>
<body>

<div class="container mt-3">
<h1 class="title">Incoming Reservations List</h1> <br>

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#rsvlist">들어온 예약</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#rsvdeletelist">취소된 예약</a></li>
		</ul>

		<div class="tab-content">
			<div id="rsvlist" class="container tab-pane active">
				<br>
				<div class="d-flex flex-wrap justify-content-around mb-3">
				<c:forEach items="${hostrsvlist}" var="host">
					<div>
						<table class="p-2">
							<tr>
								<td class="font_small">예약번호</td>
								<td class="font_small">인원</td>
								<td rowspan="4"><a class="atag"
									href="hostrsvdetail.do?rsv_no=${host.rsv_no}">상세보기</a></td>
							</tr>
							<tr>
								<td>${host.rsv_no}</td>
								<td>${host.personnel}</td>
							</tr>
							<tr>
								<td class="font_small">체크인/체크아웃</td>
								<td class="font_small">유저번호</td>
							</tr>
							<tr>
								<td>${host.check_in}/ ${host.check_out}</td>
								<td>${host.user_phone}</td>
							</tr>
						</table>
						<br>
					</div>
					<br>
					<br>
				</c:forEach>
				</div>
			</div>
			<div id="rsvdeletelist" class="container tab-pane fade">
				<br> <br>
				<div class="d-flex flex-wrap justify-content-around mb-3">
				<c:forEach items="${hostrsvdeletelist }" var="delete">
					<div class="p-2">
						<table>
							<tr>
								<td>${delete.accommodation_name }</td>
								<td>${delete.room_name }</td>
							</tr>
							<tr class="hr">
								<td colspan="2">${delete.check_in}~ ${delete.check_out}</td>
							</tr>
							<tr>
								<td class="font_small">예약번호</td>
								<td class="font_small">금액</td>
							</tr>
							<tr>
								<td>${delete.d_rsv_no}</td>
								<td>${delete.totalprice}원</td>
							</tr>
							<tr>
								<td class="font_small">예약자 연락처</td>
								<td class="font_small">예약자 이름</td>
							</tr>
							<tr>
								<td>${delete.user_phone}</td>
								<td>${delete.user_name}</td>
							</tr>
						</table>
						<br>
					</div>
					<br>
					<br>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>