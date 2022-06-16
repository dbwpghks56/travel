<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/jsp/mainnav.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script type="text/javascript">
	$(() => {
		$(".reviewbtn").on("click", function() {
			let rid = $(this).attr("data-rid");
			$.ajax({
				url : "/travel/accommodation/deleteRinquiry.do",
				data : {
					"r_id" : rid,
				},
				type : "post",
				success : function(responseData) {
					//중복:1, 중복안됨:0
					if(responseData == 1) {
						alert("삭제를 완료했습니다.");
						window.location.reload();
					} else {
						alert("삭제에 실패했습니다.")
					}
				},
				fail : function() {
				}
			});
		});
	});
</script>
<style>
body {
	
	clear: both;
}
table {
	margin-left: auto;
	margin-right: auto;
	width: 500px;
	height: 100px;
}
table, td {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
}
tr:nth-child(odd) {
	background-color: #FFE6E6;
	color: black;
}


h1 {
	text-align: center;
	font-family: 'Lobster', cursive;	
	clear: both;
}


a {
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: none;
	color: black;
	cursor: pointer;
}
td:not(#font_small, #atag) {
	font-weight: bold;
}

#atag {
	font-size: 14px;
	text-align: left;
}
.nav-tabs {
	width: 500px;
	margin: auto;
}
.reviewbtn, .reviewbtn2 {
	background-color: white;
	color: black;
	border: none;
}
.reviewbtn:hover, .reviewbtn2:hover {
	background-color: pink;
	border: none;
}
.modal-content {
	text-align:center;
	height: 500px;
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

td:not(.font_small, #atag) {
	font-weight: bold;
}

.font_small {
	font-size: 12px;
	text-align:center;
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
#totalpricetext{text-align: center;}
.nav-item{font-family: 'Do Hyeon', sans-serif;}

#wholecontainer {
	clear: both;
}
</style>
</head>
<body>
	<div id="wholecontainer">
	<div class="container mt-3">
		<h1>Inquiry List</h1>
		<br>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#rinquirylist">방 문의</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#answerlist">답변 받은 문의</a></li>
			<c:if test="${user.host == 1 }">
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#hostlist">내게 온 문의</a></li>
			</c:if>
		</ul>

		<div class="tab-content">
			<div id="rinquirylist" class="container tab-pane active">
				<br>
				<c:forEach items="${rinquirylist }" var="inquiry" varStatus="status">
					<div>
						<table>
							<tr>
								<td id="font_small">호스트</td>
								<td id="font_small">제목</td>
							</tr>
							<tr>
								<td>${nicks.get(status.index)}</td>
								<td>${inquiry.title}</td>
							</tr>
							<tr>
								<td colspan="2" id="font_small">내용</td>
							</tr>
							<tr>
								<td colspan="2">${inquiry.content}</td>

							</tr>
							<tr>
								<td id="atag"><a class="btn btn-primary reviewbtn">
										숙소로 가기
									</a></td>
								<td id="atag">
									<a class="btn btn-primary reviewbtn" data-rid="${inquiry.r_inquiry_id }">
										문의 삭제
									</a>
								</td>
							</tr>
						</table>
					</div>
					<br>
					<br>
				</c:forEach>
			</div>

			<div id="answerlist" class="container tab-pane fade">
				<br> <br>
				<c:forEach items="${arinquirylist }" var="answer" varStatus="status">
					<div>
						<table>
							<tr>
								<td id="font_small">호스트</td>
								<td id="font_small">제목</td>
							</tr>
							<tr>
								<td>${anicks.get(status.index)}</td>
								<td>${answer.title}</td>
							</tr>
							<tr>
								<td colspan="2" id="font_small">내용</td>
							</tr>
							<tr>
								<td colspan="2">${answer.content}</td>

							</tr>
							<tr>
								<td colspan="2" id="font_small">답변</td>
							</tr>
							<tr>
								<td colspan="2">${answer.answer}</td>

							</tr>
							<tr>
								<td id="atag"><a class="btn btn-primary reviewbtn">
										숙소로 가기
									</a></td>
								<td id="atag">
									<a class="btn btn-primary reviewbtn" data-rid="${inquiry.r_inquiry_id }">
										문의 삭제
									</a>
								</td>
							</tr>
						</table>
					</div>
					<br>
					<br>
				</c:forEach>
			</div>
			<div id="hostlist" class="container tab-pane fade">
				<br> <br>
				<c:forEach items="${hrinquirylist }" var="hostlist" varStatus="status">
					<div>
						<table>
							<tr>
								<td id="font_small">보낸 사람</td>
								<td id="font_small">제목</td>
							</tr>
							<tr>
								<td>${hnicks.get(status.index)}</td>
								<td>${hostlist.title}</td>
							</tr>
							<tr>
								<td colspan="2" id="font_small">내용</td>
							</tr>
							<tr>
								<td colspan="2">${hostlist.content}</td>

							</tr>
							<tr>
								<td id="atag"><a class="btn btn-primary reviewbtn">
										숙소로 가기
									</a></td>
								<td id="atag">
									<a href="answerInquiry.jsp?inquiry_id=${rinquiry.r_inquiry_id }"
									 class="btn btn-primary reviewbtn2 confrim" >
										답변하기
									</a>
								</td>
							</tr>
						</table>
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