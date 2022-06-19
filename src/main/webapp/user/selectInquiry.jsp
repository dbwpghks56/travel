<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>



<title>Insert title here</title>

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
#rsvlist{
	width: 500px;
	height: 1000px;
}
#commentDiv{
	margin:5%;
}
p{
	margin:5%;
}
#contentTd{
	height: 90px;
	width:500px;
	white-space:pre-line;
	overflow: scroll;
}
</style>
</head>
<body>
<h1>문의와 답변</h1>
	<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#rsvlist">문의 하기</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#rsvdeletelist">문의 목록</a></li>
		</ul>

		<div class="tab-content">
			<div id="rsvlist" class="container tab-pane active">
				<p>문의 사항을 작성해주세요:</p>
   				<div id= "commentDiv">
      			<label for="comment">Comments:</label>
     			<textarea class="form-control" rows="5" id="comment"></textarea>
    			</div>
    			<button type="button" id = "commentBTN"class="btn btn-primary">제출</button>
			</div>

			<div id="rsvdeletelist" class="container tab-pane fade">
				<br> <br>
				<c:forEach items="${iList }" var = "inquiry" varStatus="status">
					<table>					
							<tr>
							<td class="bold"></td>
							<td class="value"> ${status.index+1}</td>
							</tr>
							<tr>
								<td id = "contentTd" class="value">${inquiry.content }</td>
							</tr>
							<c:choose>
							<c:when test="${inquiry.s_answer_confirm==0 }">
							<tr>
								<td class="value">아직 답변이 없습니다.</td>
								<td></td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td class="bold">관리자 아이디</td>
								<td class="value">${inquiry.manager_id }</td>
							</tr>
							<tr>
								<td class="bold">답변</td>
								<td class="value">${inquiry.answer}</td>
							</tr>
							</c:otherwise>
							</c:choose>
							
						</table>	
						<br>
				</c:forEach>
			</div>
		</div>

<script
		src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js"
		type="text/javascript"></script>
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
	
	var submit = document.querySelector("#commentBTN");
	submit.onclick = function(){
		var comment = $('#comment').val();
	  	$.ajax({
        type:"get",
        async:false, 
        url:"insertSInquiry.do",
        data : {comment: comment},
        success:function (data,textStatus){
        	if(data == 1){
        		alert("문의가 등록되었습니다. 답변을 기다려주세요!");
        		location.href = "siteInquiry.do";
        	}else{
        		alert("문의 등록 실패");
        	}
     	}
     
     	
   	});  //end ajax	
	
};
</script>


</body>
</html>