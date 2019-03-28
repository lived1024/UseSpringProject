<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach items="${cr }" var="arr">
	<a href="${arr.address }">
		<c:if test="${fn:length(arr.title) <= 27 }">
			${arr.title }
		</c:if>
		<c:if test="${fn:length(arr.title) > 27 }">
			${fn:substring(arr.title,0,25) } ·····
		</c:if>
	</a>
	<br><br>
</c:forEach>