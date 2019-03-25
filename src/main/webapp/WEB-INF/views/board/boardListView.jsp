<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		        	<c:forEach items="${arr }" var="list">
		        		<tr>
		        			<td class="boardFirst">${list.b_num }</td>
		        			<td class="boardSecond">${list.b_subject }</td>
		        			<c:choose>
		        				<c:when test="${!empty list.wid or list.wid != ''}">
				        			<td class="boardThird">${list.wid }</td>	        				
		        				</c:when>
		        				<c:when test="${empty list.wid or list.wid == '' }">
		        					<td class="boardThird">${list.email }</td>
		        				</c:when>
		        			</c:choose>
		        			<td class="boardFour">${list.b_regdate }</td>
		        			<td class="boardFive">${list.readcount }</td>
		        		</tr>
		        	</c:forEach>