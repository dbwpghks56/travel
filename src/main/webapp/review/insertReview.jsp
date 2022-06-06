<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
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
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 pink;
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=reviewStar]:checked ~ label{
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=reviewStar2]:checked ~ label{
	    text-shadow: 0 0 0 pink;
	}
</style>
 <script type="text/javascript">
	$(()=> {
		$("input[name=reviewStar]").click(() => {
			let vals = $("input[name=reviewStar]:checked").val();
			$("#starscore").val(vals);
			console.log(vals);
		});
		$("input[name=reviewStar2]").click(() => {
			$(".starscore").html($("input[name=reviewStar2]:checked").val());
			console.log($("input[name=reviewStar2]:checked").val());
		});
	});
</script>
</head>
<body>
	<h1>review 입력하기 꼭 로그인하고 해주세요</h1>
	<h2>숙소 id는 실제있는 값으로 해주세요</h2>
	<form id="myform" action="review.do" method="post" enctype="multipart/form-data">
		숙소 id : <input type="number" name="acco_id"> <br>
		유저 id : <input type="text" name="user_id" disabled="disabled" value="${user.user_id }"> <br>
		내용 : <input type="text" name="content"> <br>
		깔끔별점 : <input type="number" name="cleaning_stars">
		<fieldset>
			<input type="radio" name="reviewStar" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5"><label
				for="rate5">★</label>
		</fieldset> <input id="starscore" type="number" disabled="disabled" value="0"> <br>
		위치별점 : <input type="number" name="location_stars">
		<fieldset>
			<input type="radio" name="reviewStar2" value="5" id="rate6"><label
				for="rate6">★</label>
			<input type="radio" name="reviewStar2" value="4" id="rate7"><label
				for="rate7">★</label>
			<input type="radio" name="reviewStar2" value="3" id="rate8"><label
				for="rate8">★</label>
			<input type="radio" name="reviewStar2" value="2" id="rate9"><label
				for="rate9">★</label>
			<input type="radio" name="reviewStar2" value="1" id="rate10"><label
				for="rate10">★</label>
		</fieldset>  <br>
		안전? 별점 : <input type="number" name="satisfied_stars"> <br>
		이미지 : <input type="file" name="photos"> <br>
		<input type="submit" value="전송스">
	</form>
</body>
</html>