<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>

body {
	font-family: Arial;
}
h1{
	margin-left: 10%;
	margin-top:6%;
}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  border-top:0px;
  background-color: white;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  border: 1px solid #ccc;
}
#firstTab{
	margin-left:9%;
}
/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	margin-top :3%;
  display: none;
  padding: 6px 12px;
}
</style>
</head>
<body>
<h1>문의와 답변</h1>
<div class="tab">
  <button id = "firstTab" class="tablinks" onclick="openCity(event, 'London')">문의 작성하기</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">문의 보기</button>
</div>

<div id="London" class="tabcontent">
  <div class="container mt-3">
  <p>문의 사항을 작성해주세요:</p>
    <div class="mb-3 mt-3">
      <label for="comment">Comments:</label>
     <textarea class="form-control" rows="5" id="comment"></textarea>
    </div>
    <button type="button" id = "commentBTN"class="btn btn-primary">제출</button>
</div>
</div>

<div id="Paris" class="tabcontent">
  <c:forEach items="${iList }" var = "inquiry" varStatus="status">
	${status.index }번 문의<br> 
	${inquiry.content }
	<hr>
	<c:choose>
	<c:when test="${inquiry.s_answer_confirm == 1 }">
	${inquiry.answer }<br>	
	${inquiry.manager_id }	
	</c:when>
	<c:otherwise>
	답변이 진행중입니다. <br>
	조금만 더 기다려 주세요.
	</c:otherwise>
	
	</c:choose>
	<hr>
</c:forEach>
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
	var tabContent = document.querySelector(".tabcontent");
	submit.onclick = function(){
		var comment = $('#comment').val();
	  	$.ajax({
        type:"get",
        async:false, 
        url:"insertSInquiry.do",
        data : {comment: comment},
        success:function (data,textStatus){
        	tabContent.style.display = "none";
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