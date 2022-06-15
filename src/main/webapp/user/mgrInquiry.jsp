<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:forEach items="${iList }" var = "inquiry" varStatus="status">
	${inquiry.inquiry_id }번 문의<br> 
	${inquiry.content }
	<hr>
	<c:choose>
	<c:when test="${inquiry.s_answer_confirm == 1 }">
	답변 완료
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
	
	</c:choose>
	<hr>
</c:forEach>
</body>
</html>