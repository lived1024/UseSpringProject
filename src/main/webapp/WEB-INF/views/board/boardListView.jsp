<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		        	<c:forEach items="${list }" var="list">
		        		<tr>
		        			<td class="boardFirst">${list.b_num }</td>
		        			<td class="boardSecond">${list.b_subject }</td>
		        			<c:choose>
		        				<c:when test="${!empty list.b_wid or list.b_wid != ''}">
				        			<td class="boardThird">${list.b_wid }</td>	        				
		        				</c:when>
		        				<c:when test="${empty list.b_wid or list.b_wid == '' }">
		        					<td class="boardThird">${list.b_nid }</td>
		        				</c:when>
		        			</c:choose>
		        			<td class="boardFour">${list.regdate }</td>
		        			<td class="boardFive">${list.readcount }</td>
		        		</tr>
		        	</c:forEach>