<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{margin: 0;}
a{text-decoration: none; color:gray;}
a:hover {text-decoration: underline;}
header{
margin: auto;
width: 1080px;
height: 215px;
display: flex;
align-items: center;
position: relative;}
.main_header{
width:100%;
text-align:center;
font-size: 50px;}
.links{
position: absolute;
top: 0;
right: 0;
}
.link_text{
font-size: 10px;
margin-left: 5px;}

</style>
</head>
<body>
<header>
<div class="links">
<a href="user/login.jsp" class="link_text">로그인</a>
<a href="user/signUp.jsp" class="link_text">회원가입</a>
</div>
<h1 class="main_header">Would You Travel</h1>
</header>


</body>
</html>