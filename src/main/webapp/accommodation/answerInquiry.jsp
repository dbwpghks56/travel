<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="answerInquiry.do" method="post">
		<h1>${param.inquiry_id }</h1>
		<input type="hidden" name="inquiry_id" value="${param.inquiry_id }">
		<div class="form-floating mb-3 mt-3">
			<input type="text" class="form-control" placeholder="답변을 입력하세요" name="answer">
			<label for="answer">답변 : </label>
		</div>
		 <input type="submit" class="btn btn-success" value="답변하기">
	</form>
</body>
</html>