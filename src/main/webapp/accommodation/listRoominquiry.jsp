<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(() => {
		$(".confrim").on("click", function()  {
			if("${user.user_id}" != $(this).attr("data-host")) {
				alert("본인에게 온 문의가 아닙니다.");
				return false;
			}
		});
	});
</script>
</head>
<body>
	<c:forEach items="${rinquirylist }" var="rinquiry" varStatus="status">
		문의 번호 : ${rinquiry.r_inquiry_id } <br>
		호스트 : ${rinquiry.host_id} <br>
		닉네임 : ${nicks.get(status.index) } <br>
		제목 : ${rinquiry.title } <br>
		내용 : ${rinquiry.content } <br>
		답변 : ${rinquiry.answer } <br>
		<a class="confrim" href="answerInquiry.jsp?inquiry_id=${rinquiry.r_inquiry_id }" data-host="${rinquiry.host_id}">문의 답변하기</a>
		<br>
	</c:forEach>
</body>
</html>