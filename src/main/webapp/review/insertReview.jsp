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
	#myform input[name=cleaning_stars]:checked ~ label{
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=location_stars]:checked ~ label{
<<<<<<< HEAD
	    text-shadow: 0 0 0 pink;
	}
	#myform input[name=satisfied_stars]:checked ~ label{
=======
>>>>>>> refs/remotes/origin/master
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
</style>
<<<<<<< HEAD
=======
<script type="text/javascript">
	function setThumbnail(event) {
	    var reader = new FileReader();
	
	    reader.onload = function(event) {
	    	$("#thumbnail").attr("src", event.target.result);
	    	$("#thumbnail").css("display", "inline-block");
	    };
	
	    reader.readAsDataURL(event.target.files[0]);
	  }
</script>
>>>>>>> refs/remotes/origin/master
</head>
<body>
	<h1>review 입력하기 꼭 로그인하고 해주세요</h1>
	<h2>숙소 id는 실제있는 값으로 해주세요</h2>
	<form id="myform" action="insertReview.do" method="post" enctype="multipart/form-data">
		숙소 id : <input type="number" name="acco_id"> <br>
		유저 id : <p>${user.user_id }</p>
		<input type="hidden" name="user_id" value="${user.user_id }"> <br>
		내용 : <input type="text" name="content"> <br>
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
		안전? 별점 : 
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
		 <br>
<<<<<<< HEAD
		이미지 : <input type="file" name="photos"> <br>
=======
		이미지 : <input type="file" name="photos" accept="image/*" onchange="setThumbnail(event);"> <br>
		<img alt="" src="" id="thumbnail">
>>>>>>> refs/remotes/origin/master
		<input type="submit" value="전송스">
	</form>
</body>
</html>