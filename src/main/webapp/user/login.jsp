<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<h1> &emsp; ID 로그인</h1>
	<form action="login.do" method="post">
	
		<label>아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>	
			<input type="text" name="id" > <br>
		
		<label>비밀번호 &nbsp;</label>	
			<input type="password" name="password"> <br>
		
		<input type = "submit" value = "로그인">     
		<input type = "button" value = "회원가입"><a href="signUp.jsp">회원가입</a>
		<input type = "reset" value = "취소">

	</form>
	
</body>
</html>