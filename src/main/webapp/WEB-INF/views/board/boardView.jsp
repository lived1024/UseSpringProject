<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center" id="boardViewDiv">
		<table id="viewTable" class="table">
			<tr>
				<td>제목</td>
				<td>${bv.b_subject }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<c:choose>
					<c:when test="${empty bv.wid }">
						<td>${bv.email }</td>
					</c:when>
					<c:when test="${!empty bv.wid }">
						<td>${bv.wid }</td>
					</c:when>
				</c:choose>
			</tr>
			<tr>
				<td>조회수${where }</td>
				<td>${bv.readcount }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${bv.b_regdate }</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>${bv.b_file }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="txtfield">${bv.b_content }</textarea></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" value="목록" onclick="showBoardList(${param.pageNum })" class="btn btn-inverse">
				</td>
			</tr>
		</table>
	</div>