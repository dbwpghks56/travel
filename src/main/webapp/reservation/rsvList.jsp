<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>
<script>

</script>
<style>
body{
	width: 100%;
	margin: 0 auto;
	padding: 50px;
	text-align: center;
}

table{ margin-left: auto; margin-right: auto; width: 500px; height: 100px;} 
table,td{ 

border-top: 1px solid gray;
border-bottom: 1px solid gray;
border-collapse: collapse;
padding: 10px;

}


a{text-decoration: none;}
a:hover {text-decoration: underline;}

td:not(#font_small,#atag){font-weight: bold;}
#font_small{ font-size: 12px; text-align:left; color: gray;}
#atag{font-size: 14px; text-align: left;}

</style>
</head>
<body>
<h1>예약목록</h1>
	<c:forEach items="${rsvlist }" var="rsv">
	<div>
	<table>
	<tr>
	<td >${rsv.accommodation_name }</td>
	<td >${rsv.room_name }</td>
	</tr>
	<tr>
	<td colspan="2">${rsv.check_in} ~ ${rsv.check_out}</td>
	</tr>
	<tr>
	<td id="font_small">예약일</td>
	<td id="font_small">예약번호</td>
	</tr>
	<tr>
	<td>${rsv.rsv_date}</td>
	<td>${rsv.rsv_no}</td>
	</tr>
	<tr>
	<td id="font_small">상태</td>
	<td id="font_small">금액</td>
	</tr>
	<tr>
	<td>${rsv.rsv_status}</td>
	<td>${rsv.totalprice}원</td>
	</tr>
	<tr>
	<td id="atag"><a href="rsvdetail.do?rsv_no=${rsv.rsv_no}">상세보기</a></td>
	<td id="atag"><a>리뷰작성</a></td>
	</tr>
	</table>
	</div>	
	<br><br>
	</c:forEach>
	
	<hr>
	<h1>예약 취소 list</h1>
	<c:forEach items="${rsvdeletelist }" var="delete">
	<div>
	<table>
	<tr>
	<td >${delete.accommodation_name }</td>
	<td >${delete.room_name }</td>
	</tr>
	<tr>
	<td colspan="2">${delete.check_in} ~ ${delete.check_out}</td>
	</tr>
	<tr>
	<td id="font_small">예약일</td>
	<td id="font_small">예약번호</td>
	</tr>
	<tr>
	<td>${delete.rsv_date}</td>
	<td>${delete.d_rsv_no}</td>
	</tr>
	<tr>
	<td id="font_small" colspan="2">금액</td>
	</tr>
	<tr>
	<td>${delete.totalprice}원</td>
	</tr>
	<tr>
	<td id="atag" colspan="2"><a href="rsvdetail.do?rsv_no=${delete.d_rsv_no}">상세보기</a></td>
	</tr>
	</table>
	</div>	
	<br><br>
	</c:forEach>
	
</body>
</html>