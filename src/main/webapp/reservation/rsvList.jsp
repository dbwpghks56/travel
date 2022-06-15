<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/jsp/mainnav.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
<title>예약목록</title>
<script>
	$(() => {
		let rsv_no;
		let room_id;
		$(".reviewbtn").on("click", function() {
			$(".modal-title").html($(this).attr("data-name"));
			rsv_no = $(this).attr("data-no");
			room_id = $(this).attr("data-roomid");
			$.ajax({
				url : "/travel/review/confirmReview.do",
				data : {
					"rsv_no" : rsv_no,
				},
				type : "post",
				success : function(responseData) {
					//중복:1, 중복안됨:0
					if(responseData == 1) {
						
						alert("이미 리뷰를 작성한 예약입니다.");
						$(".btn-danger").click();
						
					}
				},
				fail : function() {
				}
			});
		});
		$("#goreview").click(function() {
			rsv_no
			room_id
			let user_id = $("#user_id").val();
			let clean = $("input[name=cleaning_stars]:checked").val();
			let location = $("input[name=location_stars]:checked").val();
			let sati = $("input[name=satisfied_stars]:checked").val();
			let content = $("#content").val();
			$.ajax({
				url : "/travel/review/insertReview.do",
				data : {
					"user_id" : user_id,
					"rsv_no" : rsv_no,
					"room_id" : room_id,
					"clean" : clean,
					"location" : location,
					"sati" : sati,
					"content" : content
				},
				type : "post",
				success : function(responseData) {
					//중복:1, 중복안됨:0
					alert(responseData == 1 ? "리뷰등록에 성공하였습니다." : "리뷰등록에 실패하였습니다.");
				},
				fail : function() {
				}
			});
		});
	});
</script>
<style>
body {
	width: 100%;
	margin: 0 auto;
	padding: 50px;
	text-align: center;
	clear: both;
}

table {
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	height: 100px;
	border-top: 3px solid gray;
	border-bottom: 3.5px solid gray;

}


table, td {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	}

td {

	border-collapse: collapse;
	padding: 10px;
}


tr:nth-child(odd) {
	background-color: #FFE6E6;
	color: black;
}
h1 {
	font-family: 'Pacifico', cursive;

}


h1 {
	font-family: 'Pacifico', cursive;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

td:not(#font_small, #atag) {
	font-weight: bold;
}

#font_small {
	font-size: 12px;
	text-align: left;
	color: black;
}

#atag {
	font-size: 14px;
	text-align: left;
}

.nav-tabs {
	width: 500px;
	margin: auto;
}

.reviewbtn {
	background-color: white;
	color: black;
	border: none;
}

.reviewbtn:hover {
	background-color: pink;
	border: none;
}
.modal-content {
	height: 500px;
}

	#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 2em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 pink;
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=cleaning_stars]:checked ~ label{
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=location_stars]:checked ~ label{
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=satisfied_stars]:checked ~ label{
	    text-shadow: 0 0 0 pink;
	}
	
	#thumbnail {
		width: 200px;
		height: 200px;
		display: none;
		border: 5px solid skyblue;
	}
	
	#content {
		width: 250px;
		height: 100px;
		resize: none;
	}
	
	#contentcontainer {
		margin-top: -15px;
	}
	
	h5 {
		margin-top: 5px;
	}

	.photowidth {
		width: 255px;
		margin: auto;
	}
	
	h6 {
		margin-left: 10px;
		margin-top: 10px;
	}
	
	#goreview, #goreview:hover {
		background-color: pink;
		border: none;
	}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
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
.hr{
	border-bottom: 1px solid gray;
}
#acconame{ color: black;}
#acconame:hover{ color: blue;}


</style>
</head>
<body>

<div class="container mt-3">
<h1>Reservation List</h1>

<br>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#rsvlist">예약목록</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#rsvdeletelist">예약취소목록</a></li>
		</ul>

		<div class="tab-content">
			<div id="rsvlist" class="container tab-pane active">
				<c:forEach items="${rsvlist }" var="rsv">
					<div>
						<table>
							<tr>
								<td><a id="acconame" href="accommodation/selectRoom.do?acco_name=${rsv.accommodation_name }&acco_id=1000">${rsv.accommodation_name }</a> </td>
								<td> ${rsv.room_name }</td>
							</tr>
							<tr class="hr">
								<td colspan="2">${rsv.check_in} ~  ${rsv.check_out}</td>
							</tr>
							<tr>
								<td class="font_small">예약일</td>
								<td class="font_small">예약번호</td>
							</tr>
							<tr class="hr">
								<td> ${rsv.rsv_date}</td>
								<td> ${rsv.rsv_no}</td>
							</tr>
							<tr>
								<td class="font_small">상태</td>
								<td class="font_small">금액</td>
							</tr>
							<tr class="hr">
								<td> ${rsv.rsv_status}</td>
								<td> ${rsv.totalprice}원</td>
							</tr>
							<tr>
								<td id="atag"><a href="rsvdetail.do?rsv_no=${rsv.rsv_no}">상세보기</a></td>
								<td id="atag">
									<a class="btn btn-primary reviewbtn" data-toggle="modal" data-target="#myModal" 
									data-no="${rsv.rsv_no}" data-name="${rsv.accommodation_name }" data-roomid="${rsv.room_id }">
										리뷰작성
									</a>
								</td>

							</tr>
						</table>
					</div>
					<br>
					<br>
	</c:forEach> 
			</div>

			<div id="rsvdeletelist" class="container tab-pane fade">
				<br> <br>
				<c:forEach items="${rsvdeletelist }" var="delete">
					<div>
						<table>
							<tr>
								<td>${delete.accommodation_name }</td>
								<td>${delete.room_name }</td>
							</tr>
							<tr>
								<td colspan="2">${delete.check_in}~${delete.check_out}</td>
							</tr>
							<tr>
								<td id="font_small">예약일</td>
								<td id="font_small">예약번호</td>
							</tr>
							<tr>
								<td>${delete.rsv_date}</td>
								<td>${delete.d_rsv_no}</td>
							</tr>
							<tr>
								<td id="font_small" colspan="2">금액</td>
							</tr>
							<tr>
								<td>${delete.totalprice}원</td>
							</tr>
							<tr>
								<td id="atag" colspan="2"><a
									href="rsvdeletedetail.do?d_rsv_no=${delete.d_rsv_no}">상세보기</a></td>
							</tr>
						</table>
					</div>
					<br>
					<br>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<h6>리뷰쓰기</h6>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<h5 class="modal-nick">${user.nickname }</h5>
					<input type="hidden" name="user_id" value="${user.user_id }" id="user_id"> <br>
					<input type="hidden" name="rsv_no" id="rsv_no">
					<input type="hidden" name="room_id" id="room_id">
					<div id="contentcontainer">
						<textarea rows="" cols="" name="content" id="content" required="required"></textarea>
					</div>
					<div id="myform">
						깔끔별점 :
						<fieldset>
							<input type="radio" name="cleaning_stars" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="cleaning_stars" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="cleaning_stars" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="cleaning_stars" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="cleaning_stars" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset> <br>
						위치별점 : 
						<fieldset>
							<input type="radio" name="location_stars" value="5" id="rate6"><label
								for="rate6">★</label>
							<input type="radio" name="location_stars" value="4" id="rate7"><label
								for="rate7">★</label>
							<input type="radio" name="location_stars" value="3" id="rate8"><label
								for="rate8">★</label>
							<input type="radio" name="location_stars" value="2" id="rate9"><label
								for="rate9">★</label>
							<input type="radio" name="location_stars" value="1" id="rate10"><label
								for="rate10">★</label>
						</fieldset>  <br>
						안전별점 : 
						<fieldset>
							<input type="radio" name="satisfied_stars" value="5" id="rate11"><label
								for="rate11">★</label>
							<input type="radio" name="satisfied_stars" value="4" id="rate12"><label
								for="rate12">★</label>
							<input type="radio" name="satisfied_stars" value="3" id="rate13"><label
								for="rate13">★</label>
							<input type="radio" name="satisfied_stars" value="2" id="rate14"><label
								for="rate14">★</label>
							<input type="radio" name="satisfied_stars" value="1" id="rate15"><label
								for="rate15">★</label>
						</fieldset>
					 <c:forEach items="${rsvdeletelist }" var="delete"> 
						<div>
							<table>
								<tr>
									<td> ${delete.accommodation_name }</td>
									<td> ${delete.room_name }</td>
								</tr>
								<tr class="hr">
									<td colspan="2"> ${delete.check_in}~ ${delete.check_out}</td>
								</tr>
								<tr >
									<td id="font_small">예약일</td>
									<td id="font_small">예약번호</td>
								</tr>
								<tr>
									<td> ${delete.rsv_date}</td>
									<td> ${delete.d_rsv_no}</td>
								</tr>
								<tr>
									<td id="font_small">금액</td>
									<td id="atag" rowspan="2"><a
										href="rsvdeletedetail.do?d_rsv_no=${delete.d_rsv_no}">상세보기</a></td>
								</tr>
								<tr>
									<td>${delete.totalprice}원</td>
								</tr>
							</table>
						</div>
						<br>
						<br>
				</c:forEach> 
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="goreview">리뷰 쓰기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>













