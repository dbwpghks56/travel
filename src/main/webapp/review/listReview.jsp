<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/mainnav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/travel/css/goodcss.css">
<title>Insert title here</title>
<style type="text/css">
.myform input[type=checkbox] {
	display: none;
}

.myform label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 pink;
}

.myform input[name=cleaning_stars]:checked ~ label {
	text-shadow: 0 0 0 #f0f0f0;
}

.myform input[name=location_stars]:checked ~ label {
	text-shadow: 0 0 0 #f0f0f0;
}

.myform input[name=satisfied_stars]:checked ~ label {
	text-shadow: 0 0 0 #f0f0f0;
}

.delete {
	margin-bottom: 5px;
	margin-left: 320px;
}

.name {
	width: 290px;
}

.h2 {
	width: 300px;
}

#wholecontainer {
	clear: both;
}

.rankstar {
	display: inline-block;
}
table {
	width: 1200px;
}
#title {
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
<script type="text/javascript">
	$(function() {
		let length = $(".card").attr("data-length")
		console.log(5 * length);
		let indexs = new Array();

		/* for(let t = 0; t = 5*length; t++) {
			indexs.push(t);
		} */
		/* console.dir(indexs); */
		$(".myform").each(
				function(index, item) {
					for (let i = 0; i < 5; i++) {
						let starval = Number($("input[name=cleaning_stars]")
								.eq(i + 5 * index).val());
						let starlo = Number($("input[name=location_stars]").eq(
								i + 5 * index).val());
						let starsa = Number($("input[name=satisfied_stars]")
								.eq(i + 5 * index).val());

						let stardb = 5 - item.attributes[1].nodeValue;
						let stardb2 = 5 - item.attributes[2].nodeValue;
						let stardb3 = 5 - item.attributes[3].nodeValue;

						if (starval === stardb) {
							$("input[name=cleaning_stars]").eq(i + 5 * index)
									.attr("checked", true);
							console.log("1");
							console.log(starval + "--" + stardb);
						}

						if (starlo === stardb2) {
							$("input[name=location_stars]").eq(i + 5 * index)
									.attr("checked", true);
							console.log("2");
							console.log(starlo + "--" + stardb2);
						}

						if (starsa === stardb3) {
							$("input[name=satisfied_stars]").eq(i + 5 * index)
									.attr("checked", true);
							console.log("3");
							console.log(starsa + "--" + stardb3);
						}
						/* console.log($("input[name=cleaning_stars]").eq(i + 5 *index).val() + "--"+(5 - item.attributes[1].nodeValue)); */

					}

				});

	});
</script>



<script>
	$(function() {

		$(".delete").click(function() {
			var review = $(this).attr("data-review");
			if (confirm("정말 삭제 하시겠습니까?")) {
				location.href = "deleteReview.do?reviewid=" + review;
				window.location.reload();
				
			}
		});
	});
</script>

</head>
<body>
	<div id="wholecontainer">
		<div class="container mt-3">
			<h1 id="title">Review List</h1>
			<br>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#reviewlist">내가 쓴 리뷰</a></li>
			</ul>

			<div class="tab-content">
				<div id="reviewlist" class="container tab-pane active">
					<br>
					<div class="d-flex flex-wrap justify-content-around mb-3">
						<c:forEach items="${reviews }" var="review" varStatus="status">
							<div class="p-2">
								<table>
									<tr>
										<td id="font_small">호스트</td>
										<td id="font_small">예약번호</td>
									</tr>
									<tr>
										<td>${nicks.get(status.index)}</td>
										<td>${review.rsv_no}</td>
									</tr>
									<tr>
										<td colspan="2" id="font_small">내용</td>
									</tr>
									<tr>
										<td colspan="2">${review.content}</td>

									</tr>
									<tr>
										<td colspan="2" id="font_small">별점</td>
									</tr>
									<tr>
										<td colspan="2">
											<div style="width: 400px" data-length=${reviews.size() }>
												<div class="myform"
													data-cleaning="${review.cleaning_stars }"
													data-location=${review.location_stars }
													data-satisfied=${review.satisfied_stars }>
													깔끔 :
													<fieldset class="rankstar">
														<input type="checkbox" name="cleaning_stars" value="5"
															class="rate1" disabled="disabled"><label
															for="rate1">★</label> <input type="checkbox"
															name="cleaning_stars" value="4" class="rate2"
															disabled="disabled"><label for="rate2">★</label>
														<input type="checkbox" name="cleaning_stars" value="3"
															class="rate3" disabled="disabled"><label
															for="rate3">★</label> <input type="checkbox"
															name="cleaning_stars" value="2" class="rate4"
															disabled="disabled"><label for="rate4">★</label>
														<input type="checkbox" name="cleaning_stars" value="1"
															class="rate5" disabled="disabled"><label
															for="rate5">★</label> <br>
													</fieldset>
													<br> 위치 :
													<fieldset class="rankstar">
														<input type="checkbox" name="location_stars" value="5"
															class="rate6" disabled="disabled"><label
															for="rate6">★</label> <input type="checkbox"
															name="location_stars" value="4" class="rate7"
															disabled="disabled"><label for="rate7">★</label>
														<input type="checkbox" name="location_stars" value="3"
															class="rate8" disabled="disabled"><label
															for="rate8">★</label> <input type="checkbox"
															name="location_stars" value="2" class="rate9"
															disabled="disabled"><label for="rate9">★</label>
														<input type="checkbox" name="location_stars" value="1"
															class="rate10" disabled="disabled"><label
															for="rate10">★</label> <br>
													</fieldset>
													<br> 안전 :
													<fieldset class="rankstar">
														<input type="checkbox" name="satisfied_stars" value="5"
															class="rate11" disabled="disabled"><label
															for="rate11">★</label> <input type="checkbox"
															name="satisfied_stars" value="4" class="rate12"
															disabled="disabled"><label for="rate12">★</label>
														<input type="checkbox" name="satisfied_stars" value="3"
															class="rate13" disabled="disabled"><label
															for="rate13">★</label> <input type="checkbox"
															name="satisfied_stars" value="2" class="rate14"
															disabled="disabled"><label for="rate14">★</label>
														<input type="checkbox" name="satisfied_stars" value="1"
															class="rate15" disabled="disabled"><label
															for="rate15">★</label> <br>
													</fieldset>
												</div>
											</div>
										</td>

									</tr>
									<tr>
										<td id="atag"><a class="btn btn-primary reviewbtn" href="/travel/reservation/rsvdetail.do?rsv_no=${review.rsv_no }">
												예약보기 </a></td>
										<td id="atag">
											<%-- <c:if test="${user.getManager() == 1 }">
												<button class="delete btn btn-primary reviewbtn" data-review="${review.review_id}">후기삭제</button>
											</c:if> --%>
											<c:if test="${user.user_id == review.user_id }">
												<button class="delete btn btn-primary reviewbtn" data-review="${review.review_id}">후기삭제</button>
											</c:if></td>
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
	</div>
</body>
</html>