<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/mainnav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Lobster+Two&family=Oswald&family=Poppins&family=Raleway&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
body {
	padding-left: 5%;
	padding-right: 5%;
	margin: 0 auto;
	text-align: center;
}

textarea {
	width: 95%;
	height: 6.25em;
	resize: none;
}

.btn {
	width: 80px;
	height: 50px;
	border: none;
	font-size: 1em;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
}

.btn:hover {
	border: 2px solid black;
}

.bold {
	font-weight: bold;
}

.atag {
	text-decoration: none;
}

.atag:hover {
	text-decoration: underline;
}

.value {
	text-align: left;
}
/* .btnlist{
padding-left: 50px;
}
.btndelete{

} */
#contentTd {
	height: 150px;
	width: 100%;
	white-space: pre-line;
	overflow: scroll;
}

#answerTD {
	height: 90px;
	width: 500px;
	white-space: pre-line;
	overflow: scroll;
}

#noInquiry {
	background-color: pink;
}

#answerbox {
	width: 500px;
	margin: 10% auto;
}
#wholecontainer {
	clear: both;
}
</style>
</head>
<body>
	<div id="wholecontainer">
		<h1>문의 목록</h1>
		<hr>
		<c:forEach items="${iList }" var="inquiry" varStatus="status">
			<div id="answerbox">
				<div id="noInquiry">문의번호 ${inquiry.inquiry_id }</div>
				<hr>

				<div id="contentTd">
					내용<br> ${inquiry.content }
				</div>

				<c:choose>
					<c:when test="${inquiry.s_answer_confirm eq 1 }">
						<hr>
						<div id="answerTd">
							완료됨<br>
							<textarea id="answerValue" name="request">${inquiry.answer }</textarea>
							<input class="btn" type="submit" value="수정" id="updateAjax"
								data-no="${inquiry.inquiry_id}">
						</div>
					</c:when>
					<c:otherwise>
						<hr>
						<div>
							답변달기
							<textarea id="answerValue" name="request"></textarea>
							<input class="btn" type="submit" value="제출" id="updateAjax"
								data-no="${inquiry.inquiry_id}">
						</div>
					</c:otherwise>

				</c:choose>
				<br>
			</div>
		</c:forEach>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js"
			type="text/javascript"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			var btn = document.querySelector("#updateAjax");
			btn.onclick = function() {
				var answer = $('#answerValue').val();
				$.ajax({
					type : "get",
					async : false,
					url : "updateAnswer.do",
					data : {
						iId : $(this).attr("data-no"),
						answer : answer
					},
					success : function(data, textStatus) {
						alert("답변완료");
						location.href = "siteInquiry.do";
					}

				}); //end ajax	

			};
		</script>
	</div>
</body>
</html>