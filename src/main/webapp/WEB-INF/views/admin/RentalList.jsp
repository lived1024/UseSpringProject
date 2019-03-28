<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<c:forEach items="${arr }" var="list">
				<tr>
				<th>${list.lname }</th>
				<th>${list.r_count }</th>
				<th>${list.r_start }</th>
				<th>${list.r_end }</th>
				<th>${list.totalprice }</th>
				<c:choose>								
					<c:when test="${list.state == 1 }">
						<th>승인 대기</th>
					</c:when>
					<c:when test="${list.state == 2 }">
						<th>대여 승인</th>
					</c:when>
					<c:when test="${list.state == 3 }">
						<th>대 여 중</th>
					</c:when>
					<c:when test="${list.state == 4 }">
						<th>상품 점검</th>
					</c:when>
					<c:when test="${list.state == 5 }">
						<th>정상 처리 완료</th>
					</c:when>
					<c:when test="${list.state == -1 }">
						<th>연 체 중</th>
					</c:when>
					<c:when test="${list.state == 11 }">
						<th>취소 신청</th>
					</c:when>
					<c:when test="${list.state == 12 }">
						<th>취소 완료</th>
					</c:when>
				</c:choose>
				
				<c:choose>
					<c:when test="${list.state == 1 }">
						<th>
							<input type="button" value="대여 승인" onclick="Raccept(${list.rno})" class="btn btn-warning">
						</th>
					</c:when>
					<c:when test="${list.state == 2 }">
						<th>
							<input type="button" value="대여 완료" onclick="Rconfirm(${list.rno})" class="btn btn-warning">
						</th>
					</c:when>
					<c:when test="${list.state == 3 or list.state == -1 }">
						<th>
							<input type="button" value="반납 확인" onclick="confirmReturn(${list.rno})" class="btn btn-danger">
						</th>
					</c:when>
					<c:when test="${list.state == 11 }">
						<th>
							<input type="button" value="취소 확인" onclick="conCancel(${list.rno})" class="btn btn-warning">
						</th>
					</c:when>
					<c:when test="${list.state == 4 }">
						<th>
							<input type="button" value="점검 완료" onclick="checkLaptop(${list.rno})" class="btn btn-danger">
						</th>
					</c:when>
					<c:otherwise>
						<th></th>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>