<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="3; url=rsvdetail.do?rsv_no=${rsv_no }"> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style >
body{ background-color: #FFE6E6;}
.box{
display: flex;
justify-content: center;
align-items: center;
min-height: 100vh;
	
}
.messgae{
font-size: 4em;
font-family: 'Do Hyeon', sans-serif;
text-shadow: 1px 1px 1px red;
color: pink;

}
</style>
</head>
<body>
<div class="box">
<div class="messgae">
${message} <br>
잠시만 기다려 주세요
</div>
</div>

</body>
</html>