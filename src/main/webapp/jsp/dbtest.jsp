<%@page import="travel.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String message = "";
    	Connection conn = DBUtil.getConnection();
    	if(conn != null) {
    		message = "성공";
    	} else {
    		message = "실패";
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DB Test</h1>
	<h2>again</h2>
	<%= message %>
	<h1>test</h1>
	<h2>min test</h2>
</body>
</html>