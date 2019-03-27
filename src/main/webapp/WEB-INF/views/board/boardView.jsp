<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center" id="boardViewDiv">
		<table id="viewTable" class="table table-bordered">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" value="${bv.b_subject }" id="b_subject" readonly="readonly">
					<input type="hidden" name="where" id="where" value="${cri.where }">
					<input type="hidden" name="field" id="field" value="${cri.field }">
				</td>
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
				<td>
					<span id="fileArea">${bv.b_file }</span>
					<input type="file" id="upfile" name="b_file">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="txtfield" readonly="readonly">${bv.b_content }</textarea></td>
			</tr>
			<tr id="btnTr">
				<th colspan=2>
					<input type="button" value="목록" onclick="showBoardList(${cri.pageNum })" class="btn btn-inverse">
					<c:if test="${sessionScope.uv.wid == bv.wid }">
						<input type="button" value="수정"	 onclick="updateFormBoard()" id="btnupdateBtn" class="btn btn-inverse">
						<input type="button" value="확인" onclick="updateConfirm(${bv.b_num},${cri.pageNum})" class="btn btn-inverse confirmBtn">
						<input type="button" value="삭제" onclick="deleteBoard(${bv.b_num})" class="btn btn-inverse deleteBtn">
						<input type="button" value="취소" onclick="updateBtnCancle()" class="btn btn-inverse updateCancle">
					</c:if>
					<c:if test="${empty sessionScope.uv.wid }">
						<c:if test="${sessionScope.uv.email == bv.email }">
							<input type="button" value="수정"	 onclick="updateFormBoard()" id="btnupdateBtn" class="btn btn-inverse">
							<input type="button" value="확인" onclick="updateConfirm(${bv.b_num},${cri.pageNum})" class="btn btn-inverse confirmBtn">
							<input type="button" value="삭제" onclick="deleteBoard(${bv.b_num})" class="btn btn-inverse deleteBtn">
							<input type="button" value="취소" onclick="updateBtnCancle()" class="btn btn-inverse updateCancle">
						</c:if>
					</c:if>
				</th>
			</tr>
		</table>
		<table id="commentTable" class="table">
			<thead>
				<tr>
					<td colspan="3">
						<textarea id="commentText"></textarea>
						<input type="button" value="등록" id="commentBtn" onclick="inputComment(${bv.b_num},${cri.pageNum })" class="btn btn-color">
					</td>
				</tr>
				<tr id="firstTr">
					<th class="cfir">작성자</th>
					<th class="csec">내용</th>
					<th class="cthi">작성시간</th>
				</tr>
			</thead>
			<tbody id="commentBody"></tbody>
		</table>
	</div>