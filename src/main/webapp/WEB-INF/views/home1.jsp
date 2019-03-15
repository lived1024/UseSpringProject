<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<script>
		alert("${msg}");
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>
${sessionScope.uv.name }
</body>
</html>
