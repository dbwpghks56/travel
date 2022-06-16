<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</style>
<script type="text/javascript">
	$(function() {
		let length = $(".card").attr("data-length")
		console.log(5*length);
		let indexs = new Array();
		
		/* for(let t = 0; t = 5*length; t++) {
			indexs.push(t);
		} */
		/* console.dir(indexs); */
		$(".myform").each(function(index,item) {
			for(let i = 0; i < 5; i++) {
				let starval = Number($("input[name=cleaning_stars]").eq(i + 5 *index).val());
				let starlo = Number($("input[name=location_stars]").eq(i + 5 *index).val());
				let starsa = Number($("input[name=satisfied_stars]").eq(i + 5 *index).val());
				
				let stardb = 5 - item.attributes[1].nodeValue;
				let stardb2 = 5 - item.attributes[2].nodeValue;
				let stardb3 = 5 - item.attributes[3].nodeValue;
				
				if(starval === stardb) {
					$("input[name=cleaning_stars]").eq(i + 5 *index).attr("checked", true);
					console.log("1");
					console.log(starval + "--"+stardb);
				}
				
				if(starlo === stardb2) {
					$("input[name=location_stars]").eq(i + 5 *index).attr("checked", true);
					console.log("2");
					console.log(starlo + "--"+stardb2);
				}
				
				if(starsa === stardb3) {
					$("input[name=satisfied_stars]").eq(i + 5 *index).attr("checked", true);
					console.log("3");
					console.log(starsa + "--"+stardb3);
				}
				/* console.log($("input[name=cleaning_stars]").eq(i + 5 *index).val() + "--"+(5 - item.attributes[1].nodeValue)); */
				
			}
			
		});
		
	});
</script>

 

<script>
$(function(){

	$(".delete").click(function() {
		var review =$(this).attr("data-review");       
		if(confirm("정말 삭제 하시겠습니까?")){
			location.href="deleteReview.do?reviewid="+review ;
		}
	});
});

 
</script>

</head>
<body>
	<c:forEach items="${reviews}" var="review" varStatus="status">
		<div class="container mt-3">
			<div class="h2">
				<h2>${nicks.get(status.index)}</h2>
			</div>
			<p>${review.host_id }</p>
			
			<c:if test="${user.getManager() == 1 }">
				<button class="delete"  data-review="${review.review_id}">후기삭제</button>
			</c:if>
			
			<div class="card" style="width: 400px" data-length=${reviews.size() }>
				<img class="card-img-top" src="../uploads/${review.r_image_path}"
					alt="Card image" style="width: 100%">
				<div class="card-body myform"
					data-cleaning="${review.cleaning_stars }"
					data-location=${review.location_stars }
					data-satisfied=${review.satisfied_stars }>
					<fieldset>
						<input type="checkbox" name="cleaning_stars" value="5"
							class="rate1" disabled="disabled"><label for="rate1">★</label>
						<input type="checkbox" name="cleaning_stars" value="4"
							class="rate2" disabled="disabled"><label for="rate2">★</label>
						<input type="checkbox" name="cleaning_stars" value="3"
							class="rate3" disabled="disabled"><label for="rate3">★</label>
						<input type="checkbox" name="cleaning_stars" value="2"
							class="rate4" disabled="disabled"><label for="rate4">★</label>
						<input type="checkbox" name="cleaning_stars" value="1"
							class="rate5" disabled="disabled"><label for="rate5">★</label>
						<br>
					</fieldset>
					<fieldset>
						<input type="checkbox" name="location_stars" value="5"
							class="rate6" disabled="disabled"><label for="rate6">★</label>
						<input type="checkbox" name="location_stars" value="4"
							class="rate7" disabled="disabled"><label for="rate7">★</label>
						<input type="checkbox" name="location_stars" value="3"
							class="rate8" disabled="disabled"><label for="rate8">★</label>
						<input type="checkbox" name="location_stars" value="2"
							class="rate9" disabled="disabled"><label for="rate9">★</label>
						<input type="checkbox" name="location_stars" value="1"
							class="rate10" disabled="disabled"><label for="rate10">★</label>
						<br>
					</fieldset>
					<fieldset>
						<input type="checkbox" name="satisfied_stars" value="5"
							class="rate11" disabled="disabled"><label for="rate11">★</label>
						<input type="checkbox" name="satisfied_stars" value="4"
							class="rate12" disabled="disabled"><label for="rate12">★</label>
						<input type="checkbox" name="satisfied_stars" value="3"
							class="rate13" disabled="disabled"><label for="rate13">★</label>
						<input type="checkbox" name="satisfied_stars" value="2"
							class="rate14" disabled="disabled"><label for="rate14">★</label>
						<input type="checkbox" name="satisfied_stars" value="1"
							class="rate15" disabled="disabled"><label for="rate15">★</label>
						<br>
					</fieldset>
				</div>
			</div>
		</div>
		<br>
	</c:forEach>
</body>
</html>