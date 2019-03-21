<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	        			<c:forEach   items="${arr }" var="list">
	        				<tr>
	        					<th>${list.lname }</th>
								<th>${list.r_count }</th>
								<th>${list.r_start }</th>
								<th>${list.r_end }</th>
								<th>${list.totalprice }</th>
								
								<c:if test="${list.state ==1 }">
									<th>대여중</th>
								</c:if>
								<c:if test="${list.state ==2 }">
									<th>반납진행</th>
								</c:if>
								<c:if test="${list.state ==3 }">
									<th>반납완료</th>
								</c:if>
	        				</tr>
	        			</c:forEach>