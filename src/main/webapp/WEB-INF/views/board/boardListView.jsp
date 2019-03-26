<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div id="boardListDiv">
		        <table class="table table-hover boardListTable">
		        	<thead>
	        			<c:if test="${list == 3 }">
			        		<tr>
			        			<th colspan="4">
			        				<input type="button" onclick="writeForm()" value="글쓰기" class="btn btn-success">
			        			</th>
			        		</tr>
	        			</c:if>
			        	<tr>
			        		<th class="boardFirst">번호</th>
							<th class="boardSecond">제목</th>
							<th class="boardThird">작성자</th>
							<th class="boardFour">작성일</th>
							<th class="boardFive">조회수</th>
			        	</tr>
		        	</thead>
		        	<tbody id="boardTBody">
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
		        	</tbody>
		        </table>
	        </div>
	        <div align="center">
	        	<form id="searchForm">		<!-- 검색 -->
		        	<select name="where" id="where">
		        		<option value="b_subject">제목</option>
		        	</select>
		        	<input type="text" name="field" id="field" value="${cri.field }">
		        	<input type="button" value="검색" onclick="showBoardList(${pageNum})" class="btn btn-inverse">
	        	</form>
	        	<br>
	        <!-- 페이지 설정 -->
	        	<c:if test="${cri.pageNum > 1 }">
	        		<input type="button" value="≪" onclick="showBoardList(${pageNum-blockpage})" class="btn btn-info">
	        	</c:if>
	        	<c:forEach begin="${startPage }" end="${endPage }" var="i">
	        		<c:if test="${cri.pageNum == i }">
	        			&nbsp;&nbsp;${i }&nbsp;&nbsp;
	        		</c:if>
	        		<c:if test="${cri.pageNum != i }">
	        			<input type="button" value="${i }" onclick="showBoardList(${i})" class="btn btn-info">
	        		</c:if>
	        	</c:forEach>
	        	<c:if test="${cri.pageNum < endPage }">
	        		<input type="button" value="≫" onclick="showBoardList(${pageNum+blockpage})" class="btn btn-info">
	        	</c:if>
	        </div>

